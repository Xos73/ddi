FROM alpine:latest

RUN apk --no-cache add dhcp

# RUN mkdir -p /etc/dhcp/cfg
# RUN mkdir -p /etc/dhcp/log
# COPY unbound.conf /etc/unbound/cfg/unbound.conf
# COPY db.flaviani.be /etc/unbound/cfg/db.flaviani.be
# COPY db.10.10.10 /etc/unbound/cfg/db.10.10.10

CMD ["dhcpd", "-q", "-lf", "/etc/dhcp/leases/dhcp.leases"]

EXPOSE 67/udp
