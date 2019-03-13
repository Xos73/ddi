FROM alpine:latest

RUN apk --no-cache add unbound

RUN mkdir -p /etc/unbound
COPY unbound.conf /etc/unbound/unbound.conf
COPY db.flaviani.be /etc/unbound/db.flaviani.be
COPY db.10.10.10 /etc/unbound/db.10.10.10
COPY unbound.log /etc/unbound/unbound.log
RUN chmod 646 /etc/unbound/unbound.log

CMD ["unbound", "-d", "-c", "/etc/unbound/unbound.conf"]

EXPOSE 53/udp 53/tcp
