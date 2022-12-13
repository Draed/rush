# openproject 

OpenProject is the leading open source project management software. 

## First test (without database) : 

docker run -it -p 8080:80 -e SECRET_KEY_BASE=testing123 openproject/community:latest

## Full Test (each process per container) :

### Manual methods :

```
git clone https://github.com/opf/openproject-deploy --depth=1 --branch=stable/12 openproject
cd openproject/compose
docker-compose pull
OPENPROJECT_HTTPS=false docker-compose up -d
```

### Automated methods (with vagrant + ansible playbook) : 

- First create the vagrant machine : 
```
cd ansible 
vagrant up
```

It will create new VM with virtualbox and install docker (and docker-compose) inside. 

- Then start the playbook (it will get the openproject repo and compose-up with default env) :
```
ansible-playbook -i inventory.yml openproject_playbook.yml
```

## Troubleshooting : 

- See all vagrant machine running :
```
vagrant global-status
```

Important info about this command :

The above shows information about all known Vagrant environments
on this machine. This data is cached and may not be completely
up-to-date (use "vagrant global-status --prune" to prune invalid
entries). To interact with any of the machines, you can go to that
directory and run Vagrant, or you can use the ID directly with
Vagrant commands from any directory. For example:
"vagrant destroy 1a2b3c4d"

- See all vbox mahcine running :
```
VBoxManage list vms
```

- Show vbox infos :
```
VBoxManage showvminfo <vboxname>
```

- Stop a vbox :
```
VBoxManage controlvm <vboxname> poweroff
```

## sources :

- openproject github page : https://github.com/opf/openproject
- openproject installation doc : https://www.openproject.org/docs/installation-and-operations/installation/docker/
- vboxManage CLI for virtualbox common cmd : https://www.cyberithub.com/vboxmanage-an-introduction-to-virtualbox-cli-with-examples/

- tutorial about vagrant networking : https://ostechnix.com/how-to-configure-networking-in-vagrant/