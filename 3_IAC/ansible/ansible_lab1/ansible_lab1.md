# Ansible lab 1

## Description 

Deploy simple ansible playbook that upgrade system (apt update and upgrade). Discovering ansible features.

## Usage 

- First configure the target (host) in the playbook and the inventory.

- Start the playbook
```
ansible-playbook -i inventory_example.yml  ansible_test_playbook.yml
```

### Troubleshooting : 

- check host list :
```
ansible all --list-hosts
```

- Test hosts connectivity :
```
ansible all -m ping
```


## Source :

- Ansible explain (official doc) : https://docs.ansible.com/ansible/latest/getting_started/index.html

- Redhat ansible guide : https://www.redhat.com/fr/topics/automation/learning-ansible-tutorial

- ansible role tutorial : https://devopssec.fr/article/roles-ansible

- ansible guide (from ansible galaxy) : https://galaxy.ansible.com/docs/contributing/creating_role.html

- Security enforcing on new server with ansible guide : https://www.redhat.com/sysadmin/harden-new-system-ansible