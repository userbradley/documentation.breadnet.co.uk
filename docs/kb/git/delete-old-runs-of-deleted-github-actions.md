---
title: Delete old runs of deleted GitHub Actions 
---

## Why

GitHub does not have a proper way to delete old GitHub Actions runs yet, so you have to get creative

See below community thread:

- [community/discussions/26256](https://github.com/orgs/community/discussions/26256)

## How

```shell
gh run list --workflow "<your workflow name>" --json databaseId --limit 1000 | jq -r '.[].databaseId' | while read -r line; do gh run delete $line; done
```