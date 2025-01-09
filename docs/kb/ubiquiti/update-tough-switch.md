---
title: Update tough switch
---

Ubiquiti have renamed their tough switch line in the web UI, to [Edge MAX](https://store.ui.com/collections/operator-edgemax-routers)

## Reset the switch

It's honestly easier to reset the switch (Holding down the reset button) and then connecting to it directly.

You will need to set your network interface to the below

```text
computer IP: 192.168.1.22
subnet: 255.255.255.0
Gateway: NUll
```

## Download the firmware

[edgeswitch-xp/es-8xp/edgeswitch-xp-firmware-v210](https://www.ui.com/download/edgemax/edgeswitch-xp/es-8xp/edgeswitch-xp-firmware-v210)

## Edit your SSH config file

This is becuase it uses the `diffie hellman group` key Algorithms

```shell
Host 192.168.1.20 # (1)!
    KexAlgorithms +diffie-hellman-group1-sha1
    Ciphers aes128-cbc
```

1. Replace the IP address with that of the switch you're connecting to.

## Copy the files to the switch

```shell
scp SW.v2.1.0.142.210208.1325.bin ubnt@192.168.1.20:/tmp/fwupdate.bin
```

## SSH to the switch

```shell
ssh ubnt@192.168.1.20
```

The password will be `ubnt`

## Start the upgrade

```shell
cd /bin/
fwupdate -m
```

!!! Note "Do not panic"
    It will take around 5-10 minutes after running the command.
    DO NOT power off the switch, however you are able to unplug your computer.
