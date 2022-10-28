# Redmine lab 1

## Description

Redmine is a free and open source, web-based project management and issue tracking tool. It allows users to manage multiple projects and associated subprojects. It features per project wikis and forums, time tracking, and flexible role based access control. It includes a calendar and Gantt charts to aid visual representation of projects and their deadlines. Redmine integrates with various version control systems and includes a repository browser and diff viewer.

More at : https://en.wikipedia.org/wiki/Redmine

## Usage :

### First test (without database) : 

```
podman run -d --name test-redmine -p 3000 redmine 
```

default ids : 
- login : admin
- passwd : admin

### create a pod for the project (redmine + database)

- Define the path for the VM machine instead of the path on mac os : 
```
export PODMANHOME="/home/core"
export REDMINE_NAME="redmine"
export REDMINE_DB="redmine_postgres"
```

- create the pod : 
```
export REDMINE_NAME="redmine"
podman pod create --replace --hostname ${REDMINE_NAME} --name ${REDMINE_NAME} -p 3000:3000
```


### start database (postgreSQL)

if needed open port 5432 for DB access

```
export REDMINE_DB="redmine_postgres"
podman run -d --replace \
    --name ${REDMINE_DB} \
    --pod ${REDMINE_NAME} \
    -e POSTGRES_PASSWORD=testing123 \
    -e POSTGRES_USER=redmine \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    --volume ${PODMANHOME}/containers/${REDMINE_NAME}/db:/var/lib/postgresql/data:Z \
    postgres
```

### start redmine container :

```
podman run -d --replace \
    --name redmine_app \
    --pod ${REDMINE_NAME} \
    -e REDMINE_DB_POSTGRES="127.0.0.1" \
    -e REDMINE_DB_USERNAME=redmine \
    -e REDMINE_DB_PASSWORD=testing123 \
    --volume ${PODMANHOME}/containers/redmine/files:/usr/src/redmine/files:Z \
    redmine
```


copy [farend_bleuclaire](https://github.com/farend/redmine_theme_farend_bleuclair/releases) theme to 
"/usr/src/redmine/public/themes/"



## source : 
- redmine image on dockerhub : https://hub.docker.com/_/redmine/
- postgres image on dockehub : https://hub.docker.com/_/postgres
- blog for postgres var and volume : https://rhiyo.github.io/post/2021-4-21-running-postgres-in-docker-container-with-mounted-volume/