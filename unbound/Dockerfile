FROM alpine:latest

RUN apk --no-cache add unbound

# RUN mkdir -p /etc/unbound/conf /etc/unbound/logs
# COPY unbound.conf /etc/unbound/conf/unbound.conf
# COPY db.flaviani.be /etc/unbound/conf/db.flaviani.be
# COPY db.10.10.10 /etc/unbound/conf/db.10.10.10
RUN touch /etc/unbound/logs/unbound.log && chmod 646 /etc/unbound/logs/unbound.log

CMD ["unbound", "-d", "-c", "/etc/unbound/conf/unbound.conf"]

EXPOSE 53/udp 53/tcp
