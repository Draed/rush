# lab 1 docker

## Description

Testing docker as root and rootless, check uid, pid, cgroups, namespaces.

# Usage  

- On host get current user id : 
```
id -u
1000
```

- Then show how many sub uid we are allow to generate from our user :
```
grep ^$(whoami): /etc/subuid
```
This should show : 
<user>:<starting uid>:<range uid>
testuser:10000:65536

- We do the same for the gid :
```
grep ^$(whoami): /etc/subgid
```
And should get the same result as above


- install docker rootless, see  links below : 


- and start docker from user space (if just start, it will ask for sudo passwd and go for root mode) :
```
systemctl --user start docker
```

- to enable it at start :
```
systemctl --user enable docker
```

- check the starting with : 
```
systemctl --user -l | grep docker
```
or with 
```
systemctl --user status docker
```

- Now for using it with the client we need to change the socket path with  'docker_host' var : 
```
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
```

By default (root mode), the socket path is "unix:///var/run/docker.sock.", we need to change it by "unix://$XDG_RUNTIME_DIR/docker.sock". 

The socket path is set to $XDG_RUNTIME_DIR/docker.sock by default. $XDG_RUNTIME_DIR is typically set to /run/user/$UID

- Now docker must work on this host in rootless mode, to check it basically :
```
docker ps
```
should return no error message

- Now let's get more information about dockerd process :
first with ps : 
```
ps -aux | grep docker 
```
The PID should be high and in the range defined in the subuid file

- launch a test container to check rootless element :
```
docker run --name mynginx1 -p 80:80 -d nginx
```
raise "cannot expose privileged port 80" error as expected.

- check the UID and PID for the docker process (and subprocess as containerd) : 
```
ps fx -U 1000
```
This should show "rootlesskit" as the root of all docker subprocess, with a PID > 1000.
And in subprocess, we hould have : dockerd (so not running as root but with UID=1000 ), containerd

- Inside the container :
```
ls /proc/
```
should show only low process id (1 to 1000)

## Sources :

- liz rice container video : https://www.youtube.com/watch?v=8fi7uSYlOdc&t=2198s
- rootless container getting started : https://rootlesscontaine.rs/getting-started/common/subuid/
- loginctl linger : https://www.man7.org/linux/man-pages/man1/loginctl.1.html