---
reviewdate: '2026-12-20'
title: Transport endpoint is not connected
---

This sometimes comes about when you connect to an S3 bucket via rclone then kill it,

```shell
user@host:/mnt# ls
ls: cannot access 's3': Transport endpoint is not connected
ls: cannot access 'mkdir': Transport endpoint is not connected
ls: cannot access 's4': Transport endpoint is not connected
mkdir  s3  s4
```

## To solve this

```shell
fusermount -uz <name>
```
