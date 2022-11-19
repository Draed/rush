# Bind lab 1

## Description

Create a "overcomplicated" DNS server in podman container with bind, cloudflared and pihole. Based on the tutorial from : https://sinister.io/articles/podman-dns/

## Usage 

- créer un pod pour les 3 services (DNS, cloudflared, pihole) : podman pod create --name dns --net slirp4netns -p '192.168.1.19:53:53/udp' -p '127.0.0.1:8080:80/tcp'  -p '127.0.0.1:8443:443/tcp'

- lancer le service DNS (serveur bind) : 
    - build : podman build -t bind_image -f bind_debian_dockerfile --format docker
    - run : podman run -d --name bind --pod dns -v '/var/home/core/.local/share/containers/storage/volumes/dns-volume/_data/bind/etc:/etc/bind:Z' --user 2001 localhost/bind_image

(the :Z option is used for labeling in Selinux)

- lancer le service cloudflared (pour DoH) : 
    - build : podman build -t cloudflared_image -f cloudflared_debian_dockerfile --format docker
    - run : podman run -d --name cloudflared --pod dns --user 2002 localhost/cloudflared_image

- lancer le service pihole :
    - build : pas de build, on récupère l'image depuis le dépôt dockerhub
    - run : podman run -d --name pihole --pod dns -v '/containers/run/pihole/etc/pihole:/etc/pihole:Z' -v '/containers/run/pihole/etc/dnsmasq.d:/etc/dnsmasq.d:Z' -e=ServerIP='192.168.1.19' -e=DNS1='127.0.0.1#5053' -e=DNS2='no' -e=IPv6='false' -e=TZ='Europe/Paris' -e=WEBPASSWORD='MY_STRONG_PASSWORD' pihole/pihole:latest

## Sources :

- installer un dns local sur rasp : https://raspberrytips.fr/serveur-dns-local-raspberry-pi/
- dns man page : https://linux.die.net/man/8/dnsmasq
- tutorial to run bind9 in docker :  https://medium.com/nagoya-foundation/running-a-dns-server-in-docker-61cc2003e899
- github repo for bind9 image (doc) : https://github.com/labbsr0x/docker-dns-bind9/tree/master/example/primary/bind/etc
- another bind9 docker image (for building our dockerfile) : https://github.com/resyst-it/docker-bind9