---
title: Generate a random Token
---

## Why

Sometimes you may want to make a random token for a secret

## How

```shell
head -c 12 /dev/urandom | shasum | cut -d ' ' -f1
```
