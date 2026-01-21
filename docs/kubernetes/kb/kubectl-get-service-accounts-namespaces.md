---
reviewdate: '2026-12-20'
title: Kubectl get Service accounts and namespaces
---

## What

Nice to know all the Service accounts and namespaces

## How

```shell
kubectl get serviceaccounts --all-namespaces -o=custom-columns="NAMESPACE:.metadata.namespace,SERVICE ACCOUNT:.metadata.name"
```
