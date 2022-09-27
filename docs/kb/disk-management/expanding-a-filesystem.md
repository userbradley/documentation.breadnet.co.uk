---
title: Expanding a file system
---

Locate the root partition

```bash
df -h
```

Should look like the below 

```bash hl_lines="5"
[stannardb@xc-]:~$ df -h
Filesystem      Size  Used Avail Use% Mounted on
udev            3.9G     0  3.9G   0% /dev
tmpfs           386M  1.1M  385M   1% /run
/dev/xvda2       59G   13G   44G  22% /
tmpfs           1.9G     0  1.9G   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
tmpfs           1.9G     0  1.9G   0% /sys/fs/cgroup
/dev/loop1       90M   90M     0 100% /snap/core/8268
/dev/loop2       92M   92M     0 100% /snap/core/8592
tmpfs           386M     0  386M   0% /run/user/1000
```

Then run

```bash
growpart /dev/xvda 2
resize2fs /dev/xvda2
```