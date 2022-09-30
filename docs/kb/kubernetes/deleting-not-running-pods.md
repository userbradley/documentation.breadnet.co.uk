---
title: Deleting not running pods
---

We can use this to delete pods that are in a failed state

```shell
kubectl get pods --field-selector status.phase!=Running -n <namespace> -o name | xargs kubectl delete -n <namespace>
```

