# nginx lab 1 (podman)

## Description 

Start a nginx container with podman

## Usage

1. Get the podman images

```
podman search nginx --filter=is-official
INDEX       NAME                     DESCRIPTION               STARS       OFFICIAL    AUTOMATED
docker.io   docker.io/library/nginx  Official build of Nginx.  16898       [OK]
```

```
podman pull docker.io/library/nginx
```


2. create the pod for this service

```
podman pod create --name nginxapp -p 8080:80 -p 8443:443 --network bridge
```

3. run the container

```
podman run --rm --pod nginxapp --name nginx-server -d docker.io/library/nginx
```

4. copy the file to the nginx container 

By default, Nginx looks in the /usr/share/nginx/html directory inside the container for files to serve.


```
podman cp index.html nginx-server:/usr/share/nginx/html
```

## Troubleshooting 

- Check logs on the container :
```
podman logs -ft container_name
```

- Check if ports are open on mac os : 
```
netstat -an |grep 8080
```

- Check if ports are open on the podman machine (coreos) : 
```
ss -ltnup | grep 8080
```


## sources : 

- webpost tutorial  nginx with podman : https://unixcop.com/5-step-nginx-contains-podman-easy/