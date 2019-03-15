# Persistent data
How to work/cope with the issue of:
1. Persistent data (retain data even after a container destroy)
    - on same (host) docker machine
    - over different (host) docker machines
2. Share data between containers (RO/RW/Master)
3. Share data between containers and host

Where to store the configuration and make sure it persists after reboot?
- [ ] Analyse / Test
  - use volumes in container (and share content between containers)
  - use `--mount`in docker run to mount host available spave
- [ ] Include this into Dockerfile

### Volumes / mounts
For volumes in docker: see https://docs.docker.com/storage/volumes/
![Use volumes](https://docs.docker.com/storage/images/types-of-mounts-volume.png)

For mounts in docker: see https://docs.docker.com/storage/bind-mounts/
![Use bind mounts](https://docs.docker.com/storage/images/types-of-mounts-bind.png)
