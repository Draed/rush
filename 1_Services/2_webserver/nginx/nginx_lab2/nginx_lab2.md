# nginx lab 2

## Description 

A really simple lab for microservice initiation working with docker. Following tutorial (youtube video from xavki) : https://www.youtube.com/watch?v=QLzwJpSkm8w&list=PLn6POgpklwWoaHbxXgb5Tukdbj6jQ-IIz&index=8

## Usage 

- Build web server docker image from dockerfile and start a nginx container : 

```
cd web_server
docker build -f nginx_dockerfile -t nginx:testlab .
docker run --rm -d --name nginx_server -p 0.0.0.0:8080:80/tcp nginx:testlab
```

- Same for the worker (build image and then start 2 workers) : 

```
cd worker
docker build -f worker_dockerfile -t workers:testlab .
docker run --rm -d --name worker1 --volumes-from nginx_server  workers:testlab
docker run --rm -d --name worker2 --volumes-from nginx_server  workers:testlab
```

## Sources : 

- xavki youtube video : https://www.youtube.com/watch?v=QLzwJpSkm8w&list=PLn6POgpklwWoaHbxXgb5Tukdbj6jQ-IIz&index=8