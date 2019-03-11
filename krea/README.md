# krea
Krea is the successor of the ISC-DHCP server that was around for some time

Idea is to use create a docker compose to:
* pull alpine linux
* install krea
* push krea configuration

Pay attention that krea needs mysql. To check if this will be included into this container or outside in a separate mysql container (preferred solution)

?? Where to store the configuration and make sure it persists after reboot
