---
title: Count lines of code in a Git repo
---

# Count lines of code in a Git repo

## Why?

To flex

## How?

```shell
git ls-files | xargs cat | wc -l
```