---
title: Curl to URl with google auth
---

## Why

Some services like Cloud Functions and Cloud Run expose a URL that you need authentication to make a reques to

## How

Requires you to have the below installed

* curl
* gcloud cli

```shell
curl -H \
"Authorization: Bearer $(gcloud auth print-identity-token)" \
https://<url>>
```
