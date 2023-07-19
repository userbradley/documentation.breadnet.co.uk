---
title: Force Delete pod
---

## Why

That's between you and the pod. I'm not getitng involved

## How

```shell
kubectl delete pod <name> --force -grace-period=0
```
