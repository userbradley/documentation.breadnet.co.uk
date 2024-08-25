---
title: Terragrunt auto approve
---

## What

When running `terragrunt run-all apply` if you have dependencies, it will ask if you'd like to run them all.

## How

!!! warning "This could land up tearing things down"
    It will approve anything, which means it could land up nuking your stack.

    Use with caution

```shell
terragrunt {command} --terragrunt-non-interactive
```

This will _assume_ yes for all questions
