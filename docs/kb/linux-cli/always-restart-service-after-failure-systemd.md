---
title: Always restart service after failure - systemd
---

# Always restart service after failure - systemd

## Why

Some services are critical to operation and without them, we may have issues like not being able to access systems.

These services don't really fail often, and are not dangerous to restart loop them.

## Edit the system File

Navigate to

```shell
/etc/systemd/system/
```

Edit the name of the service, example being

* Service: Bradley
* File: `bradley.service`

## Update [Service]

Place below the line `[Service]` the following

```shell
Restart=always
RestartSec=3
```

You can tweak `RestartSec` however you want

## Reload the System

```shell
systemctl daemon-reload
```

## Additional Reading

* [ServerFault](https://serverfault.com/questions/252137/how-to-automatically-restart-a-service-on-failure-in-linux)
