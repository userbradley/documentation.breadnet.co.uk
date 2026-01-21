---
reviewdate: '2026-12-20'
title: Get current folder
---

Sometimes, we need to get the current folder, for things like [Creating helm charts](../../kubernetes/helm/create-helm-chart.md) at work

## The problem

Usually we are able to do something like `pwd` but this returns the entire working directory

## Solution

Use `basename`

```shell
basename $(pwd)
```

??? Note "Outcome"

    ```shell
    documentation.breadnet.co.uk
    ```
