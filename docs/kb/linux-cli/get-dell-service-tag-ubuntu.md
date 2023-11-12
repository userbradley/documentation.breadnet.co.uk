---
title: Get dell service tag Ubuntu
---

## What

Dell computers have a service tag which you can use to access support

## How to get

### Install dmidecode

```shell
apt-get instal dmidecode
```

### Get the service tag

```shell
dmidecode -s system-serial-number
```
