Build the image.

```
docker build -t glass .
```

Create a volume to store the Glass configuration file.

```
docker volume create glass-config
```

Find where your dhcpd.leases, dhcp.log and dhcpd.conf are located, you need to bind mount them to the docker container. Below you can see where they were on my CentOS 7 system.

```
docker run --name glass --hostname dhcp -tid \  
-v /var/lib/dhcpd/dhcpd.leases:/var/lib/dhcp/dhcpd.leases:ro \
-v /var/log/dhcp.log:/var/log/dhcp.log:ro \
-v /etc/dhcp/dhcpd.conf:/etc/dhcp/dhcpd.conf:ro \
-v glass-config:/opt/glass/config -p 3000:3000 glass:latest
```
Note: Beware of trailing spaces above. Better watch that copypasta!
