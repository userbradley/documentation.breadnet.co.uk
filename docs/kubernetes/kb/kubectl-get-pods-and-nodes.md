---
reviewdate: '2026-12-20'
title: Kubectl get pod and node it's on
---

## What

Sometimes you just want to know what node a pod is on easily

## How

=== "Current namespace"
    ```shell
    kubectl get pods -o=custom-columns="POD NAME:.metadata.name,NODE NAME:.spec.nodeName"
    ```
=== "All Namespaces"
    ```shell
    kubectl get pods --all-namespaces -o=custom-columns="POD NAME:.metadata.name,NODE NAME:.spec.nodeName"
    ```
