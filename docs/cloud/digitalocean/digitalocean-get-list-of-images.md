---
title: Get list of Digital ocean images
---

# Get list of Digtal Ocean images

You will need to have the `doctl` command installed already

[]()

## Install doctl

```shell
brew install doctl
```

## List Images 

```shell
doctl compute image list --public
```

### List Ubuntu Images

```shell
doctl compute image list --public | grep ubuntu
```