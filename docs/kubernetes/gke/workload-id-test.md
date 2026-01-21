---
reviewdate: '2026-12-20'
title: Workload Identity test pod
---

## Why

Sometimes you need to run a simple pod on the cluster to check things, call a service or run commands

## Things to note

You will need to have the `compute metadata api` service running in the cluster

## How

=== "KSA"

    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      name: workload-identity-test
    spec:
      containers:
        - image: google/cloud-sdk:slim
          name: workload-identity-test
          command: ["sleep","infinity"]
      serviceAccountName: <>
    ```

=== "GKE Workload nodes"

    !!! Note
        Sometimes your may have nodes in a pool that don't have the metadata server enabled.

    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      name: workload-identity-test
    spec:
      containers:
        - image: google/cloud-sdk:slim
          name: workload-identity-test
          command: ["sleep","infinity"]
      serviceAccountName: <>
      nodeSelector:
        iam.gke.io/gke-metadata-server-enabled: "true"
    ```

## What to read next

* [Get project using compute engine API](../../cloud/gcp/metadata-api/get-project-id-using-metadata-endpoint.md)
* [Get GCP Service account using compute engine API](../../cloud/gcp/metadata-api/get-service-account-using-metadata-endpoint.md)
