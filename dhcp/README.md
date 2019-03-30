docker build --tag=isc_dhcp https://github.com/Xos73/ddi.git#master:kea && docker run -d -p 67:67/udp isc_dhcp
