---
reviewdate: '2026-12-20'
title: Get project name of GCS bucket
---

## Why

Sometimes when you are managing many [GCS buckets](https://cloud.google.com/storage) - You may lose the project they exist in.

If you aren't using a swanky naming convention like `<proj-name>-<name>` then this is for you.

## How

We are able to use the [GCS API](https://cloud.google.com/storage/docs/json_api) to get information about the bucket.

!!! note "Required permissions"
    As this is using the GCP API, you will have to at least have the below permissions/roles

    * `storage.buckets.get`
    * `storage.buckets.list`
    * View access on the project

=== "New method"

    ```shell
    BUCKET=<bucket name>
    gcloud projects describe $(curl -s -X GET -H "Authorization: Bearer $(gcloud auth print-access-token)" "https://storage.googleapis.com/storage/v1/b/$BUCKET" | jq -r .projectNumber) --format="value(name)"
    ```

    ### Example

    ```shell
    BUCKET=kubernetes-release
    gcloud projects describe $(curl -s -X GET -H "Authorization: Bearer $(gcloud auth print-access-token)" "https://storage.googleapis.com/storage/v1/b/$BUCKET" | jq -r .projectNumber) --format="value(name)"
    ```

=== "Old Method"

    ### Get project Number

    ```shell
    curl -X GET \
      -H "Authorization: Bearer $(gcloud auth print-access-token)" \
      "https://storage.googleapis.com/storage/v1/b/<>" | jq ."projectNumber"
    ```

    ### Convert number to project name

    ```shell
    gcloud projects describe <number> --format json | jq .name
    ```

    ## Example

    ```shell
    # Get the project number
    curl -X GET \
      -H "Authorization: Bearer $(gcloud auth print-access-token)" \
      "https://storage.googleapis.com/storage/v1/b/kubernetes-release" | jq ."projectNumber"
    ```

    ```shell
    # Get the project Name
    gcloud projects describe 255964991331 --format json | jq .name
    ```
