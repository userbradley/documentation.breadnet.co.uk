---
title: Get GCP Service Account using compute metadata api server
---

# Get GCP Service Account using compute metadata api server

## Why

If you're using workload identity in Kubernetes, sometimes you need to know what _external_ (being GCP) Service account youre
running as

## How

```shell
curl -H "Metadata-Flavor: Google" http://169.254.169.254/computeMetadata/v1/instance/service-accounts/
```

## Read Next

[Get Project](api-get-project.md)