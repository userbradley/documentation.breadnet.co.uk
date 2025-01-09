---
title: SSH port redirection
---

when you want to access a remote port on a client, but cant be asked to port forward, but can access over ssh

say a service is running on server1 on port 8090, and we want to access it from our device over port 2020

```bash
ssh -L2020:localhost:8090 server1
```
