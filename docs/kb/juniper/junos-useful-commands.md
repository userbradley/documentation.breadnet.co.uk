---
reviewdate: '2026-12-20'
title: Junos Useful commands
---



## First boot

### Delete config pre-existing

```shell
request system zeroize
```

### Stop Chasis auto-upgrade message

Fist you need to set the root password

```shell
root# set system root-authentication plain-text-password
root# commit
```

Then we can disable the annoying message

```shell
root# delete chassis auto-image-upgrade
root# commit
```

### Set hostname

```shell
root# set system host-name name
root# commit
```

## Alarms

### Show alarms

```shell
root@bread-router-01> show system alarms
```

## Alarms

### Rescue configuration is not set

```shell
request system configuration rescue save
```
