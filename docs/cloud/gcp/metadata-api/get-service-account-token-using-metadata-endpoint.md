---
title: Get service account token using metadata endpoint
---
## Why

If you're running a workload in GKE, sometimes it's useful to know what project that pod runs under

## How

```shell
curl -H "Metadata-Flavor: Google" http://169.254.169.254/computeMetadata/v1/instance/service-accounts/default/token
```
