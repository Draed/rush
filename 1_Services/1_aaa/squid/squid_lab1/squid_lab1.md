# Squid lab 1

## Description 

Create a squid proxy in podman for http logging 

## Usage : 

Construire l'image squid proxy avec podman :

‘‘‘
podman build -t squid_image -f squid_dockerfile
‘‘‘

lancer le service avec podman :

‘‘‘
podman run --name squid -p 3128:3128 -d localhost/squid_image 
‘‘‘

Ajouter les options suivantes pour monter les logs et le cache sur un volume (persistance) :
‘‘‘
--volume /tmp/squid/cache:/var/spool/squid \
--volume /tmp/squid/log:/var/log/squid \
‘‘‘

Testing (by watching logs) :

‘‘‘
podman exec -it squid tail -f /var/log/squid/access.log
‘‘‘