---
title: 'err: exec: "docker-credential-gcloud": executable file not found in $PATH'
---

## What

When [setting up Authentication to Google Artifact Registry](authenticate-to-google-artifact-registry.md) you may get the below error

```text
error getting credentials - err: exec: "docker-credential-gcloud": executable file not found in $PATH, out:
```

## How

```shell
gcloud components install docker-credential-gcr
```
