---
title: Required plugins are not installed - Terragrunt
---

## What

Sometimes after running a `terragurnt run-all init` and `terragrunt run-all plan` then plan will fail with the below

```text
INFO[0007] ╷
│ Error: Required plugins are not installed
│
│ The installed provider plugins are not consistent with the packages
│ selected in the dependency lock file:
│   - registry.terraform.io/hashicorp/google: the cached package for registry.terraform.io/hashicorp/google 4.81.0 (in .terraform/providers) does not match any of the checksums recorded in the dependency lock file
│   - registry.terraform.io/hashicorp/google-beta: the cached package for registry.terraform.io/hashicorp/google-beta 4.81.0 (in .terraform/providers) does not match any of the checksums recorded in the dependency lock file
│
│ Terraform uses external plugins to integrate with a variety of different
│ infrastructure services. To download the plugins required for this
│ configuration, run:
│   terraform init
╵
```

## How to fix it

Do a recursive delete of all the `.terraform/` directories

* [Recursive delete of .terraform directory](../terraform/recursive-delete-of-terraform.md)
