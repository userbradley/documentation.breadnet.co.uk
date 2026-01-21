---
reviewdate: '2026-12-20'
title: Terraform Verbose
---

## What

Terraform has an option that you can set that will log **everything**

## Why

Sometimes google provider does _weird_ things, so it's useful to debug things

## How

=== "TRACE"

    ```shell
    export TF_LOG=TRACE
    ```

=== "DEBUG"

    ```shell
    export TF_LOG=DEBUG
    ```

=== "INFO"

    ```shell
    export TF_LOG=INFO
    ```

=== "WARN"

    ```shell
    export TF_LOG=WARN
    ```

=== "ERROR"

    ```shell
    export TF_LOG=ERROR
    ```
