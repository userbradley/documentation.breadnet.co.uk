---
reviewdate: '2026-12-20'
title: gcurl
---

## What

An alias setup to use gcloud authentication with curl to make requests to google endpoints

## How

=== "json"

    ```shell
    alias gcurl='curl -H "Authorization: Bearer $(gcloud auth print-access-token)" -H "Content-Type: application/json"'
    ```

=== "Normal"

    ```shell
    alias gcurl='curl -H "Authorization: Bearer $(gcloud auth print-access-token)"'
    ```
