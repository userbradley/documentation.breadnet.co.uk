---
title: Podman mount directories on Mac
---

## Why

Due to how Podman runs on Mac, we need to run a `qemu` VM

This is managed by Podman

## How

```shell
podman machine init --now --cpus=4 --memory=2046 -v $HOME:$HOME
```
