import psycopg2
import sqlite3
import json
from flask import Flask, jsonify
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
        value_to_add = (1,'test student', 19, "student adress")
        cur.execute('''INSERT INTO Student (ROLL, NAME, AGE, ADDRESS) VALUES (%s, %s, %s, %s) ON CONFLICT (ROLL) DO NOTHING;''', value_to_add)
        conn.commit()

# def test_init_db(db_parameters):
#     with psycopg2.connect(
#             user = db_parameters['user'],
#             password = db_parameters['password'],
#             host = db_parameters['host'],
#             port = db_parameters['port'],
#             database = db_parameters['database']) as conn:
        
#         cur = conn.cursor()
#         res = cur.execute("SELECT * from postgres.student;").fetchone()

if __name__ == "__main__":
    db_parameters = {
        "user" : "postgres",
        "password" : "password",
        "host" : "my_python_app_db",
        "port" : "5432",
        "database" : "postgres"
    }
    # At first start initdb
    initdb(db_parameters)
    # test_init_db(db_parameters)

    # Then start API 
    app = Flask(__name__)
    @app.route('/', methods=['GET'])
    def index():
        with psycopg2.connect(
            user = db_parameters['user'],
            password = db_parameters['password'],
            host = db_parameters['host'],
            port = db_parameters['port'],
            database = db_parameters['database']) as conn:
        
            cur = conn.cursor()
            cur.execute("SELECT * from Student;")
            res = cur.fetchone()
            result = jsonify(res)

        return result

    app.run(debug=True, host='0.0.0.0')
    