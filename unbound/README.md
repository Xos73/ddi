# unbound
unbound is a lightweigth secure DNS server implementation.

Idea is to use create a docker compose to:
- [x] pull alpine linux
- [x] install unbound
- [x] Load unbound configuration and run it
- [x] Use/load pre-configured zone configuration

Where to store the configuration and make sure it persists after reboot?
- [ ] Analyse / Test
  - use volumes in container (and share content between containers)
  - use `--mount`in docker run to mount host available spave
- [ ] Include this into Dockerfile

## Build from local directory/repository

Build the image from the directory containing `Dockerfile` and `unbound.conf`:
```
docker build --tag=unbound_dns .
```

Create a container from the built image and listen on port 53, both udp and tcp:

```
docker run -d -p 53:53/udp -p 53:53/tcp unbound_dns
```

## Build docker solution directly from GitHub:
* Make your GitHub directory public
* Build a container and run it
```
docker build --tag=unbound_dns https://github.com/Xos73/ddi.git#master:unbound && \
docker run -d -p 53:53/tcp -p 53:53/udp unbound_dns
```
