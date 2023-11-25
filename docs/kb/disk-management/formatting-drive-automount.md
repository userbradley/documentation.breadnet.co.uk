---
title: Formatting drive and auto mount
reviewdate: '2022-01-01'
---

List logical disks and partitions
---------------------------------

`sudo fdisk -l`

[](https://gist.github.com/keithmorris/b2aeec1ea947d4176a14c1c6a58bfc36#partition-the-disk)Partition the disk
-------------------------------------------------------------------------------------------------------------

`sudo fdisk /dev/sdb`

*   Press `n` to create a partition
*   Press `p` or `l` to create primary or logical partitions
*   Press `w` to write your changes or `q` to quit

[](https://gist.github.com/keithmorris/b2aeec1ea947d4176a14c1c6a58bfc36#format-the-partition)Format the partition
-----------------------------------------------------------------------------------------------------------------

*   `sudo mkfs -t ext4 /dev/sdb1`
*   `sudo mkfs -t ext4 -N 2000000 /dev/sdb1` - This will manually set the number of inodes to 2,000,000

[](https://gist.github.com/keithmorris/b2aeec1ea947d4176a14c1c6a58bfc36#mount-disk)Mount disk
---------------------------------------------------------------------------------------------

*   `mount` - Shows what is mounted
*   `mkdir /mnt/mydrive`
*   `mount -t ext4 /dev/sdb1 /mnt/mydrive`

[](https://gist.github.com/keithmorris/b2aeec1ea947d4176a14c1c6a58bfc36#get-disks-uuid)Get disk's UUID
------------------------------------------------------------------------------------------------------

`ls -al /dev/disk/by-uuid/`
or
`blkid`

[](https://gist.github.com/keithmorris/b2aeec1ea947d4176a14c1c6a58bfc36#mount-at-boot)Mount at boot
---------------------------------------------------------------------------------------------------

Add the following line to your `/etc/fstab` file adjusting the UUID to your device's id and the directory to where you want to mount:

`UUID=811d3de0-ca6b-4b61-9445-af2e306d9999 /mnt/mydrive ext4 defaults 0 0`

`mount -a` - remounts filesystems from `/etc/fstab`
