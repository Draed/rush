# Docker cicd lab 1

## Description 

A short lab in order to create a test/dev environement for a simple python web app (python + postgresql).

dependencies (find all in requirements.txt):
- psycopg2
- flask

## Usage 

### Dev env : 

For testing purpose, it's better to map a volume on which the app code stand rather than building new image each time the code is updated (which mean running "docker run" command each time).

- build python app docker image for testing (the app code is not copied in the image) :
```
docker build -f my_python_app_test_dockerfile -t my_python_app_test:1 .
```

- Create the network :
```
docker network create --driver bridge my_python_app_network
```

- Create the volume :
```
docker volume create my_python_app_test_volume
```

- Now to find where to put the app code on the host, launch :
```
docker volume inspect my_python_app_test_volume
```

(if docker is launched in rootless mode, directory path should be : "/home/<username>/.local/share/docker/volumes/my_python_app_test_volume/_data")

- Then start the python app and postgresql :
```
docker run -d --rm --name my_python_app_db --network my_python_app_network -p 5432:5432 -e POSTGRES_PASSWORD=password postgres:15.1-alpine 
docker run -it --rm --name my_python_app --network my_python_app_network -p 5000:5000 --mount source=my_python_app_test_volume,target=/usr/src/app my_python_app:1
```

### Production Preparation :

Now that the "dev part" is done, we assume having a working app ready to be pushed to prod. Let's wrap the app code into a docker image.

- build python app docker image (the app code is copied in the image):
```
docker build -f my_python_app_dockerfile -t my_python_app:1 .
```

- If you have shut down the previous database, start a new one :
```
docker run -d --rm --name my_python_app_db --network my_python_app_network -e POSTGRES_PASSWORD=password postgres:15.1-alpine  
```

- start the python app :
```
docker run -d --rm --name my_python_app --network my_python_app_network my_python_app:1
```

Now go to 127.0.0.1:5000 to see the result.

**Idea : Next lab idea is to get a advanced CICD lab with a git and jenkins. Each time a new commit is done, the app will be testing with unit test with jenkins. If success new docker image is built and pushed to prod.**

## Source :

- docker postresql simple tutorial : https://www.docker.com/blog/how-to-use-the-postgres-docker-official-image/

- GCC error with python-alpine image when installing package with pip3 : https://stackoverflow.com/questions/60595581/failed-to-install-gcc-on-python-3-7-alpine-docker-container

- docker python image : https://hub.docker.com/_/python/

- How to install in psycopg2 venv : http://web.archive.org/web/20140615091953/http://goshawknest.wordpress.com/2011/02/16/how-to-install-psycopg2-under-virtualenv/

- docker rootless networking documentation : https://docs.docker.com/engine/security/rootless/#networking-errors

