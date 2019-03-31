# Glass (DHCP UI)

Run the image (make sure to match the volumes)
```
docker build --tag=ddi_dhcp_glass https://github.com/Xos73/ddi.git#master:tools/glass && \
docker run --name ipam_glass -tid \  
 --mount 'src=ddi_dhcp_conf_NFS,dst=/etc/dhcp,volume-driver=local,volume-opt=type=nfs,volume-opt=device=ds214:/volume1/dockerNFS/conf/dhcp,"volume-opt=o=addr=ds214,vers=3,soft,timeo=180,bg,tcp,ro"' \
 --mount 'src=ddi_dhcp_leases_NFS,dst=/var/lib/dhcpd,volume-driver=local,volume-opt=type=nfs,volume-opt=device=ds214:/volume1/dockerNFS/logs/dhcp_leases,"volume-opt=o=addr=ds214,vers=3,soft,timeo=180,bg,tcp,ro"' \
 --mount src=ddi_dhcp_logs,dst=/var/log/dhcp,ro \
 --mount src=glass-config,dst=/opt/glass/config \
 -p 3000:3000 ddi_dhcp_glass:latest
```


{
  "admin_user": "glassadmin",
  "admin_password": "glassadmin",
  "leases_file": "/var/lib/dhcp/dhcpd.leases",
  "log_file": "/var/log/dhcp.log",
  "config_file": "/etc/dhcp/dhcpd.conf",
  "shared_network_critical_threshold": "95",
  "shared_network_warning_threshold": "0",
  "slack_webhook_url": "",
  "slack_alert_channel": "",
  "leases_per_minute_threshold": "50",
  "ip_ranges_to_allow": [
    ""
  ],
  "email_alert_to": "",
  "sms_alert_to": ""
}

## Orig
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
