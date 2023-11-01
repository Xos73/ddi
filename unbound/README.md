# unbound
unbound is a lightweigth secure DNS server implementation.

Idea is to use create a docker compose to:
- [x] pull alpine linux
- [x] install unbound
- [x] Load unbound configuration and run it
- [x] Use/load pre-configured zone configuration

## Build docker solution directly from GitHub:
* Make your GitHub directory public
* Map your NFS volume
* Build a container and run it

### Prereq - NFS client soft
```
apt install nfs-common
```

### Prereq - update hosts file
```
cat <<EOF | sudo tee -a /etc/hosts
10.10.10.15 nfs-srv
EOF
```

### Create the docker (using NFS storage)
Make sure to add a /etc/hosts entry for your NFS server. In my case, this is nfs-srv
Updated to store conf files in separate location
```
docker build --tag=ddi_dns https://github.com/Xos73/ddi.git#master:unbound && \
docker run --name ipam_dns -d -p 53:53/tcp -p 53:53/udp \
  --restart=always
  --mount 'src=ipam_dns_conf,dst=/etc/unbound/conf,volume-driver=local,volume-opt=type=nfs,volume-opt=device=nfs-srv:/volume1/dockerNFS/conf/dns,"volume-opt=o=addr=nfs-srv,vers=3,soft,timeo=180,bg,tcp,rw"' \
  --mount 'src=ipam_dns_logs,dst=/etc/unbound/logs,volume-driver=local,volume-opt=type=nfs,volume-opt=device=nfs-srv:/volume1/dockerNFS/logs/dns,"volume-opt=o=addr=nfs-srv,vers=3,soft,timeo=180,bg,tcp,rw"' \
  ddi_dns
```

## Archive and old/obsolete info
### Build from local directory/repository

Build the image from the directory containing `Dockerfile` and `unbound.conf`:
```
docker build --name=ddi_dns .
```

Create a container from the built image and listen on port 53, both udp and tcp:

```
docker run -d -p 53:53/udp -p 53:53/tcp ddi_dns
```
### Local volume stored information
This supposes the local volumes already exists.
This approach is not working as I want.
```
docker build --tag=ddi_dns https://github.com/Xos73/ddi.git#master:unbound && \
docker run --name ipam_dns -d -p 53:53/tcp -p 53:53/udp --mount source=ddi_conf,target=/etc/dhcp/conf,readonly ddi_dns
```

### Issues with DNS not running to resolve NFS server
```
docker build --tag=ddi_dns https://github.com/Xos73/ddi.git#master:unbound && \
docker run --name ipam_dns_NFS_FixIP -d -p 53:53/tcp -p 53:53/udp --mount 'src=ipam_dns_NFS_FixIP,dst=/etc/unbound/conf,volume-driver=local,volume-opt=type=nfs,volume-opt=device=10.10.10.15:/volume1/dockerNFS/conf/dns,"volume-opt=o=addr=10.10.10.15,vers=3,soft,timeo=180,bg,tcp,rw"' ddi_dns
```
### Create the docker (using NFS storage), no split of log files
```
docker build --tag=ddi_dns https://github.com/Xos73/ddi.git#master:unbound && \
docker run --name ipam_dns_NFS -d -p 53:53/tcp -p 53:53/udp --mount 'src=ddi_dns_conf_NFS,dst=/etc/unbound/conf,volume-driver=local,volume-opt=type=nfs,volume-opt=device=nfs-srv:/volume1/dockerNFS/conf/dns,"volume-opt=o=addr=nfs-srv,vers=3,soft,timeo=180,bg,tcp,rw"' ddi_dns
```
