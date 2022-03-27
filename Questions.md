# Questions

- Where to store the data from DNS and DHCP so that it survives a reboot and/or container failover
  - Several options exists. They need to be *outside* of your docker instance. I'm running it on a NFS share.
    In the mean time, was able to get a k8s environment running and looking at the option to port on a iSCSI volume (using pv's)

- What OS to use: old ATOM based fanless machine (x86) or raspberry pi?
  - Rasps 1B are too limited in resources to run docker on it, so went for an old laptop, decided on CoreOs (and moved it to flatcar) and ran my dockers on it (using portainer to manage the containers).
  - Planning to move it to my k8s setup (3 rasp 4 with 8GB).
  - (thinking) The ATOM is still around....  I could reduce the power consunption of my containers...
