FROM alpine:latest

RUN apk --no-cache add dhcp

RUN mkdir -p /etc/dhcp/cfg
RUN mkdir -p /etc/dhcp/log
RUN mkdir -p /etc/dhcp/leases
RUN touch /etc/dhcp/leases/dhcp.leases

COPY dhcpd.conf /etc/dhcp/cfg/dhcpd.conf
# COPY unbound.conf /etc/unbound/cfg/unbound.conf
# COPY db.flaviani.be /etc/unbound/cfg/db.flaviani.be
# COPY db.10.10.10 /etc/unbound/cfg/db.10.10.10

CMD ["dhcpd", "-cf", "/etc/dhcp/cfg/dhcpd.conf", "-lf", "/etc/dhcp/leases/dhcp.leases"]

# EXPOSE 67/udp
