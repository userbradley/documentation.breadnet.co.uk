---
reviewdate: '2026-12-20'
title: Force resync of External Secret
---

## What

Sometimes a secret will not sync, or it will be outdated

## How

```shell
kubectl annotate es my-es force-sync=$(date +%s) --overwrite
```
