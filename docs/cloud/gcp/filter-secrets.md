---
reviewdate: '2026-12-20'
title: Filter secrets in GCP
---

## What

If you liable your secrets well, you can filter based off these.

A good example is the `system` key

## How

Say our `system` is `bradley`

```shell
gcloud secrets list --project=<> --filter="labels.system:bradley"
```
