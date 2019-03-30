FROM alpine:latest

# RUN apk --no-cache add kea
RUN apk update

# RUN mkdir -p /etc/unbound/cfg
# RUN mkdir -p /etc/unbound/log
# COPY unbound.conf /etc/unbound/cfg/unbound.conf
# COPY db.flaviani.be /etc/unbound/cfg/db.flaviani.be
# COPY db.10.10.10 /etc/unbound/cfg/db.10.10.10
# COPY unbound.log /etc/unbound/log/unbound.log
# RUN chmod 646 /etc/unbound/log/unbound.log

# CMD ["unbound", "-d", "-c", "/etc/unbound/cfg/unbound.conf"]
CMD ["/bin/sh"]

# EXPOSE 67/udp
