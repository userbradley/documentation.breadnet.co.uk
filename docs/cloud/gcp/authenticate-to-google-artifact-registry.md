---
reviewdate: '2026-12-20'
title: Authenticate to google artifact registry
---

## What

Google cloud has an offering called [Google Artifact Registry](https://cloud.google.com/artifact-registry) (and the deprecated [container registry](https://cloud.google.com/container-registry/docs/))

When pulling images, you need to set up authentication

## How

=== "Default"

    ```shell
    gcloud auth configure-docker
    ```

=== "Europe west 2"

    ```shell
    gcloud auth configure-docker europe-west2-docker.pkg.dev
    ```

## Possible Errors

* [`'err: exec: "docker-credential-gcloud": executable file not found in $PATH'`](err-exec-docker-credential-gcloud-executable-file-not-found-in-path.md)
