---
title: Netplan 2 interfaces
outdated: true
---

Edit the file in /etc/netplan/ and add the below:

Make sure to back up the file!

```yaml
network:
    ethernets:
        eth0:
            dhcp4: true
        eth1:
            dhcp4: true
    version: 2
```

Worth looking [here](https://www.linux.com/topic/distributions/how-use-netplan-network-configuration-tool-linux/) for additional info