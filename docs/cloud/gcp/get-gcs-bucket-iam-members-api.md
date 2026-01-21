---
reviewdate: '2026-12-20'
title: Get GCS Bucket IAM Members with the API
---

## Why

If you need a simple list of users and their permissions on a bucket, the UI can be annoying

## How

### Setup gcurl

[Read here on how to setup gcurl](gcurl.md)

If you're lazy...

```shell
alias gcurl='curl -H "Authorization: Bearer $(gcloud auth print-access-token)" -H "Content-Type: application/json"'
```

### Make the API call

Replace `bucket_name` with the name of your bucket

```shell
gcurl https://storage.googleapis.com/storage/v1/b/bucket_name/iam
```
