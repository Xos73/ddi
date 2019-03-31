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
docker build --name=ddi_dns .
```

Create a container from the built image and listen on port 53, both udp and tcp:

```
docker run -d -p 53:53/udp -p 53:53/tcp ddi_dns
```

## Build docker solution directly from GitHub:
* Make your GitHub directory public
* Map your NFS volume
* Build a container and run it

### NFS stored information
```
docker build --tag=ddi_dns https://github.com/Xos73/ddi.git#master:unbound && \
docker run --name ipam_dns_NFS -d -p 53:53/tcp -p 53:53/udp --mount 'src=ddi_dns_conf_NFS,dst=/etc/unbound/conf,volume-driver=local,volume-opt=type=nfs,volume-opt=device=ds214:/volume1/dockerNFS/conf/dns,"volume-opt=o=addr=ds214,vers=3,soft,timeo=180,bg,tcp,rw"' ddi_dns
```

### Local volume stored information
This supposes the local volumes already exists.
This approach is not working as I want.
```
docker build --tag=ddi_dns https://github.com/Xos73/ddi.git#master:unbound && \
docker run --name ipam_dns -d -p 53:53/tcp -p 53:53/udp --mount source=ddi_conf,target=/etc/dhcp/conf,readonly ddi_dns
```
