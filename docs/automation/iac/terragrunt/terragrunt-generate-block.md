---
reviewdate: '2026-12-20'
title: Terragrunt generate block
---

## Why

When creating repeatable DRY terraform, we will use a terragrunt `generate` block

## How

Terragrunt `generate` block has several features:

* Overwrite
* Skip

=== "Overwrite"

    ``` terraform
    generate "exmaple" {
      path      = "example.tf"
      if_exists = "overwrite"
      contents = <<EOF
    output "ip-address" {
      value = google_compute_global_address.example.address
    }
    EOF
    }
    ```

=== "Skip"

    The below will then skip re-creating the file if it exists already. This is useful for templating out repos.

    ``` terraform
    generate "exmaple" {
      path      = "example.tf"
      if_exists = "skip"
      contents = <<EOF
    output "ip-address" {
      value = google_compute_global_address.example.address
    }
    EOF
    }
    ```

## How to use it

You will then need to create a file called `terragrunt.hcl` in a new folder and paste in the below

```terraform
include "root" {
  path           = find_in_parent_folders()
  expose         = true
  merge_strategy = "deep"
}
```

Using the below structure, when we run `terragrunt run-all init` it will create the file `example.tf` in each directory

```markdown
.
├── dev
│   └── terragrunt.hcl
├── prd
│   └── terragrunt.hcl
├── terragrunt.hcl
└── test
    └── terragrunt.hcl

```
