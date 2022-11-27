#!/bin/bash

if [ ! -s "$PGDATA/PG_VERSION" ]; then

    # pg_basebackup -R -D /var/lib/postgresql/repl -Fp -Xs -v -P -h 10.0.3.200 -p 5432 -U repuser2
    # pg_basebackup -h pg_master -D ${PGDATA} -U ${PG_REP_USER} -vP -W
    until pg_basebackup -R -D /var/lib/postgresql/data/backup -U ${POSTGRES_USER} -h master_postgres_database -p 5432 -W -v

        do

            echo "Waiting for master to connect..."

            sleep 1s

        done
fi