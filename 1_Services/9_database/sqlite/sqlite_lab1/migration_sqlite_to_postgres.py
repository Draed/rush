import psycopg2, sqlite3, sys
 
# The idea here is to get data from sqlite as Python object and then add them to postgresql database

def cleanup_sql_req(req):
    req = req.replace(" INTEGER", "", 1)
    req = req.replace("AUTOINCREMENT", "")
    req = req.replace("INTEGER", "INT")
    req = req.replace("id PRIMARY KEY", "ID SERIAL PRIMARY KEY")
    # req = req.replace(")", ");")
    return req

def cleanup_sql_row(row):
    row = list(row)
    if len(row):
        for value_index in range(len(row)):
            if value_index == 10 or value_index == 7:
                if row[value_index] == 0 :
                    row[value_index] = False
                elif row[value_index] == 1:
                    row[value_index] = True 
    return row

sqdb='rush_database_prod_v1.db'
pgdb='postgres'
pguser='postgres'
pgpswd='password'
pghost='192.168.1.40'
pgport='5432'
pgschema='public'
 
consq=sqlite3.connect(sqdb)
cursq=consq.cursor()
tabnames=["rush", "task", "pause", "meeting", "aar"]

for table in tabnames:
    cursq.execute("SELECT sql FROM sqlite_master WHERE type='table' AND name = ?;", (table,))
    create = cleanup_sql_req(cursq.fetchone()[0])
    cursq.execute("SELECT * FROM %s;" %table)
    rows=cursq.fetchall()
    if len(rows):
        colcount=len(rows[0])
    else:
        colcount = 0
    pholder='%s,'*colcount
    newholder=pholder[:-1]
 
    try:
        with psycopg2.connect(database=pgdb, user=pguser, password=pgpswd,
                               host=pghost, port=pgport) as conpg:
 
            curpg = conpg.cursor()
            curpg.execute("SET search_path TO %s;" %pgschema)
            curpg.execute("DROP TABLE IF EXISTS %s CASCADE;" %table)
            curpg.execute(create)

            rows = list(map(lambda x : cleanup_sql_row(x), rows))

            curpg.executemany("INSERT INTO %s VALUES (%s);" % (table, newholder),rows)
            conpg.commit()
            print('Created', table)
 
    except psycopg2.DatabaseError as e:
        print ('Error %s' % e) 
        sys.exit(1)
 
 
consq.close()


