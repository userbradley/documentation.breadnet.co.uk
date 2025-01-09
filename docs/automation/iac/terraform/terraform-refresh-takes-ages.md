---
title: Terraform refresh takes ages
---

## What

This can happen with both Terraform and Terragrunt, so this applies to al

The issue is when running a `terraform plan` the plan will sit at the below for ages

```text
...
google_folder.sandbox: Refreshing state... [id=folders/<>]
...
^CStopping operation...
```

This happens because terraform sucks at walking the graph

## Solution

Set the [`parallelism` flag to 20](https://developer.hashicorp.com/terraform/cli/commands/apply#parallelism-n) and disable a refresh

=== "Terraform"

    ```shell
    terraform plan -parallelism=20 -refresh=false
    ```

=== "Terragrunt"

    ```shell
    terragrunt plan -parallelism=20 -refresh=false
    ```
