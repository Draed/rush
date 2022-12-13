# Mysql lab 1

## Description 

This lab goal is to deploy 2 dockerized mysql database (with default or really simple configuration) And then try to backup them by diffrent way : 
- With docker exec
- Ansible playbook.

Credit to (mahendra-shinde)[https://github.com/mahendra-shinde/mysql-db-docker] for his repo "MySQL Sample Database Container Images".

## Usage 

### Step 0 : Build the custom mysql docker image

```
docker build -t my_custom_mysql_db:1 .
```

### Step 1 : Create the mysql container

- Start the database with docker run :
```
docker run -d --rm --name mysql1 \
    -e MYSQL_DATABASE=hr \
    -e MYSQL_USER=mahendra \
    -e MYSQL_PASSWORD=pass@1234 \
    -e MYSQL_ROOT_PASSWORD=roPass@1234 \
    -p 127.0.0.1:3306:3306 \
    -v /home/ottomatic/Temp/mysql1:/var/lib/mysql my_custom_mysql_db:1  

docker run -d --rm --name mysql2 \
    -e MYSQL_DATABASE=hr \
    -e MYSQL_USER=mahendra \
    -e MYSQL_PASSWORD=pass@1234 \
    -e MYSQL_ROOT_PASSWORD=roPass@1234 \
    -p 127.0.0.1:3307:3306 \
    -v /home/ottomatic/Temp/mysql2:/var/lib/mysql mysql:8.0.31-debian 
```

- Or with docker compose :
```
docker-compose up
```

At this we should have 2 containers (mysql1 and mysql2) :
```
docker ps
CONTAINER ID   IMAGE                  COMMAND                  CREATED         STATUS         PORTS                                 NAMES
7a9868561c1d   mysql:8.0.31-debian    "docker-entrypoint.s…"   4 seconds ago   Up 1 second    33060/tcp, 127.0.0.1:3307->3306/tcp   mysql2
6e6574e39e83   my_custom_mysql_db:1   "docker-entrypoint.s…"   4 minutes ago   Up 3 minutes   127.0.0.1:3306->3306/tcp, 33060/tcp   mysql1
```

- Check that mysql2 is empty :
```
docker exec mysql2 mysql -umahendra --password=${MYSQL_PASSWORD} -e 'USE hr; SHOW TABLES;'
```

If you get "ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)" error, you are going to fast, the database is not yet ready, wait a bit (5-10 sec). The 

- And check that mysql1 has data : 
```
docker exec mysql1 mysql -umahendra --password=${MYSQL_PASSWORD} -e 'USE hr; SELECT * FROM employees LIMIT 10;'
```

### Step 2 : Try dump and restore with docker exec :


- Then try to create a dump with docker exec (should be super user and use "--no-tablespaces" to avoid errors when restore):
```
    docker exec mysql1 mysqldump -uroot --password=roPass@1234 --no-tablespaces hr > ./all-databases.sql
```

- And try to restore it to the seconde database :
```
docker exec mysql2 mysql -uroot --password=roPass@1234 hr < ./all-databases.sql
```

- Check again mysql2 and confirm the restoration :
```
docker exec mysql2 mysql -umahendra --password=${MYSQL_PASSWORD} -e 'USE hr; SELECT * FROM employees LIMIT 10;'
```


### Step 3 : Try the restore with a new image 

- Build a new image which use the dump as sql init script :
```
docker build -f restore_sql_dockerfile -t my_restore_mysql_db:1 .
```

- Then run a container :
```
docker run -d --rm --name mysql3 \
    -e MYSQL_DATABASE=hr \
    -e MYSQL_USER=mahendra \
    -e MYSQL_PASSWORD=pass@1234 \
    -e MYSQL_ROOT_PASSWORD=roPass@1234 \
    -p 127.0.0.1:3308:3306 \
    -v /home/ottomatic/Temp/mysql3:/var/lib/mysql my_restore_mysql_db:1  
```

- Check mysql3 and confirm the restoration :
```
docker exec mysql3 mysql -umahendra --password=${MYSQL_PASSWORD} -e 'USE hr; SELECT * FROM employees LIMIT 10;'
```

If you get "ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)" error, you are going to fast, the database is not yet ready, wait a bit (10-30 sec). The restoration take a while.

### Step 4 : Try dump and restore with ansible playbook :

- Stop the previous container :
```
docker stop mysql1
docker stop mysql2
docker rm mysql1
docker rm mysql2
```

- Or with docker-compose :
```
docker-compose stop
```

And then execute the playbook :
```
TODO
```


## Important note :

If the application you're trying to connect to MySQL does not handle MySQL downtime or waiting for MySQL to start gracefully, then putting a connect-retry loop before the service starts might be necessary. For an example of such an implementation in the official images. See Wordpress entrypoint script (sh) as example of this : https://github.com/docker-library/wordpress/blob/1b48b4bccd7adb0f7ea1431c7b470a40e186f3da/docker-entrypoint.sh#L195-L235

## Sources : 
- docker hub mysql : https://hub.docker.com/_/mysql/
- docker maria and mysql backup and restore tutorial : https://davejansen.com/how-to-dump-and-restore-a-mariadb-mysql-database-from-a-docker-container/