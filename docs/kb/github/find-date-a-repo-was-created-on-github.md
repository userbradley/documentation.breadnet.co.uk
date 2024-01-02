---
title: Find date a repo was created on GitHub
---

## What

When flexing on colleagues, or needing to work out when a repo was created, it's useful to know when a repo was created (duh)

## How

GitHub has a public API you can plug repo names in to and it will give you the created Date

The URl is

```text
https://api.github.com/repos/owner/repo-name
```

Locate the `created_at` field

### Shell

```shell
curl https://api.github.com/repos/owner/repo-name | jq '.created_at'
```
