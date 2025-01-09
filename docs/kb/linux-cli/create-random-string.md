---
title: Create random string
---

## What

Sometimes you need to create a random string. This is useful for times when you make documentation that includes secrets,
but don't want to include these secrets in the actual document, and don't want it to look silly

## How

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

### Base64

```shell
openssl rand -base64 12
```

### hex

```shell
openssl rand -hex 12
```
