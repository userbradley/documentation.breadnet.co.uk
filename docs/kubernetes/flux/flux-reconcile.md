---
title: Flux reconcile
---

## What

When working with flux, sometimes you're impatient, so you'll want to force a reconcile

## How

### Helm Release

#### Get Helm releases

```shell
flux get helmreleases --all-namespaces
```

### Reconcile Helm Releases

```shell
flux reconcile helmrelease <release> -n <namespace>
```

### Kustomization

#### Get Kustomizations

```shell
flux get kustomizations --all-namespaces
```

#### Reconcile Kustomizations

```shell
flux reconcile kustomization deployment-adr-site
```

### Source

#### Get Git Sources

```shell
flux get sources git --all-namespaces
```

#### Reconcile Git Sources

```shell
flux reconcile source git flux-system
```
