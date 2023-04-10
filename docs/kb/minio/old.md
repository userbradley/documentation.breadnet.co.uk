---
title: OLD
reviewdate: '2022-01-01'
---



## Adding s3fs
```bash
sudo echo private:sectet > /etc/passwd-s3fs
chmod 600 /etc/passwd-s3fs
s3fs <bucket> /s3 -o passwd_file=/etc/passwd-s3fs,use_path_request_style,url=https://s3.breadnet.co.uk:9000
```

## connecting to server backup bucket

```bash
s3fs serverbackup /mnt/s3 -o passwd_file=/etc/passwd-s3fs,use_path_request_style,url=https://s3.breadnet.co.uk:9000
```

## create mc user

```./mc admin user add <name><password>```


Add them to the readwrite group ./mc admin policy set myminio readwrite user=<user>



## backup script by date
```basg
mkdir /mnt/s3/<servername>/$(date +"%m-%d-%y")

rsync -ravzX </path/to/file/you/want/to/backup/> /mnt/s3/<hostname>/$(date +"%m-%d-%y")/
```

## normal backup

```bash
rsync -ravzX <path to backup folder> /mnt/s3/<hostname>
```

## backup that removes files removed on local system

```bash
rsync -ravzX --delete<path to backup folder> /mnt/s3/<hostname>
```