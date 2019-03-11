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
