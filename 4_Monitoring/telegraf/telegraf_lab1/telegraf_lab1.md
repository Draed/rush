# Telegraf lab 1

## Description 

Monitoring the Docker Engine Host and container with telegraf, InfluxDb and Grafana.
TIG will be available on classic server with ansible playbook and on container with docker.

The playbook will : 
- Install docker as rootless
- Start a very simple nginx container
- Install Telegraf (monitoring Docker Engine Host and the nginx container)
- Install Influxdb
- Install Grafana

## Usage 

**Note : Fail to make telegraf work without docker, cannot give access to the docker socket to telegraf user. (error "Got permission denied while trying to connect to the Docker daemon socket").**

### Ansible way - No vagrant : 

- As always, first configure the inventory.yml.

- And start the playbook : 
```
cd ansible/full_playbook
ansible-playbook -i inventory.yml --ask-become-pass TIG_playbook.yml
```

**Reminder, Use : "--start-at-task=" to start at choosen task and "--check" to only test playbook**

### Ansible way - With vagrant : 

A vagrant file is avalaible to test it on virtual machine (box:generic/debian11) running on virtualbox.

- Start the vagrant run, the vagrantfile will load the playbook as provisioner :
```
cd ansible/full_playbook
vagrant up
```

### Docker way - With vagrant: 

For a better isolation

**Work in progress**

- First, create the 'docker' network for influxdb and telegraf : 
```
docker network create --driver bridge influxdb-net
```

```
docker run -d --name=telegraf \
	-v $PWD/telegraf.conf:/etc/telegraf/telegraf.conf:ro \
	-v /:/hostfs:ro \
	-l docker.group=monitoring-docker-group
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
	  -v /var/run/docker.sock:/var/run/docker.sock:ro \
      -v $PWD/telegraf.conf:/etc/telegraf/telegraf.conf:ro \
      telegraf
```

## Source :

### TIG : 

- TIG stack tutorial : https://devconnected.com/how-to-install-influxdb-telegraf-and-grafana-on-docker/

- Article about TIG install with ansible on rasp 4 : https://plop.bzh/fr/ansible/tig-on-rpi/

- The repo of previous article (TIG rasp4) : https://github.com/jameskilbynet/ansible-tig

- Getting started with influx, grafana, docker : https://coderwall.com/p/fg18jq/getting-started-influxdb-grafana-docker

- Tutorial to monitor docker wiht Telegraf and influxdb (with docker container) : https://www.cncf.io/blog/2022/06/10/docker-monitoring-tutorial-how-to-monitor-docker-with-telegraf-and-influxdb/

- Tutorial to monitor docker with TIG (with docker-compose) - really short and simple : https://aperogeek.fr/monitoring-docker-with-telegraf-influxdb-and-grafana/

### Telegraf 

- Telegraf official getting started documentation : https://docs.influxdata.com/telegraf/v1.24/get_started/

- Telegraf.conf file doc : https://docs.influxdata.com/telegraf/latest/configuration/

- Telegraf image official repo : https://hub.docker.com/_/telegraf/

- Telegraf output format (official documentation) : https://docs.influxdata.com/telegraf/v1.24/data_formats/output/

- Manual configuration telegraf (official documentation) : https://docs.influxdata.com/influxdb/cloud/write-data/no-code/use-telegraf/manual-config/

### Influxdb :

- Influxdb install tutorial : https://devconnected.com/how-to-install-influxdb-on-ubuntu-debian-in-2019/#Option_2_Adding_the_repositories_to_your_package_manager

- Data exploration in InfluxDB : https://docs.influxdata.com/influxdb/v1.8/query_language/explore-data/

### Grafana :

- dashboard for monitoring docker through Telegraf and influxdb : https://grafana.com/grafana/dashboards/10585-docker-dashboard/

- more dashboard on grafana for influxdb and telegraf : https://grafana.com/grafana/dashboards/?search=docker&collector=telegraf&dataSource=influxdb

### Ansible :

- wait for service to be available : https://stackoverflow.com/questions/63781603/how-can-i-get-ansible-to-wait-until-a-service-is-active

- reminder for handlers : https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_handlers.html#handlers

- reminder doc for "--start-at-task" option : https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_startnstep.html

- reminder for debug in ansible : https://docs.ansible.com/ansible/latest/collections/ansible/builtin/debug_module.html

- Ansible docker container module documentation : https://docs.ansible.com/ansible/latest/collections/community/docker/docker_container_module.html

- Reminder of task "isolation" in ansible : https://github.com/ansible/ansible/issues/24956

- Solution to bashrc non interactive : https://stackoverflow.com/questions/22256884/not-possible-to-source-bashrc-with-ansible

- How to avoid systemd error with ssh (activate "UsePAM yes") : https://superuser.com/questions/1561076/systemctl-user-failed-to-connect-to-bus-no-such-file-or-directory-debian-9

### Docker :

- reminder on docker label usage : https://docs.docker.com/config/labels-custom-metadata/

- reminder on docker label usage (override at container start) : https://docs.docker.com/engine/reference/commandline/run/#set-metadata-on-container--l---label---label-file

- Solving error linked to ressource limitation and OCI runtime : https://docs.docker.com/engine/security/rootless/#limiting-resources

### Vagrant :

- vm.network reminder for vagrant : https://developer.hashicorp.com/vagrant/docs/networking/private_network

- virtualbox network reminder : https://www.virtualbox.org/manual/ch06.html

- very good article on setting vagrant machine network : https://ostechnix.com/how-to-configure-networking-in-vagrant/

### Others :

- Verify checksum on mac os : https://medium.com/@EvgeniIvanov/how-to-verify-checksum-on-mac-988f166b0c4f