---
title: Importing SSH keys from GitHub
reviewdate: '2025-01-01'
---

## Why

Sometimes you need a quick and easy way to add your personal SSH keys to a server

We can use GitHub as our source for SSH keys

## How

=== "Root"
    ```bash
    wget -O - https://github.com/userbradley.keys >> /root/.ssh/authorized_keys
    ```
=== "Current user"
    ```bash
    wget -O - https://github.com/userbradley.keys >> ~/.ssh/authorized_keys
    ```

## What to read next

[Import Public keys for ssh hosts](import-public-keys-for-ssh-hosts.md)
