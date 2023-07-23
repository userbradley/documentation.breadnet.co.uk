---
title: Not specifying namespace each time
---
# Kubectl set namespace

!!! note

        A better solution is to use something like [kubectx + kubens](https://github.com/ahmetb/kubectx)

## Why

When you're running several commands in the same namespace (That isn't default) it gets annoying having to always specify
the name space

## Solution

```shell
admin config set-context --current --namespace=<insert-namespace-name-here>
```