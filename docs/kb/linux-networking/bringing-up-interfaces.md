---
title: Bringing up Interfaces
reviewdate: '2022-01-01'
---
# Bringing up Interfaces

## Bringing interfaces up/down

### using `ip`

Usage:

```bash
ip link set dev <interface> up
ip link set dev <interface> down
```

Example:

```bash
ip link set dev eth0 up
ip link set dev eth0 down
```