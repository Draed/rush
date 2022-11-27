# Docker cicd lab 1

## Description 

A short lab in order to create a test/dev environement for a simple python web app (python + postgresql / adminer).

dependencies (find all in requirements.txt):
- psycopg2
- flask

## Usage 

### Manual test :

- build python app docker image :
```
docker build -f my_python_app_dockerfile -t my_python_app:1 .
```

- start the python app and postgresql :
```
docker run -d --rm --name my_python_app_db -p 5432:5432 -e POSTGRES_PASSWORD=password postgres:15.1-alpine & \
docker run -it --rm --name my_python_app my_python_app:1
```

## Source :

- docker postresql simple tutorial : https://www.docker.com/blog/how-to-use-the-postgres-docker-official-image/

- GCC error with python-alpine image when installing package with pip3 : https://stackoverflow.com/questions/60595581/failed-to-install-gcc-on-python-3-7-alpine-docker-container

- docker python image : https://hub.docker.com/_/python/

- How to install in psycopg2 venv : http://web.archive.org/web/20140615091953/http://goshawknest.wordpress.com/2011/02/16/how-to-install-psycopg2-under-virtualenv/