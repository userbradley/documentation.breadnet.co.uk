---
title: Get GCP project using compute metadata api server
---

## Why

If you're running a workload in GKe, sometimes it's useful to know what project that pod runs under

## How

```shell
curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/project/project-id
```