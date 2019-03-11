# unbound
unbound is a lightweigth secure DNS server implementation.

Idea is to use create a docker compose to:
* pull alpine linux
* install unbound
* push unbound configuration

?? Where to store the configuration and make sure it persists after reboot

Build the image from the directory containing `Dockerfile` and `unbound.conf`:
```
docker build --tag=unbound_dns .
```

Create a container from the built image and listen on port 53, both udp and tcp:
```
docker run -d -p 53:53/udp -p 53:53/tcp unbound_dns
```

