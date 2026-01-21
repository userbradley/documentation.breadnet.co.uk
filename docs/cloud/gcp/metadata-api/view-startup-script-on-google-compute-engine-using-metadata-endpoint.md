---
reviewdate: '2026-12-20'
title: View startup script on Google Compute Engine using Metadata Endpoint
---

## Why

When troubleshooting a startup script, sometimes you want to see what was applied, from in the VM

## How

```shell
curl --header "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/attributes/startup-script"
```

## Read Next

* [Get Project ID](get-project-id-using-metadata-endpoint.md)
* [Get Service Account](get-service-account-using-metadata-endpoint.md)
* [View Startup Script](view-startup-script-on-google-compute-engine-using-metadata-endpoint.md)
