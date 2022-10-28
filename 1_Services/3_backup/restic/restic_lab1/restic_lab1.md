# restic lab 1

## Description

First steps with restic backup tools

## Usage 

### initialize repo

- On local : 
```
restic init --repo /srv/restic-repo
```

- With sftp :
```
restic -r sftp:user@host:/srv/restic-repo init
```

### backup 

```
restic -r {{ restic_server_repo }} backup /home --exclude='/home/ottomatic/.local' /var
```

### listing snapshot 

```
restic -r {{ restic_server_repo }} list snapshots
```

## sources : 

- official restic documentation : https://restic.readthedocs.io/en/latest/
- tutorial to use restic : https://adamtheautomator.com/restic-backup/
- restic backup command example : https://medium.com/codex/restic-backup-ii-in-action-d8bad3d9e034
- backup docker volume with restic tutorial : https://janikvonrotz.ch/2020/03/16/backup-docker-volumes-with-ansible-and-restic/
- github repo for restic with ansible : https://github.com/donat-b/ansible-restic