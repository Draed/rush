# postgresql_lab1

## Description

Create a POC of postgresql database replication based on article : https://bhushan9991.medium.com/postgres-12-4-replication-with-docker-7cb3804b280

## Usage

### Without docker-compose :

- First declare ENV var  :
```
export POSTGRES_DB=test
export POSTGRES_USER=postgre
export POSTGRES_USER_PASSWORD=password
export POSTGRES_REPLICATION_USER=replica
export POSTGRES_REPLICATION_PASSWD=password
export MASTER_HOST=master_postgres_database
export MASTER_PORT=5432
export MASTER_REPLICATION_MODE=master
export SLAVE_REPLICATION_MODE=slave
export POSTGRES_PASSWORD=password
```

- Let's build our customs images (master) :
```
docker build -f /home/ottomatic/lab/postgresql/master/master_dockerfile -t psgsql-master:1 \
    --build-arg POSTGRES_DB=$POSTGRES_DB \
    --build-arg POSTGRES_USER=$POSTGRES_USER \
    --build-arg POSTGRES_USER_PASSWORD=$POSTGRES_USER_PASSWORD \
    --build-arg POSTGRES_REPLICATION_USER=$POSTGRES_REPLICATION_USER \
    --build-arg POSTGRES_REPLICATION_PASSWD=$POSTGRES_REPLICATION_PASSWD \
    --build-arg MASTER_HOST=$MASTER_HOST \
    --build-arg MASTER_PORT=$MASTER_PORT \
    --build-arg MASTER_REPLICATION_MODE=$MASTER_REPLICATION_MODE \
    --build-arg SLAVE_REPLICATION_MODE=$SLAVE_REPLICATION_MODE \
    .
```

- Let's build our customs images (slave) :
```
docker build -f /home/ottomatic/lab/postgresql/slave/slave_dockerfile -t psgsql-slave:1 \
    --build-arg POSTGRES_DB=$POSTGRES_DB \
    --build-arg POSTGRES_USER=$POSTGRES_USER \
    --build-arg POSTGRES_USER_PASSWORD=$POSTGRES_USER_PASSWORD \
    --build-arg POSTGRES_REPLICATION_USER=$POSTGRES_REPLICATION_USER \
    --build-arg POSTGRES_REPLICATION_PASSWD=$POSTGRES_REPLICATION_PASSWD \
    --build-arg MASTER_HOST=$MASTER_HOST \
    --build-arg MASTER_PORT=$MASTER_PORT \
    --build-arg MASTER_REPLICATION_MODE=$MASTER_REPLICATION_MODE \
    --build-arg SLAVE_REPLICATION_MODE=$SLAVE_REPLICATION_MODE \
    .
```

- Then start 1 master :
```
docker run --rm -d \
    -v /home/ottomatic/volumes/postgres-master1:/var/lib/postgresql/data \
    -v /home/ottomatic/lab/postgresql_lab1/master/postgresql.conf:/etc/postgresql/postgresql.conf \
    -v /home/ottomatic/lab/postgresql_lab1/master/pg_hba.conf:/etc/postgresql/pg_hba.conf \
    --name master_postgres_database \
    -p "127.0.0.1:5451:5432" \
    -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
    -e POSTGRES_DB=${POSTGRES_DB} \
    -e POSTGRES_USER=${POSTGRES_USER} \
    -e POSTGRES_REPLICATION_PASSWD=${POSTGRES_REPLICATION_PASSWD} \
    -e POSTGRES_REPLICATION_USER=${POSTGRES_REPLICATION_USER} \
    psgsql-master:1
```

- and start 1 slave : 
```
docker run --rm -d \
    -v /home/ottomatic/volumes/postgres-slave1:/var/lib/postgresql/data \
    -v /home/ottomatic/lab/postgresql_lab1/slave/postgresql.conf:/etc/postgresql/postgresql.conf \
    -v /home/ottomatic/lab/postgresql_lab1/slave/pg_hba.conf:/etc/postgresql/pg_hba.conf \
    --name slave_1_postgres_database \
    -p "127.0.0.1:5452:5432" \
    -e POSTGRES_DB=${POSTGRES_DB} \
    -e POSTGRES_USER=${POSTGRES_USER} \
    -e POSTGRES_REPLICATION_PASSWD=${POSTGRES_REPLICATION_PASSWD} \
    -e POSTGRES_REPLICATION_USER=${POSTGRES_REPLICATION_USER} \
    psgsql-slave:1
```

### With docker-compose :

All credit go to [Daniel Dent](https://github.com/DanielDent/docker-postgres-replication) with his docker-compose :

```
docker-compose up
```

## Sources : 

### Postgresql :

- postgresql replication with docker : https://medium.com/swlh/postgresql-replication-with-docker-c6a904becf77

- postgreSQL replication form entreprisedb : https://www.enterprisedb.com/postgres-tutorials/postgresql-replication-and-automatic-failover-tutorial#setup

- postgresql replication tutorial (with HA proxy) : https://golangexample.com/postgresql-replication-and-load-balancing-with-docker/

- postgresql replication tutorial with docker more automatic than previous tutorial : https://bobcares.com/blog/postgres-docker-replication/

- pg_basebackup command doc : https://www.postgresql.org/docs/current/app-pgbasebackup.html

- WAL postgresql config (official documentation) : https://www.postgresql.org/docs/9.1/wal-intro.html

- PGhba postgrsql config (official documentation) : https://www.postgresql.org/docs/current/auth-pg-hba-conf.html

- postgresql article on slot replication : https://hevodata.com/learn/postgresql-replication-slots/#1

- psql cmd (official documentation) : https://www.postgresql.org/docs/9.2/app-psql.html

### Docker  :

- Good article for ENV, ARG usage in docker : https://vsupalov.com/docker-arg-env-variable-guide/

- official postgresql dockerfile image (github repo) : https://github.com/docker-library/postgres/blob/75d0c1135e1cfd183bf7ee0970b7031986b0710d/15/alpine/Dockerfile

- reminder on dockerfile best practices : https://docs.docker.com/develop/develop-images/dockerfile_best-practices/

- docker build cmd (official documentation) : https://docs.docker.com/engine/reference/commandline/build/

- Repo for docker image postgresql replication : https://github.com/DanielDent/docker-postgres-replication