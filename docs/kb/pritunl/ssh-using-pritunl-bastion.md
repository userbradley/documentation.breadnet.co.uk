---
reviewdate: '2026-12-20'
title: SSH using pritunl bastion
---

## Install pritunl ssh agent

```shell
brew tap pritunl/tap
brew install pritunl-ssh
```

## Configure your ssh config

```shell
host <>
 hostname <>
 user <>
 proxyjump bastion@<bastion domain>:9800
```
