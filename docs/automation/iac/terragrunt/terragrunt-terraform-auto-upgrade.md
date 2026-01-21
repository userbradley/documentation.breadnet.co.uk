---
reviewdate: '2026-12-20'
title: Terragrunt terraform auto -upgrade
---

## Why

Depending on how you've structured your repo, you may have a central provider file that updates often

Each time you run `terragrun run-all init` you are **bombarded** with errors

## Solution

Add the below to your base `terragrunt.hcl` file

```hcl
terraform {
  extra_arguments "upgrade" {
    commands  = ["init"]
    arguments = ["-upgrade"]
  }
}
```
