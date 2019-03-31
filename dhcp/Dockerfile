FROM alpine:latest

RUN apk --no-cache add dhcp
RUN apk --no-cache add syslog-ng

RUN mkdir -p /etc/dhcp/conf
RUN mkdir -p /etc/dhcp/logs
RUN touch /var/lib/dhcp/dhcp.leases

RUN echo #!/bin/sh > /root/startup.sh
RUN echo syslog-ng >> /root/startup.sh
RUN echo alias ll=\'ls -al\' >> /root/startup.sh
RUN echo dhcpd -f -cf /etc/dhcp/conf/dhcpd.conf -lf /var/lib/dhcp/dhcp.leases >> /root/startup.sh

# COPY dhcpd.conf /etc/dhcp/conf/dhcpd.conf
COPY syslog-ng-dhcpd.conf /etc/syslog-ng/conf.d/syslog-ng-dhcpd.conf

# CMD ["dhcpd", "-f", "-cf", "/etc/dhcp/conf/dhcpd.conf", "-lf", "/var/lib/dhcp/dhcp.leases"]
CMD ["sh", "/root/startup.sh"]
