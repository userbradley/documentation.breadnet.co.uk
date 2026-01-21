---
title: Centos Iptables
reviewdate: '2026-12-20'
---

```bash
systemctl stop firewalld
systemctl disable firewalld
yum -y install iptables-services
nano /etc/sysconfig/iptables
systemctl restart iptables
systemctl enable iptables
```
