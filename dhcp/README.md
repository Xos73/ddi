## ISC-BIND
Build and run the ISC DHCP server. Use NFS volumes for persistent info and local volumes to share with glass (UI)
```
docker build --tag=ddi_dhcp https://github.com/Xos73/ddi.git#master:dhcp && \
docker run --name ipam_dhcp_NFS -d --network=host \
 --mount 'src=ddi_dhcp_conf_NFS,dst=/etc/dhcp/conf,volume-driver=local,volume-opt=type=nfs,volume-opt=device=ds214:/volume1/dockerNFS/conf/dhcp,"volume-opt=o=addr=ds214,vers=3,soft,timeo=180,bg,tcp,rw"' \
 --mount 'src=ddi_dhcp_leases_NFS,dst=/var/lib/dhcp,volume-driver=local,volume-opt=type=nfs,volume-opt=device=ds214:/volume1/dockerNFS/logs/dhcp_leases,"volume-opt=o=addr=ds214,vers=3,soft,timeo=180,bg,tcp,rw"' \
 --mount src=ddi_dhcp_logs,dst=/var/log/dhcp \
 ddi_dhcp
```

# Glass (UI)
Source is found in seperate directory of the git (tools\glass)
See over there
