# Docker lab 1

## Description

Testing docker by building some images with dockerfile (from scratch, from alpine, ...)

## Usage 

- Configure docker remote host :
```
export DOCKER_HOST=ssh://<user>@<IP of remote>
```

See more (unsecure tcp, secure ssh, ssh link, docker context) at this tutorial [remote host tutorial](https://www.howtogeek.com/devops/how-and-why-to-use-a-remote-docker-host/)

# Source : 
- docker image scratch : https://www.grottedubarbu.fr/docker-image-scratch/
- Bonnes pratiques docker en production : https://w3blog.fr/2016/02/23/docker-securite-10-bonnes-pratiques/
- dockerfile best practices : https://www.grottedubarbu.fr/best-practices-dockerfile/
- configure docker remote host tutorial : https://www.howtogeek.com/devops/how-and-why-to-use-a-remote-docker-host/