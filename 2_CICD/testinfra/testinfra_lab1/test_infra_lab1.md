# test infra lab 1

## Description 

Test some ansible playbook with testinfra framework.
Playbook and vagrantfile reuse from ansible lab2.

## Usage 

- First start venv for testinfra : 
```
virtualenv testinfra
source testinfra/bin/activate
pip install pytest-testinfra paramiko
```

- Start the lab with vagrant :
```
vagrant up
```

- export vagrant config locally :
```
vagrant ssh-config > .vagrant/ssh-config
```

- And then execute the test by connecting to the vbox :
```
py.test --hosts=node1 --ssh-config=.vagrant/ssh-config roles/testinfra/files/test_myinfra.py
```

## Source : 

- Testinfra doc and tutorial : https://testinfra.readthedocs.io/en/latest/examples.html
- getting further with molecule (git repo for example) : https://github.com/Comcast/ansible-role-pypi