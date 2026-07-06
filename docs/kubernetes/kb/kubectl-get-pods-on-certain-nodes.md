---
title: Kubectl get pods on certain nodes
---

```shell
kubectl get pods --field-selector spec.nodeName=rg-talos-1
```
