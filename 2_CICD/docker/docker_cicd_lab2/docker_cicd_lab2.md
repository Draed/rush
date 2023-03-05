# Docker cicd lab 2     

## Description

This lab is a test in CICD to see what is a better workflow in docker environnement :
- package the docker image with the dev project 
or
- just create a simple image without the project and install the project in the raw image

This lab contain :
- a maven repo 
- a jenkins server
- a docker registry 

## Usage


Start the playbook : 
```
cd ansible
ansible-playbook docker_cicd_lab2.yml -i inventory.yml
```

This playbook will :
- install docker in rootless mode
- git clone a repo with java src
- install a maven repo in docker
- 


## Sources : 

- maven for beginner : https://geekflare.com/fr/apache-maven-for-beginners/
- docker run reminder : https://docs.docker.com/engine/reference/commandline/run/
- docker container module for ansible : https://docs.ansible.com/ansible/latest/collections/community/docker/docker_container_module.html
- Build java image in docker : https://docs.docker.com/language/java/build-images/
- deploy a docker registry : https://docs.docker.com/registry/deploying/
- build java project with maven : https://spring.io/guides/gs/maven/
- docker image module for ansible : https://docs.ansible.com/ansible/latest/collections/community/docker/docker_image_module.html