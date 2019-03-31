FROM alpine:latest

RUN apk --no-cache add dhcp
RUN apk --no-cache add syslog-ng

RUN mkdir -p /etc/dhcp/conf
RUN mkdir -p /etc/dhcp/logs
RUN touch /var/lib/dhcp/dhcp.leases

# COPY dhcpd.conf /etc/dhcp/conf/dhcpd.conf
COPY syslog-ng-dhcpd.conf /etc/syslog-ng/conf.d/syslog-ng-dhcpd.conf

CMD ["syslog-ng"]
CMD ["dhcpd", "-f", "-cf", "/etc/dhcp/conf/dhcpd.conf", "-lf", "/var/lib/dhcp/dhcp.leases"]
