FROM mysql:8.0.31-debian

COPY db-files/* /docker-entrypoint-initdb.d/

ENV MYSQL_DATABASE=hr MYSQL_USER=mahendra MYSQL_PASSWORD=pass@1234 MYSQL_ROOT_PASSWORD=roPass@1234