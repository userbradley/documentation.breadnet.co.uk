---
title: Release FLY IP address
---

## Why

Fly (Like everyone) sits on alot of IP address' - and they're in short supply.

You now get charged $1.75 per IP address

## How to release

### List apps

First you need to list the apps you want to remove IPV4 address from

```shell
fly apps list
```

### List IP's associated with those apps

_assuming your app is called `my-app`_

```shell
fly ips list -a my-app
```

You will get a print-out like the below

```text
VERSION IP                      TYPE    REGION  CREATED AT
v4      149.248.195.56          public  global  2022-11-14T11:05:31Z
v6      2a09:8280:1::a:9a97     public  global  2022-11-14T11:05:35Z
```

### Release IP's

```shell
fly ips release 149.248.195.56 -a my-app
```

Which will return

```text
Released 149.248.195.56 from documentation-dev
```

### Assign Shared IP

As soon as you remove the IP address, the DNS will fail, even for the `flu.io` domain

```shell
fly ips allocate-v4 --shared -a my-app
```

This will assign a shared (free) IP address to the application
