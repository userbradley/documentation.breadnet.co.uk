---
title: Create random string
---

## What

Sometimes you need to create a random string. This is useful for times when you make documentation that includes secrets,
but don't want to include these secrets in the actual document, and don't want it to look silly

## How

=== "openssl"

    You can use the `openssl rand` command

    The command follows the below schema

    ```text
       * ---------------------- openSSL command
      |       * --------------- Random string command
      |       |     * --------- Type of random string
      |       |     |     * --  Number of characters
      |       |     |     |
    openssl rand -base64 12
    ```
    === "base64"

        ```shell
        openssl rand -base64 12
        ```

    === "hex"
        ```shell
        openssl rand -hex 12
        ```

=== "/dev/urandom"

    ```shell
    head -c 12 /dev/urandom | shasum | cut -d ' ' -f1
    ```

    Set a custom length, up to a maximum of 41 characters

    ```shell
     head -c 1 /dev/urandom | shasum | cut -d ' ' -f1 | cut -c -12
    ```
