# h8mail lab 1

## Description 

Testing tool h8mail.

## Usage 

- first build the image :
```
docker build -f /home/ottomatic/lab/h8mail/h8mail_dockerimage /home/ottomatic/lab/h8mail -t h8mail_img:1
```

- then run it and play with it :

```
docker run -it --rm --name h8mail_cont h8mail_img:1 
h8mail -t target@example.com
```

## Source : 

- python docker image ref : https://hub.docker.com/layers/library/python/3.9.15-slim-bullseye/images/sha256-52b3520e1bdc1775f55cb8f38a09b14a9f9b14d8e5744e7559d0ae03673115d3?context=explore