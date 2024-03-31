---
title: Get list of Digital ocean images
---


You will need to have the `doctl` command installed already

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

## Referral

I don't want to do this, but I run this site at a loss, if you're thinking of using DO, use the below

[![DigitalOcean Referral Badge](https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%202.svg#only-light)](https://www.digitalocean.com/?refcode=77be3c3aa96c&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge)
[![DigitalOcean Referral Badge](https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%201.svg#only-dark)](https://www.digitalocean.com/?refcode=77be3c3aa96c&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge)
