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
cd ansible 
ansible-playbook -i ../inventory.yml
```

## sources :

- openproject github page : https://github.com/opf/openproject
- openproject installation doc : https://www.openproject.org/docs/installation-and-operations/installation/docker/
