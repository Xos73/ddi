# unbound
unbound is a lightweigth secure DNS server implementation.

Idea is to use create a docker compose to:
- [x] pull alpine linux
- [x] install unbound
- [x] Load unbound configuration and run it
- [x] Use/load pre-configured zone configuration

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
* Map your NFS volume
* Build a container and run it
```
docker volume create --driver local --name unbound_cfg --opt type=nfs \
--opt device=:/dockerNFS/config --opt o=addr=10.10.10.14,rw,noatime
docker build --tag=unbound_dns https://github.com/Xos73/ddi.git#master:unbound && \
docker run -d -p 53:53/tcp -p 53:53/udp unbound_dns --mount source=unbound_cfg,destination=/etc/test,readonly
```
