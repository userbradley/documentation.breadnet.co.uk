---
title: gpt pmbr size mismatch will be corrected by write
outdated: true
---

# gpt pmbr size mismatch will be corrected by write

Fdisk used to not work at all on gpt partitioned drives, it just reported that drive was gpt partitioned. Better to use parted, gparted or gdisk. Gdisk has been the command line tool for gpt drives.

Post these:

```bash
sudo parted -l
```

or

```bash
sudo parted /dev/sda unit s print
```

or

```bash
sudo gdisk -l /dev/sda
```

Then: [Expand the filesystem](/kb/disk-management/expanding-a-filesystem/)
