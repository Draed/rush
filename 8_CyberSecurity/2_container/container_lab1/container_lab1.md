# Container lab 1

## Description

based on  [this post about docker root abuse](https://hackarandas.com/blog/2020/03/17/hacking-docker-remotely/)
But try it with podman 

## Usage

1. scanning 

## main scan : 

- quick scan of the network (don't look for open ports) : 
```
nmap -sn 192.168.0.0/24
```

- scan the host found : 

```
nmap -A -T4 -F 172.20.10.2
```

* -A is for OS and version detection 
* -T4 is for insane timer (very fast)
* -F is for fast scan (100 port instead of 1000)

result :
```
Nmap scan report for 172.20.10.2
Host is up (0.00016s latency).
Not shown: 98 closed ports
PORT     STATE SERVICE    VERSION
8080/tcp open  http       nginx 1.21.6
8443/tcp open  tcpwrapped
```

## other scan : 

- classic scan of the network :
```
nmap 192.168.0.0/24
```

- scan a specific machine :
```
nmap -sS -v -A 10.10.10.220
```

* sS is for TCP SYN (Stealth) Scan
* v is for a more verbose output
* A is to enable OS detection, version detection, script scanning and traceroute.
* F is for fast scan (100 port instead of 1000)

- more details with nmap script : 

```
nmap -sCV 10.10.10.220
```

2. Dig deeper to find podman machine port 

```
nmap -A -T4 172.20.10.2 -p 1000-65535
```

result : 
```
8080/tcp  open     http       syn-ack     nginx 1.21.6
8443/tcp  open     tcpwrapped syn-ack
53514/tcp filtered unknown    no-response
54532/tcp open     ssh        syn-ack     OpenSSH 8.7 (protocol 2.0)
56851/tcp filtered unknown    no-response
60772/tcp filtered unknown    no-response
61966/tcp filtered unknown    no-response
```

With Docker we just need to change the variable DOCKER_HOST to the IP we just find. As the daemon socket is not secured by default : https://docs.docker.com/engine/security/protect-access/


With Podman this is different as there is no daemon running, we need a remote server. I test this on mac OS and podman need linux to run so I already have a remote server : [podman remote server / client explain with mac os and windows virtual machine](https://www.redhat.com/sysadmin/podman-clients-macos-windows)

I run `podman machine ssh` on my mac to connect to the coreOs VM and check if podman remote server is running (as i would do on a normal podman remote server) : 'systemctl status podman.socket'


## Sources : 

- nmap tutorial by redhat : https://www.redhat.com/sysadmin/quick-nmap-inventory
- tutorial to start a podman remote server : https://www.cloudassembler.com/post/remote-podman-service/