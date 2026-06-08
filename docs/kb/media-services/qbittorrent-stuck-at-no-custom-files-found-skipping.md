---
title: qBittorrent stuck at  No custom files found, skipping...
---

## What's the issue

Sometimes when running qBittorrent, you get the below

```
migrations] started
[migrations] no migrations found
usermod: user abc is currently used by process 1
───────────────────────────────────────

██╗     ███████╗██╗ ██████╗
██║     ██╔════╝██║██╔═══██╗
██║     ███████╗██║██║   ██║
██║     ╚════██║██║██║   ██║
███████╗███████║██║╚██████╔╝
╚══════╝╚══════╝╚═╝ ╚═════╝

Brought to you by linuxserver.io
───────────────────────────────────────

To support LSIO projects visit:
https://www.linuxserver.io/donate/

───────────────────────────────────────
GID/UID
───────────────────────────────────────

User UID:    0
User GID:    0
───────────────────────────────────────
Linuxserver.io version: 5.2.1_v2.0.12-ls459
Build-date: 2026-05-26T04:47:45+00:00
───────────────────────────────────────

[custom-init] No custom files found, skipping...
```

The container will then not start, and will sit here forever

## Solution

Delete the `lockfile` under `/config/.config/qBittorrent/lockfile`

## Related sources

* [gh: qBittorrent#432](https://github.com/linuxserver/docker-qbittorrent/issues/432)
