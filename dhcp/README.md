docker build --tag=isc_dhcp https://github.com/Xos73/ddi.git#master:dhcp && docker run -d --network host isc_dhcp

Copied over from dns container:
### NFS stored information
```
docker build --tag=ddi_dns https://github.com/Xos73/ddi.git#master:unbound && \
docker run --name ipam_dns_NFS -d -p 53:53/tcp -p 53:53/udp --mount 'src=ddi_conf_NFS,dst=/etc/unbound/conf,volume-driver=local,volume-opt=type=nfs,volume-opt=device=ds214:/volume1/dockerNFS/conf/dns,"volume-opt=o=addr=ds214,vers=3,soft,timeo=180,bg,tcp,rw"' ddi_dns
```

### Adapted:
```
docker build --tag=ddi_dhcp https://github.com/Xos73/ddi.git#master:dhcp && \
docker run --name ipam_dhcp_NFS -d --network=host \
 --mount 'src=ddi_dhcp_conf_NFS,dst=/etc/dhcp/conf,volume-driver=local,volume-opt=type=nfs,volume-opt=device=ds214:/volume1/dockerNFS/conf/dhcp,"volume-opt=o=addr=ds214,vers=3,soft,timeo=180,bg,tcp,rw"' \
 --mount 'src=ddi_dhcp_leases_NFS,dst=/var/lib/dhcp,volume-driver=local,volume-opt=type=nfs,volume-opt=device=ds214:/volume1/dockerNFS/logs/dhcp_leases,"volume-opt=o=addr=ds214,vers=3,soft,timeo=180,bg,tcp,rw"' \
 --mount src=ddi_dhcp_logs,dst=/var/log/dhcp \
 ddi_dhcp
```
Make the logs available to Glass.... but how to force isc-dhcp to log to it (outside the system log)
--mount 'src=ddi_logs_NFS,dst=/etc/unbound/conf,volume-driver=local,volume-opt=type=nfs,volume-opt=device=ds214:/volume1/dockerNFS/conf/dns,"volume-opt=o=addr=ds214,vers=3,soft,timeo=180,bg,tcp,rw"' \

find solution for the leases (to be read by GLASS):
--mount 'src=ddi_conf_NFS,dst=/etc/unbound/conf,volume-driver=local,volume-opt=type=nfs,volume-opt=device=ds214:/volume1/dockerNFS/conf/dns,"volume-opt=o=addr=ds214,vers=3,soft,timeo=180,bg,tcp,rw"' \

