---
reviewdate: '2026-12-20'
title: Get Project ID using Metadata Endpoint
---


## Why

If you're running a workload in GKE, sometimes it's useful to know what project that pod runs under

## How

```shell
curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/project/project-id
```

## Read next

* [Get Project ID](get-project-id-using-metadata-endpoint.md)
* [Get Service Account](get-service-account-using-metadata-endpoint.md)
* [View Startup Script](view-startup-script-on-google-compute-engine-using-metadata-endpoint.md)
