---
title: Not specifying namespace each time
---
# Kubectl set namespace

!!! note

        A better solution is to use something like [kubectx + kubens](https://github.com/ahmetb/kubectx)

## Why

When you're running several commands in the same namespace (That isnt default) it get's annoying having to always specify
the name space

## Solution

```shell
kubectl config set-context --current --namespace=<insert-namespace-name-here>
```