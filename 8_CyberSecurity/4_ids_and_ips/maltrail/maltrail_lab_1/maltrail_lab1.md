# Maltrail lab 1

## Description 

## Usage 

- docker images : https://github.com/johackim/docker-maltrail

build :
````
podman build -t maltrail_test -f maltrail_ubuntu_dockerfile
````
run : 
````
podman run -d --name maltrail -p 8338:8338/tcp localhost/maltrail_test
````


## sources : 