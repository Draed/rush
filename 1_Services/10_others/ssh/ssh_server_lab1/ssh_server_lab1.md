# ssh server service 

## Start the test docker ssh server (for testing purpose)

```
docker build docker_ssh_server/ -t sshserver:testlab && \
docker run --rm -d --name sshserver -p 127.0.0.1:2222:22/tcp  sshserver:testlab
```

or with interactive shell :
```
docker build . -t sshserver:testlab && \
docker run --rm -i --name sshserver -p 127.0.0.1:2222:22/tcp  sshserver:testlab
```

For debug purpose, get into the container :
```
docker exec -it sshserver /bin/sh
```

## passwordless authentication

## fail2ban configuration