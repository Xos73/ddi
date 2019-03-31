FROM alpine:latest

RUN apk --no-cache add unbound

RUN mkdir -p /etc/unbound/conf
RUN mkdir -p /etc/unbound/log
# COPY unbound.conf /etc/unbound/conf/unbound.conf
# COPY db.flaviani.be /etc/unbound/conf/db.flaviani.be
# COPY db.10.10.10 /etc/unbound/conf/db.10.10.10
TOUCH /etc/unbound/log/unbound.log
RUN chmod 646 /etc/unbound/log/unbound.log

CMD ["unbound", "-d", "-c", "/etc/unbound/conf/unbound.conf"]

EXPOSE 53/udp 53/tcp
