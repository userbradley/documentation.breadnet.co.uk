---
reviewdate: '2026-12-20'
title: SSH using IAP
---

## Prerequisites

You need to have a firewall rule below

| IP Address        | Direction | Port |
|-------------------|-----------|------|
| `35.235.240.0/20` | `INBOUND` | `22` |

!!! note
    The above assumes you have SSH listening on port 22

## Command

```shell
gcloud compute ssh --zone "<zone of instance>" "<instance name>"  --project "<project>" --tunnel-through-iap
```
