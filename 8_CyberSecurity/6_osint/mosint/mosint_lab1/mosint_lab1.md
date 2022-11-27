# Mosint lab 1

## Description : 

Testing  osint tools to get mail data, as always launching from container.

## Usage :

- First build the our mosint docker image :
```
docker build -f mosint_dockerfile -t mosint:1
```
<!-- docker build -f mosint_dockerfile -t mosint:1 -->

- Then run a container :
```
docker run -it --rm --memory-reservation="200m" --memory="400m" --memory-swap="600g" --name mosint_cont mosint:1 
```

- And test it :
```
mosint example@mail.com
```

Without API configured, result are really limited.

## Sources : 

- Idea come from youtube tutorialabout osint tools : https://www.youtube.com/watch?v=TOmXdAzStms
- Mosint usage (tutorial) : https://www.geeksforgeeks.org/mosint-osint-tool-for-emails-in-kali-linux/
- Mosint repo (github) : https://github.com/alpkeskin/mosint
- ressources (RAM / CPU) limitation in docker tutorial : https://phoenixnap.com/kb/docker-memory-and-cpu-limit
- set process ressources limitation with cgroups : https://unix.stackexchange.com/questions/555080/using-cgroup-to-limit-program-memory-as-its-running