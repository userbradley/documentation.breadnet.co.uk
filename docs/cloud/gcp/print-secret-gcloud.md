---
reviewdate: '2026-12-20'
title: Print secret using gcloud
---

## Why

When working with GCP secrets, sometimes you need to print them on the command line, to be used in other commands

## How

You will need to know the below before

* Secret name
* Secret project

```shell
gcloud secrets versions access latest --secret=<secret name> --project=<Secrets project>
```

## Read next

* [List secrets being accessed Google cloud logs](list-secrets-being-accessed-google-cloud-logging.md)
