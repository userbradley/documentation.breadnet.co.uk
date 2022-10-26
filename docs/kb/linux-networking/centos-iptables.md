---
title: Centos Iptables
outdated: true
---

# Centos Iptables

```bash
systemctl stop firewalld
systemctl disable firewalld
yum -y install iptables-services
nano /etc/sysconfig/iptables
systemctl restart iptables
systemctl enable iptables
```
