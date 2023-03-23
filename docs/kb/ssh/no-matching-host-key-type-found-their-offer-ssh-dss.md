---
title: no matching host key type found. Their offer: ssh-dss
---

# no matching host key type found. Their offer: ssh-dss

## Example error message

```text
ssh root@192.168.8.109

Unable to negotiate with 192.168.8.109 port 22: no matching host key type found. Their offer: ssh-dss
```

## Solution

Add an entry for the host in your `~/.ssh/config`

```shell
host 192.168.8.109
 hostname 192.168.8.109
 HostKeyAlgorithms=+ssh-dss
```