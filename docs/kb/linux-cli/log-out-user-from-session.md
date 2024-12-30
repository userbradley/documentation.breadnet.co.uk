---
title: Log out user from Session
---

## Why/ What

When on a Linux system, you may want to kick other users out from sessions if they have been inactive for a while

## How

See who is logged in

```shell
who
```

This will return a list like the below

```shell
root@persistence:~# w
 19:44:07 up 126 days,  8:05,  3 users,  load average: 0.00, 0.01, 0.00
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
bysd     tty1     -                19:32   11:18   1.43s  0.00s -bash
bysd     pts/0    -                19:32    3:19   0.08s  1.39s sudo -s
root     pts/1    172.16.3.191     19:43    3.00s  0.01s  0.01s w
```

To log the user `bysd` out run

```shell
sudo pkill -KILL -u bysd
```

Which is the same as running

```shell
pkill -9 -u bysd
```
