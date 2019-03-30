FROM node:8-slim  
MAINTAINER dodgydudes  
RUN apt-get update && apt-get -y --no-install-recommends install git && git clone https://github.com/Akkadius/glass-isc-dhcp.git /opt/glass  
WORKDIR /opt/glass  
RUN mkdir logs && chmod u+x ./bin/ -R && chmod u+x *.sh && npm install  
VOLUME /var/lib/dhcp/dhcpd.leases /var/log/dhcp.log /etc/dhcp/dhcpd.conf /opt/glass/config  
EXPOSE 3000  
ENTRYPOINT ["npm", "start"]
