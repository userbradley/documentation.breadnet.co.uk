---
reviewdate: '2026-12-20'
title: Get kubernetes secrets values
---

If you're working with a kubernetes secret, it's sometimes useful to know what exactly the secret looks like, or what it's
value is. Especially if you're having encoding issues

## Get the secret's keys

Secrets in Kubernetes are essentially objects with multiple key:value's

```shell
kubectl describe secret/<name>
```

Will result in something like

```shell
Data
====
CF_API_TOKEN:  40 bytes
```

## Get the secret values

If we want to get the value of `CF_API_TOKEN` and then decode it, as Kubernetes secrets are stored in `base64`, we would do the below

```shell
kubectl get secrets/<name> --template={{.data.CF_API_TOKEN}} | base64 -d
```
