---
title: Minio over s3fs
outdated: true
---

# Minio over s3fs

## Create the password file

```bash
sudo echo private:sectet > /etc/passwd-s3fs
```

## Assign permissions

```bash
chmod 600 /etc/passwd-s3fs
```

## Create a mount point for the bucket

```bash
sudo mkdir /mnt/s3
```

## Connect to the bucket

```bash
s3fs <bucket> /mnt/s3 -o passwd_file=/etc/passwd-s3fs,use_path_request_style,url=https://s3.breadnet.co.uk:9000
```

