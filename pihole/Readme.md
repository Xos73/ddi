# pihole setup

Find password after docjer installation:
docker logs pihole | grep random

## Build docker solution directly from GitHub:
* Make your GitHub directory public
* Map your NFS volume
* Build a container and run it

### NFS stored information
```
docker build --tag=pi-hole https://github.com/Xos73/ddi.git#master:pihole && \
docker run --name pi-hole_NFS -d \
  -p 54:53/tcp -p 54:53/udp \
  -p 88:80/tcp \
  -p 68:67/udp \
  -e TZ="Europe/Brussels" \
  --restart=unless-stopped \
  --hostname pi-hole \
  --mount 'src=ddi_dns_conf_NFS,dst=/etc/unbound/conf,volume-driver=local,volume-opt=type=nfs,volume-opt=device=ds214:/volume1/dockerNFS/conf/dns,"volume-opt=o=addr=ds214,vers=3,soft,timeo=180,bg,tcp,rw"' ddi_dns
```
Issues with DNS not running to resolve NFS server
```
docker build --tag=ddi_dns https://github.com/Xos73/ddi.git#master:unbound && \
docker run --name ipam_dns_NFS_FixIP -d -p 53:53/tcp -p 53:53/udp --mount 'src=ipam_dns_NFS_FixIP,dst=/etc/unbound/conf,volume-driver=local,volume-opt=type=nfs,volume-opt=device=10.10.10.15:/volume1/dockerNFS/conf/dns,"volume-opt=o=addr=10.10.10.15,vers=3,soft,timeo=180,bg,tcp,rw"' ddi_dns
```


## Valid docker-compose.yaml file
```
version: "3"

services:
  pihole:
    container_name: pihole_NFS
    image: pihole/pihole:latest
    ports:
      - "54:53/tcp"
      - "54:53/udp"
      # - "67:67/udp"
      - "88:80/tcp"
    environment:
      TZ: 'Europe/Brussels'
      # WEBPASSWORD: 'set a secure password here or it will be random'
      # PIHOLE_DNS_: 10.10.10.11#54;8.8.8.8
      # DNS_BOGUS_PRIV: "true"
      # DNS_FQDN_REQUIRED: "false"
      # REV_SERVER: "true"
    # Volumes store your data between container upgrades
    volumes:
      - 'piholeconf:/etc/pihole/'
      - 'dnsmasqdconf:/etc/dnsmasq.d/'
    # Recommended but not required (DHCP needs NET_ADMIN)
    #   https://github.com/pi-hole/docker-pi-hole#note-on-capabilities
    cap_add:
      - NET_ADMIN
    restart: unless-stopped
volumes:
  piholeconf:
    driver_opts:
      type: "nfs"
      o: "addr=10.10.10.15,nolock,soft,rw"
      device: ":/volume1/dockerNFS/conf/pihole/etc-pihole"
  dnsmasqdconf:
    driver_opts:
      type: "nfs"
      o: "addr=10.10.10.15,nolock,soft,rw"
      device: ":/volume1/dockerNFS/conf/pihole/etc-dnsmasq.d"
      
```

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

### Local volume stored information
This supposes the local volumes already exists.
This approach is not working as I want.
```
docker build --tag=ddi_dns https://github.com/Xos73/ddi.git#master:unbound && \
docker run --name ipam_dns -d -p 53:53/tcp -p 53:53/udp --mount source=ddi_conf,target=/etc/dhcp/conf,readonly ddi_dns
```
