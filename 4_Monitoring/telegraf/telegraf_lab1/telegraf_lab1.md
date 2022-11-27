# Telegraf lab 1

## Description 

Monitoring the Docker Engine Host and container with telegraf, InfluxDb and Grafana.
TIG will be available on classic server with ansible playbook and on container with docker.

## Usage 

### Ansible way - No vagrant : 

- As always, first configure the inventory.yml.

- And start the playbook : 
```
ansible-playbook -i inventory.yml --ask-become-pass TIG_playbook.yml
```

### Ansible way - With vagrant : 

A vagrant file is avalaible to test it on virtual machine (box:generic/debian11) running on virtualbox.

- Start the vagrant run, the vagrantfile will load the playbook as provisioner :
```
vagrant up
```

### Docker way : Work in progress


```
docker run -d --name=telegraf \
	-v $PWD/telegraf.conf:/etc/telegraf/telegraf.conf:ro \
	-v /:/hostfs:ro \
	-e HOST_ETC=/hostfs/etc \
	-e HOST_PROC=/hostfs/proc \
	-e HOST_SYS=/hostfs/sys \
	-e HOST_VAR=/hostfs/var \
	-e HOST_RUN=/hostfs/run \
	-e HOST_MOUNT_PREFIX=/hostfs \
	telegraf
```

```
docker run -d --name=telegraf \
      --net=influxdb \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v $PWD/telegraf.conf:/etc/telegraf/telegraf.conf:ro \
      telegraf
```

## Source :

- Telegraf image official repo : https://hub.docker.com/_/telegraf/

- Telegraf install tutorial : https://devconnected.com/how-to-install-influxdb-on-ubuntu-debian-in-2019/#Option_2_Adding_the_repositories_to_your_package_manager

- TIG stack tutorial : https://devconnected.com/how-to-install-influxdb-telegraf-and-grafana-on-docker/

- Article about TIG install with ansible on rasp 4 : https://plop.bzh/fr/ansible/tig-on-rpi/

- The repo of previous article (TIG rasp4) : https://github.com/jameskilbynet/ansible-tig