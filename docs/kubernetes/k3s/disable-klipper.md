---
reviewdate: '2026-12-20'
title: Disable klipper k3s
---


When you wish to use `metallb` in your k3s cluster you need to disable `servicelb`

## On install

```shell
curl -fL https://get.k3s.io | sh -s - --disable servicelb
```

## After the fact

If you forget to disable the klipper load balancer, follow the below steps on an already running cluster

edit `/etc/systemd/system/k3s.service` so it looks like the below

```shell
ExecStart=/usr/local/bin/k3s \
    server --disable servicelb \
```

Restart the service

```shell
sudo systemctl daemon-reload && sudo systemctl restart k3s
```

You will need to ensure this is done on every node in the cluster
