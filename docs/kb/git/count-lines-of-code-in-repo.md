---
reviewdate: '2026-12-20'
title: Count lines of code in a Git repo
---

## Why?

To flex

## How?

```shell
git ls-files | xargs cat | wc -l
```
