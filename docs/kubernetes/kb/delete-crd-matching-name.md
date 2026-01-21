---
reviewdate: '2026-12-20'
title: Delete CRDs matching name
---

## Why

Sometimes an addon that adds CRD's doesn't uninstall them all

## How

=== "Specify Name"

    ```shell
    MATCH_STRING="crossplane.io"
    kubectl get crds -oname | grep "$MATCH_STRING" | xargs kubectl delete
    ```

=== "Crossplane"

    ```shell
    kubectl get crds -oname | grep "crossplane.io" | xargs kubectl delete
    ```
