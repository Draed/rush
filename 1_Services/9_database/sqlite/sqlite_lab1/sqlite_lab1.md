# Sqlite lab 1

## Description

Transfer data from sqlite database to postgrsql database

## Usage 

### Solution 1 : dump and import 

- First create the dump of sqlite database
```
sqlite3 rush_database_prod_v1.db '.output rush_db.sql'
sqlite3 rush_database_prod_v1.db '.dump' > rush_db.sql
```

-  Then Create the postgresql image that that will load the previous dump at start
```
export POSTGRES_PASSWORD=password
docker build -t dump_lab_database:1 . && \
docker run -d --rm --name dump_db_lab_container -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD dump_lab_database:1
```

**Result : Fail cause the sqlite dump does not work with postgresql syntax**

### Solution 2 : pgloader

-  Use [pgloader](https://hub.docker.com/r/dimitri/pgloader/) to make the migration (with docker cp) :
```
docker run --rm -it dimitri/pgloader:latest \
     pgloader \
       rush_database_prod_v1.db \
       pgsql://postgres:$POSTGRES_PASSWORD@dump_db_lab_container/dbname
```

**Result : Fail because only compatible with amd64 platerform : no raspberry here**

### Solution 3 : python script

- Start a simple postgresql database that will receive data from python script
```
export POSTGRES_PASSWORD=password 
docker run -d --rm --name dump_db_lab -p 5432:5432 -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD postgres:15.1-alpine
```

- Start the migration python script :
```
virtual env & \
source venv/bin/activate & \
pip3 install -r requirements.txt & \
python migration_sqlite_to_postgres.py
```

- Finally test it :
```
docker exec -it dump_db_lab /bin/sh
psql -U postgres
psql \l
\c postgres
SELECT * FROM rush;
```

**Result :** 
```
postgres=# \l
                                                List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    | ICU Locale | Locale Provider |   Access privileges   
-----------+----------+----------+------------+------------+------------+-----------------+-----------------------
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | 
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | =c/postgres          +
           |          |          |            |            |            |                 | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | =c/postgres          +
           |          |          |            |            |            |                 | postgres=CTc/postgres
(3 rows)
postgres=# \c postgres
You are now connected to database "postgres" as user "postgres".
postgres=# SELECT * FROM rush;
 id |                      name                      |                                                                                      description                                                                                      |   type   |   tag   | initial_duration | level |         start_time         |          end_time          | real_duration  | achieved |                                     markdown_path                                     
----+------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------+---------+------------------+-------+----------------------------+----------------------------+----------------+----------+---------------------------------------------------------------------------------------
  1 | Docker - Back to basics                        | Re-learning docker basic component                                                                                                                                                    | Learning | system  | 3 hours          | easy  | 2021-01-05 20:30:08.784078 | 2021-01-05 23:35:30.672048 | 3:05:21.887970 | t        | 
  2 | Docker - Back to basics part 2                 | Re-learning docker basic component                                                                                                            
```

## Source : 

- sqlite dump tutorial : https://www.sqlitetutorial.net/sqlite-dump/

- Data migration from sqlite to postgresql : https://atcoordinates.info/2017/07/24/copying-tables-from-sqlite-to-postgresql/

- Postgresql tutorial : https://www.tutorialspoint.com/postgresql/index.htm