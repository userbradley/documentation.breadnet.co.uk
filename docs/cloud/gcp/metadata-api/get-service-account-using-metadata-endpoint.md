---
title: Get Service Account using Metadata Endpoint
---

## Why

If you're using workload identity in Kubernetes, sometimes you need to know what _external_ (being GCP) Service account you're running as

## How

```shell
curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/
```

## Read Next

* [Get Project ID](get-project-id-using-metadata-endpoint.md)
* [Get Service Account](get-service-account-using-metadata-endpoint.md)
* [View Startup Script](view-startup-script-on-google-compute-engine-using-metadata-endpoint.md)
