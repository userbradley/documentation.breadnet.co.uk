---
title: Create and push tags on Git
reviewdate: '2024-01-01'
---

## Why

With terraform modules we often pin them to specific versions, and the same thing can be done with releases.

## How

### Checkout the branch you want

In this case, we will be using `main`

```shell
git checkout main
git pull
```

### Create the tag

This creates the tag `4.0.0` using the branch `main`

```shell
git tag 4.0.0 main
```

### Push the tag

```shell
git push origin 4.0.0
```
