---
title: Bulk delete from terraform state
---

# Bulk delete from terraform state

!!! warning "Version your state file"
    Ensure that you have at least 2 backups of your state file, or at minimum have Versioning enabled on GCS!
    This has the possibility of deleting things you didn't mean to... _ask me how I know_

## Why

When moving towards using terragrunt based approach, you will be migrating things to separate directories, and need
to remove alot of things from the original state.

## How


### View the entries in the state

=== "Terragrunt"

    ```shell
    terragrunt state list
    ```

=== "Terraform"

    ```shell
    terraform state list
    ```

### Create a grep string that targets what you want

In this case, we want to remove things with `test` in their name

=== "Terragrunt"

    ```shell
    terragrunt state list | grep "test"
    ```

=== "Terraform"

    ```shell
    terrafrom state list | grep "test"
    ```

??? note "Example"

    ```terraform
    google_folder.test
    google_folder_iam_member.test["roles/viewer"]
    google_project.test[0]
    google_project.test[1]
    google_project.test[2]
    google_project.test[3]
    google_storage_bucket.test[0]
    google_storage_bucket.test[1]
    google_storage_bucket.test[2]
    google_storage_bucket.test[3]
    ```

### Encapsulate everything in `''`

We need to do this as passing `google_folder_iam_member.test["roles/viewer"]` will have issues in BASH

=== "Terragrunt"

    ```shell
    terragrunt state list | grep "test" | sed "s/.*/'&'/"
    ```

=== "Terraform"

    ```shell
    terraform state list | grep "test" | sed "s/.*/'&'/"
    ```

### Delete from state

=== "Terragrunt"

    ```shell
    terragrunt state list | grep "test" | sed "s/.*/'&'/" | xargs terragrunt state rm
    ```
    
=== "Terraform"

    ```shell
    terraform state list | grep "test" | sed "s/.*/'&'/" | xargs terraform state rm
    ```



