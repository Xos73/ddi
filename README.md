# ddi
Set of docker containers performing DDI (Secure DNS, DHCP &amp; IPAM)

Goal is to use docker compose files and store them on GitHub.
Pulling in the definitions from GitHub will allow automatic configuration of all DDI components.

The DDI will have following features:

* Oriented to home infrastructure
* Provide DHCP services
* Provide DNS services:
  - Resolving a set of locally defined hosts
  - Resolving a locally defined domain name
  - Forwarding non defined FQDNs
  - Allow (secure) dDNS
* Provide IPAM (IP Address Management) services
* GUI interface to manage both services
* GUI interface to inspect who is on your network

## Build docker solution directly from GitHub:
* Make your GitHub directory public
* Build a container and run it
Example for unbound DNS server
```
docker build --tag=unbound_dns https://github.com/Xos73/ddi.git#master:unbound && \
docker run -d -p 53:53/tcp -p 53:53/udp unbound_dns
```

Based on https://dev.to/mizutani/design--implementation-of-modern-router-with-docker--linux-for-home-and-small-office-4301
Github: https://github.com/m-mizutani/docker-based-home-router
