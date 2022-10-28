# Nmap lab 1

## Description 

Testing nmap scanning from podman container

## Usage : 

(not working, raw socket not permitted error with podman on mac os)

build :
````
podman build -t nmap_test -f nmap_dockerfile
````

run : 
````
podman run --rm -it instrumentisto/nmap -A -T4 127.0.0.1
````

## Sources : 

- blog security trail  :  https://securitytrails.com/blog/information-gathering
- nmap cheatsheet : https://securitytrails.com/blog/nmap-cheat-sheet
- blog hacking : https://miloserdov.org/
