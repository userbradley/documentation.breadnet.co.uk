---
reviewdate: '2026-12-20'
title: Curl to GCR/ AR
---

## What

This page is to help you curl to Google Hosted container registries

## How

=== "Artifact Registry"

    ```shell
    curl \
      -H "Authorization: Bearer $(gcloud auth print-access-token)" \
      "https://europe-west2-docker.pkg.dev/v2/<project name>/<repo name>/<container name>/tags/list" | jq ".tags"
    ```

=== "GCR"

    ```shell
    curl \
      -H "Authorization: Bearer $(gcloud auth print-access-token)" \
      "https://eu.gcr.io/v2/<project name>/<repo name>/tags/list" | jq ".tags"
    ```

## What to read next

* [Curl to IAP](curl-to-iap.md)
* [ArgoCD Image updater](../../kubernetes/kb/using-argocd-image-updater-with-google-artifact-registry.md)

## Resources

* [Container Registry Docker API](https://cloud.google.com/container-registry/docs/reference/docker-api)
* [Artifact Registry Docker API](https://cloud.google.com/artifact-registry/docs/reference/docker-api)
