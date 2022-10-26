---
title: cloud-init
outdated: true
---

# cloud-init
Cloud init is awesome, but a pain to set up.



Hopefully if you're reading this then we're on an adventure!



Create a vm of ubuntu

Set it up with your usual username and password

Log on and mount the xen tools. (guest-tools.iso on xcp)

on the vm

```shell
mount /dev/cdrom /mnt
bash ./mnt/Linux/install.sh
```

```shell
apt-get install cloud-init cloud-initramfs-growroot
```

Delete the stuff in `/var/lib/cloud/instance`

```
rm -rvf /var/lib/cloud/instance/*
```

Probably worth doing any custom shit like dot files or default ssh keys, ntp settings, routes and dns settings. Whilst this can be done though cloud-init, it does help to have it in the template



Unmount any disks and clear anything off the VM like text files or crap you've left there

Shutdown the VM and convert it to a template on xcp-ng



When you create a new VM, ensure to use the name of the template vm. Pick your cloud-init type, be in a full file or just ssh keys.



Sauce: http://www.whiteboardcoder.com/2016/04/install-cloud-init-on-ubuntu-and-use.html