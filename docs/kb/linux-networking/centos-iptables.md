---
title: Centos Iptables
reviewdate: '2022-01-01'
---

```bash
systemctl stop firewalld
systemctl disable firewalld
yum -y install iptables-services
nano /etc/sysconfig/iptables
systemctl restart iptables
systemctl enable iptables
```
