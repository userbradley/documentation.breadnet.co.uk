---
title: Mount a new drive
---

# Mount a new drive

How to mount a new drive on a linux system over command line

---

First, list the physically installed disks

```bash
fdisk -l
```

Next, Pick the disk you want to mount

```bash
mkfs.ext4 /dev/<disk path>
```

Mount the drive

```bash
mount /dev/<disk path> /<location to mount>
```

To auto mount it, edit fstab

Firstly, found out it's UUID

```bash
blkid
```

should look like the below, here we want /dev/xvdb

```bash hl_lines="2"
[stannardb@nextcloud]:~$ blkid
/dev/xvdb: UUID="02ed6055-ccea-40d7-a735-4045a36df5d7" TYPE="ext4"
/dev/xvda2: UUID="0fa95d3f-7231-4b98-94ca-3d407d88f600" TYPE="ext4" PARTUUID="8ecf3453-59dd-4535-94e6-656f66c289f7"
/dev/sr0: UUID="2019-07-16-08-51-27-00" LABEL="XCP-ng Tools" TYPE="iso9660"
```
```bash
sudo nano /etc/fstab
```

```text
UUID=02ed6055-ccea-40d7-a735-4045a36df5d7 /nextcloud ext4 defaults 0 0
```

This mounts the disk with the UUID of `02ed6055-ccea-40d7-a735-4045a36df5d7` to `/nextcloud` as an `ext4` drive



??? info "Old Method"
    ```
    Device	Mountpoint	fstype	option	dump	fsck
    /dev/sdb1	/home/yourname/mydata	ext4	defaults	0	1
    ```