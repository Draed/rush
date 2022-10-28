# Podman lab 1

## Description 

The goal of this first lab is to test podman and compare with docker (rootless container, rights, namespace, port, etc ...)

## Usage 

- User IDs and (rootless) containers with Podman : https://blog.christophersmart.com/2021/01/26/user-ids-and-rootless-containers-with-podman/


### container's port info
- You cannot use ports below 1024 in rootless mode (Normal user mode)

- If you want to map host ports less than 1024 using podman, you should run podman as the root user or with sudo privileges as shown below.

### UID, namespace 

- User namespace allows you to specify a user identifier (UID) and group identifier (GID) mapping to run your containers. This means you can run as UID 0 (root) inside the container and UID 100000 outside the container. If your container processes escape the container, the kernel will treat them as UID 100000

- Any file object owned by a UID that isn't mapped into the user namespace will be treated as owned by "nobody" (65534, kernel.overflowuid)

- The --uidmap setting (--uidmap 0:100000:5000) tells Podman to map a range of 5000 UIDs inside the container, starting with UID 100000 outside the container (so the range is 100000-104999) to a range starting at UID 0 inside the container (so the range is 0-4999). Inside the container, if my process is running as UID 1, it is 100001 on the host

- The default User ID on the coreOs VM that start container is : uid=1000(core)

### Debug and troubleshooting command for podman container

#### Rights, namespace and roots authorization 

- Get all ids for user, groups in Host : 
```
id
```

- Get the user mapping info
```
cat /etc/subuid
```

- Get the group mapping info
```
cat /etc/subgid
```

- Get the id mapping file :
```
cat /proc/self/uid_map
```
See link [for more information on this file](https://projectatomic.io/blog/2018/05/podman-userns/)
reminder : 4294967295 = 65535 x 65535

- Get PID of a running container inside of it (is container startd as root ?)
```
podman run --rm --entrypoint '' container_name id
```
or 
```
podman run fedora cat /proc/self/loginuid
```

- [Centos VM] Get PID of a running container outside of it (on the host) (is container startd as root ?)
```
cat /proc/self/loginuid
```

- [Centos VM] Or with podman command wich give the user ID (on the container) and the host user ID (on the host) :
```
sudo podman top --latest user huser
```

#### ports and networks

- inspect open port on a container :
```
podman port -l
```

- Check if ports are open on mac os : 
```
netstat -an | grep 8080
```

- Check if ports are open on the podman machine (coreos) : 
```
ss -ltnup | grep 8080
```

### Stats (cpu, ram, ...)

- get the ram used by each container :
```
podman stats
```

### logs 

- Check logs on the container :
```
podman logs -ft container_name
```

## Sources :

- how to set and use podman in rootless environnment : https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md
- namespace and uid explain in podman : https://opensource.com/article/18/12/podman-and-user-namespaces
- namespace security explain in podman : https://opensource.com/article/18/10/podman-more-secure-way-run-containers 
- the wheel group : https://www.delftstack.com/howto/linux/wheel-group-in-linux/
- podman in different usernamepace : https://opensource.com/article/18/12/podman-and-user-namespaces
- iud, gid, map_id explain in coreOS (atomic) : https://projectatomic.io/blog/2018/05/podman-userns/
- example and tutorial root and rootless container with test, verification : https://medium.com/techbull/what-is-user-namespace-and-podmans-rootless-containers-fc4c292c6bad
- complete explaination rootless rights and id mapping in podman : https://www.tutorialworks.com/podman-rootless-volumes/