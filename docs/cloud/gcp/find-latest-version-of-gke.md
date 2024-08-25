---
title: Find the latest version of GKE
---

## Why

When upgrading GKE through terraform, it's important to know the full GKE version string

## How

=== "Master"
    ```shell
    gcloud container get-server-config --zone=<zone> --format=json --project=<project> | jq -r '.validMasterVersions[0]'
    ```
=== "Nodes"

    ```shell
    gcloud container get-server-config --zone=<zone> --format=json --project=<project> | jq -r '.validNodeVersions[0]'
    ```
