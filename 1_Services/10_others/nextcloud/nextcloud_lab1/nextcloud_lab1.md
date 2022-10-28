# nextcloud lab 1: 

## Description

Mise en place de l'application nextcloud avec en base de donnée : mariaDb, en serveur http : nginx et en serveur de cache redis. Ajout de SLL et de keeweb.

## Usage

Might not work (actually) on mac os with the coreos VM (tested on docker, it work like a charm). Still not find why (gvproxy could be the problem, or nextcloud config reset HTTP/HTTPS redirection between host and the VM ... )

- Creating the folders (to do on the Fedora VM : 'podman machine ssh') : 
```
export PODNAME="nextcloud"
mkdir -p ~/containers/nextcloud/{db,nginx,html}
```

- Define the path for the VM machine instead of the path on mac os : 
```
export PODMANHOME="/home/core"
```

- Creating a pod for the containers :
```
export PODNAME="nextcloud"
podman pod create --replace --hostname ${PODNAME} --name ${PODNAME} -p 8080:80
```

<!-- - Creating the volumes
```
podman volume create nextcloud-app
podman volume create nextcloud-data
podman volume create nextcloud-db
``` -->

- Creating the mariaDb database container :
```
podman run --detach \
  --restart=always --pod=${PODNAME} \
  --env MYSQL_DATABASE=nextcloud \
  --env MYSQL_USER=nextcloud \
  --env MYSQL_PASSWORD=testing123 \
  --env MYSQL_ROOT_PASSWORD=testing123 \
  --volume ${PODMANHOME}/containers/nextcloud/db:/var/lib/mysql:Z \
  --restart on-failure \
  --name=${PODNAME}-db docker.io/library/mariadb:latest 
```

- Creating the redis cache service : 
```
podman run \
  -d --restart=always --pod=${PODNAME} \
  --name=${PODNAME}-redis docker.io/library/redis:alpine \
  redis-server --requirepass testing123
```

- Creating the nextcloud (php-fpm) container :
```
podman run --detach \
  --restart=always --pod=${PODNAME} \
  --env REDIS_HOST="localhost" \
  --env REDIS_HOST_PASSWORD="testing123" \
  --env MYSQL_HOST="localhost" \
  --env MYSQL_USER="nextcloud" \
  --env MYSQL_PASSWORD="testing123" \
  --env MYSQL_DATABASE="nextcloud" \
  --env NEXTCLOUD_ADMIN_USER=admin \
  --env NEXTCLOUD_ADMIN_PASSWORD=testing123 \
  --volume ${PODMANHOME}/containers/nextcloud/html:/var/www/html:z \
  --name=${PODNAME}-app docker.io/library/nextcloud:fpm-alpine
```

- Creating the nextcloud cron service (for update, alarm and cronjob): 
```
podman run \
  -d --restart=always --pod=${PODNAME} \
  -v ${PODMANHOME}/containers/nextcloud/html:/var/www/html:z \
  --entrypoint=/cron.sh \
  --name=${PODNAME}-cron docker.io/library/nextcloud:fpm-alpine
```

- Get or create the nginx config file (to do on the Fedora VM : 'podman machine ssh'): 
```
curl -o ~/containers/nextcloud/nginx/nginx.conf https://raw.githubusercontent.com/nextcloud/docker/master/.examples/docker-compose/with-nginx-proxy/mariadb/fpm/web/nginx.conf
```

```
curl -o ~/containers/nextcloud/nginx/nginx.conf https://raw.githubusercontent.com/nextcloud/docker/master/.examples/docker-compose/insecure/mariadb/fpm/web/nginx.conf
```

- Creating the nginx container : 
```
podman run \
  -d --restart=always --pod=${PODNAME} \
  -v ${PODMANHOME}/containers/nextcloud/html:/var/www/html:ro,z \
  -v ${PODMANHOME}/containers/nextcloud/nginx/nginx.conf:/etc/nginx/nginx.conf:ro,Z \
  --name=${PODNAME}-nginx docker.io/library/nginx:alpine
```

- Connect and configure nextcloud : 
```
podman exec -it -u www-data nextcloud-app /bin/sh

php occ maintenance:install \
  --database "mysql" \
  --database-host "127.0.0.1" \
  --database-name "nextcloud" \
  --database-user "nextcloud" \
  --database-pass "testing123" \
  --admin-pass "testing123" \
  --data-dir "/var/www/html"

php occ config:system:set \
  trusted_domains 1 --value=192.168.1.32
php occ config:system:set \
  trusted_domains 2 --value=nextcloud.example.com
php occ config:system:set \
  overwrite.cli.url --value "https://nextcloud.example.com"
php occ config:system:set \
  overwriteprotocol --value "https"
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



# sources :

- blog tutorial nextcloud podman : https://fedoramagazine.org/nextcloud-20-on-fedora-linux-with-podman/
- podman network tutorial (official) : https://www.redhat.com/sysadmin/container-networking-podman
- podman volume explained : https://www.tutorialworks.com/podman-rootless-volumes/
- pod in podman explained : https://developers.redhat.com/blog/2019/01/15/podman-managing-containers-pods#wrap_up
- keeweb in nextcloud tutorial : https://www.it-connect.fr/gerer-ses-mots-de-passe-dans-nextcloud-avec-keeweb-keepass/
- blog ios tutorial nextcloud with podman : https://ios.dz/deployer-un-pod-sur-podman/