# Ansible lab 2

## Description 

A short lab to create a playbook that push ssh keys to a "baremetal" like server.


Prerequisite (if using vagrant) : 
- vagrant
- virtualbox
- ansible

## Usage 

- Just start the vagrant file :
```
vagrant up
```

It will stat 2 Vbox machines and push ssh_public key to them.

- To check that it has work try to connect with ssh keys :
```
ssh vagrant@node1 -i vagrant_test_key
```


## Sources : 

### Vagrant : 
- Vagrant multimachine guide (official doc) : https://developer.hashicorp.com/vagrant/docs/multi-machine
- variables in vagrantfile : https://stackoverflow.com/questions/16708917/how-do-i-include-variables-in-my-vagrantfile
- Vagrant ansible guide (official doc) : https://developer.hashicorp.com/vagrant/docs/provisioning/ansible_common#host_vars

### Ansible
- Ansible inventory pattern : https://docs.ansible.com/ansible/latest/inventory_guide/intro_patterns.html