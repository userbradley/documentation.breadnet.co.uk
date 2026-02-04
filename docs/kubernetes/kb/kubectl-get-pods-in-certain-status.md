---
title: Kubectl get pods in certain status
---

## Why

Sometimes when working on a cluster you want to know how many pods have failed across the entire cluster or herpahs how
many are pending.

## How

### Failed

```shell
kubectl get pods --all-namespaces --field-selector status.phase=Failed
```

### Pending

```shell
kubectl get pods --all-namespaces --field-selector status.phase=Pending
```
