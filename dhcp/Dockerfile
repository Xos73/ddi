FROM alpine:latest

RUN apk --no-cache add dhcp

RUN mkdir -p /etc/dhcp/cfg
RUN mkdir -p /etc/dhcp/log
# COPY unbound.conf /etc/unbound/cfg/unbound.conf
# COPY db.flaviani.be /etc/unbound/cfg/db.flaviani.be
# COPY db.10.10.10 /etc/unbound/cfg/db.10.10.10

# CMD ["unbound", "-d", "-c", "/etc/unbound/cfg/unbound.conf"]

EXPOSE 67/udp
