# Vagrant lab 1

## Description 

Testing vagrant by launching a simple debian virtual machine on virtualbox.

## Usage 

- Start the machine : 
``` 
vagrant up
```

- And connect to the the new machine : 
``` 
vagrant ssh
```


- Confirm that everything worked :
```
vagrant ssh
vagrant@test-box:~$ ls
    initscript_result.txt
vagrant@test-box:~$ cat initscript_result.txt 
    The initscript is working !
    the ansible playbook worked
```


- If Error "No VirtualBox Guest Additions installation found" or error with ssh "permission denied public key" occured, it is linked to the virtualbox addons (update these guest addons) : 

    - manually :
        ```
        wget -c http://download.virtualbox.org/virtualbox/6.1.38/VBoxGuestAdditions_6.1.38.iso -P opt/VirtualBox/
        ln -s /opt/VirtualBox/VBoxGuestAdditions_6.1.38.iso /home/ottomatic/.config/VirtualBox/VBoxGuestAdditions_6.1.38.iso
        ```
    - through vagrant plugin : 
        ```
        vagrant plugin uninstall vagrant-vbguest
        vagrant plugin install vagrant-vbguest
        ```




Note : Old box version (like debian/jessie64), might fail as well with identic errors (permission error) :
```
There was an error when attempting to rsync a synced folder.
Please inspect the error message below for more info.
```
Don't use so oudated boxes.

## Troubleshooting : 
(commands should be executed at the vagrant file path)

- Destroy (-f to force and not ask): 
```
vagrant destroy -f
```

- Reload machine with updated vagrantfile : 
```
vagrant reload
```

- Check for outdated boxes (--global for all boxes installed) :
```
vagrant box outdated --global
```

- Update the box in the current vagrantfile :
```
vagrant box update
```

- List installed boxes :
```
vagrant box list
```

- Delete all oudated boxes (--dry-run for just testing result, launch without it to apply changes) :
```
vagrant box prune --dry-run
```

- Install virtualbox guest addons in the current vagrant machine :
```
vagrant vbguest --do install --no-cleanup
```

- Repair broken plugin :
```
vagrant plugin repair
```

- run only provision part on running machine :
```
vagrant provision
```

## Sources :

- basic tutorial vagrant : https://medium.com/@kushwah.1/vagrant-tutorial-for-beginners-a8fc0cc9ac6d

- resolve error "No VirtualBox Guest Additions installation found" : https://www.devopsroles.com/vagrant-no-virtualbox-guest-additions-installation-found-fixed/

- (No VirtualBox Guest Additions installation found) see also the stackoverflow topic about  : https://stackoverflow.com/questions/43492322/vagrant-was-unable-to-mount-virtualbox-shared-folders

- vagrant provision basic usage  : https://developer.hashicorp.com/vagrant/docs/provisioning/basic_usage

- vagrant ansible provisionning usage : https://developer.hashicorp.com/vagrant/docs/provisioning/ansible

- vagrant ansible provisionning tutorial : https://www.theurbanpenguin.com/provisioning-vagrant-with-ansible/