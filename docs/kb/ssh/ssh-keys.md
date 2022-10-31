---
title: SSH keys
---

# SSH keys

## generate SSH keys and copy them to host

On the host you are logged in to, but want to ssh to another host with no password run the below

```bash
ssh-keygen -t ed25519
```
## Copy them to server

then run this but put the server name where it asks for remote host. Don't worry about using a username as they are usually the one you're logged in as.

```bash
cat ~/.ssh/id_rsa.pub | ssh username@remote_host "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```