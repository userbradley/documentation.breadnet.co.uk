---
reviewdate: '2026-12-20'
title: Recursive delete of .terraform.lock.hcl
---

## What

When working with Atlantis, or terraform in git, sometimes a `.terraform.lock.hcl` gets in and breaks things

## How

```shell
find ./ -type f -name ".terraform.lock.hcl" -exec rm {} +
```

## Read next

* [Recursive delete of `.terragrunt-cache` directory](../terragrunt/recursive-delete-of-terragrunt-cache.md)
* [Recursive delete of `.terraform` directory](recursive-delete-of-terraform.md)
