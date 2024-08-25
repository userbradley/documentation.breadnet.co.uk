---
title: gcloud Disable Services
---

## What

In GCP, services are enabled and disabled to use them

## How

```shell
gcloud services disable <name> --project=<>
```

## Errors you may get

```text
Please specify disable_dependent_services=true if you want to proceed with disabling all services.
```

See [Disable dependent services](gcloud-disable-dependent-services.md)
