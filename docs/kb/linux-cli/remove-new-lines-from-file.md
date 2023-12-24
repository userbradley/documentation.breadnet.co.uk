---
title: Remove new lines from files
---

## Why

Sometimes, like when dealing with GCP service account keys you need to single line them, or you just want to be a terrible human
and write all code on a single line, you can use this

## How

```shell
cat <file> | tr -d '\n'
```
