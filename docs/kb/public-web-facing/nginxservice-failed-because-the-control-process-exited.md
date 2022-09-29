---
title: nginx Failed because the Control process exited
---

Recently got this after getting a cert for bookstack.breadnet.co.uk

Run: 

```shell
sudo fuser -k 80/tcp
sudo fuser -k 443/tcp
```

Failing that

```shell
sudo netstat -tulpn
```