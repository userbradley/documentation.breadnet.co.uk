---
title: DNS on Ubuntu
outdated: true
---

# DNS on Ubuntu

1. Install the resolvconf package.
```bash
sudo apt install resolvconf
```

2. Edit /etc/resolvconf/resolv.conf.d/head and add the following:

```bash
# Make edits to /etc/resolvconf/resolv.conf.d/head.
nameserver 8.8.4.4
nameserver 8.8.8.8
```

3. Restart the resolvconf service.

```bash
sudo service resolvconf restart
```

Fix should be permanent.