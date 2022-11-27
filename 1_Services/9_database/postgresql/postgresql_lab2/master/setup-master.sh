#!/bin/bash

# psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" —-dbname "$POSTGRES_DB" <<-EOSQL
# CREATE USER $POSTGRES_REPLICATION_USER REPLICATION LOGIN CONNECTION LIMIT 100 ENCRYPTED PASSWORD '$POSTGRES_REPLICATION_PASSWD';
# CREATE USER postgres;
# EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
CREATE DATABASE "$POSTGRES_DB";
CREATE USER $POSTGRES_REPLICATION_USER REPLICATION LOGIN CONNECTION LIMIT 5 ENCRYPTED PASSWORD '$POSTGRES_REPLICATION_PASSWD';
EOSQL