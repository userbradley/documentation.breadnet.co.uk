---
title: Disable klipper k3s
---

# Disable klipper k3s

I forgot to disable the load balancer (Klipper) on k3s, as I want to use metallb

## Disable it

edit `/etc/systemd/system/k3s.service` so it looks like the below

```shell
ExecStart=/usr/local/bin/k3s \
    server --disable servicelb \
```

Restart the service

```shell
sudo systemctl daemon-reload && sudo systemctl restart k3s
```

## Reference

[differentpla](https://blog.differentpla.net/blog/2021/12/20/disabling-klipper/)