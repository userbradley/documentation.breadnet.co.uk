---
title: Connect to container that has sidecars
---

# Connect to container that has sidecars

```shell
admin exec -it -n <namespace>  <pod name> -c <sidecar name> /bin/sh
```
 This makes some assumptions:


1. You will need to know the namespace of the container first, use `kubectl get namespaces` and then `kubectl get pods -n <namespace)`
2. This assumes there is `/bin/sh` installed. Some containers do not have a shell.
