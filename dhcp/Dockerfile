FROM alpine:latest

RUN apk --no-cache add dhcp

RUN mkdir -p /etc/dhcp/conf
RUN mkdir -p /etc/dhcp/logs
RUN mkdir -p /etc/dhcp/leases
RUN touch /etc/dhcp/leases/dhcp.leases

# COPY dhcpd.conf /etc/dhcp/conf/dhcpd.conf

CMD ["dhcpd", "-f", "-cf", "/etc/dhcp/conf/dhcpd.conf", "-lf", "/etc/dhcp/leases/dhcp.leases"]

# EXPOSE 67/udp
