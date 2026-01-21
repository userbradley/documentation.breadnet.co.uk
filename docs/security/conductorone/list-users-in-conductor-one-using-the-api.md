---
reviewdate: '2026-12-20'
title: List users in Conductor one using the API
---

## Why

To run some automation against them

## How

Replace `<companyname>` with your instance URL

```shell
curl --request GET \
  --url https://<companyname>.conductor.one/api/v1/users \
  --header 'Accept: application/json' \
  --header "Authorization: $(cone token -o json | jq ".access_token" | xargs)"
```
