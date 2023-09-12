---
title: Installing K3s
---

# Installing K3s

## Disable Swap

```shell
sudo swapoff -a
sudo rm /swap.img
```

Checking it is disabled

```shell
sudo swapon --show
```

This should return nothing

## Install k3s

```shell
curl -sfL https://get.k3s.io | sh -
```

## Taint a master node

```shell
kubectl taint node k3s-01 node-roles.kubernetes.io/master:NoSchedule
```

You can remove it with

```shell
kubectl taint node k3s-01 node-roles.kubernetes.io/master:NoSchedule-
```
