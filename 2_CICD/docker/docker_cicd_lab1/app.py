import psycopg2, sqlite3

# initdb 
def initdb(db_parameters):

    with psycopg2.connect(
            user = db_parameters['user'],
            password = db_parameters['password'],
            host = db_parameters['host'],
            port = db_parameters['port'],
            database = db_parameters['database']) as conn:
        
        cur = conn.cursor()
        cur.execute('''CREATE TABLE IF NOT EXISTS Student
                (ROll INT PRIMARY KEY     NOT NULL,
                NAME           TEXT    NOT NULL,
                AGE            INT     NOT NULL,
                ADDRESS        CHAR(50)
                        );''')

def test_init_db(db_parameters):
    with psycopg2.connect(
            user = db_parameters['user'],
            password = db_parameters['password'],
            host = db_parameters['host'],
            port = db_parameters['port'],
            database = db_parameters['database']) as conn:
        
        cur = conn.cursor()
        res = cur.execute("SELECT * from my_python_app_db.student;").fetchone()

        res = cur.execute("SELECT * from my_python_app_db.student;").fetchone()
        print(res)

if __name__ == "__main__":
    db_parameters = {
        "user" : "postgres",
        "password" : "password",
        "host" : "192.168.1.40",
        "port" : "5432",
        "database" : "postgres"
    }
    # At first start initdb
    initdb(db_parameters)
    test_init_db(db_parameters)
    