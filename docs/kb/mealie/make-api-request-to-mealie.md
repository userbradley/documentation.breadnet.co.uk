---
reviewdate: '2026-12-20'
title: Make API request to Mealie
---

## What

Mealie is a self-hosted Meal planner tool. It's got an API that you can integrate with and do _things_

## How

You will need to make an API token in the UI.

Mealie has OpenAPI docs [available here](https://demo.mealie.io/docs)

```shell
curl -X 'GET' \
  'https://<mealie URL>/api/users/self' \
  -H 'accept: application/json' -H 'Authorization: bearer <auth token>
```
