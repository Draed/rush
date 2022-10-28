# Container lab 2

## Description 

(Pentest on a test server wich host SSH server on port 22.)

Trying to break into a container through ssh with different tools and multiple approach : 
- python script : bruteforce
- python script : dict
- hydra : dict
- CVE-2018-10933 

## Usage

0. Start the test docker ssh server

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

1. scan 

Direclty from host if nmap in installed : 
```
nmap -p 2222 127.0.0.1
```

else with docker container :
```
docker build docker_nmap_container -t nmap:testlab && \
docker run --rm -i --name nmap --net host nmap:testlab
```


2. Attack SSH phase 1

launch version 1 of python script, wich just brute force on dictionnary.

Using virtualenv : 
```
virtualenv -p python3 sshlab && 
source sshlab/bin/activate && 
pip install -r requirements.txt
```

Not using venv : 
```
pip3 install paramiko colorama
python ssh_attack.py
```

3. Attack SSH phase 2


X. Attack with hydra tools 

build the image and run hydra:
```
docker build . -t hydra:testlab && \
docker run --rm -i --name hydra --net host hydra:testlab
```

X. Pentest with CVE CVE-2018-10933 

build the image and run libssh-scanner:
```
docker build . -t libsshscan:testlab && \
docker run --rm -i --name libsshscan --net host libsshscan:testlab
```

## Sources : 

- python brute force password script for ssh : https://www.thepythoncode.com/article/brute-force-ssh-servers-using-paramiko-in-python
- run ssh as non root user : https://www.golinuxcloud.com/run-sshd-as-non-root-user-without-sudo/
- libssh scanner : https://github.com/leapsecurity/libssh-scanner