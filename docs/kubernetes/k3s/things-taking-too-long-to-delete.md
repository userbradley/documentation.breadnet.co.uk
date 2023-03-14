---
title: Things taking too long to delete
---

# Things taking too long to delete

Sometimes a _insert thing_ will take ages to delete

## Edit the resource

```shell
kubectl edit <resource>/name
```

Find the line like below

```text
  finalizers:
  - service.kubernetes.io/load-balancer-cleanup
```

Delete both lines and save.