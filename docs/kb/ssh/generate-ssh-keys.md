---
title: Generate SSH Keys
---

# Generate SSH Keys

## Create Keys

=== "Current user"
    ```bash
    ssh-keygen -t ed25519
    ```

=== "Specific Email address"

    ```shell
    ssh-keygen -t ed25519 -f ~/.ssh/example -C example@breadnet.co.uk
    ```


## Copy them to server

then run this but put the server name where it asks for remote host. Don't worry about using a username as they are usually the one you're logged in as.

```bash
cat ~/.ssh/id_rsa.pub | ssh username@remote_host "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```