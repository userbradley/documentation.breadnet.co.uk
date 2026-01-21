---
reviewdate: '2026-12-20'
title: Using GCS as a helm repo
---

We are able to use GCS (Google cloud storage) as a helm repo.

This is especially useful where we want to package charts to be used by people who do not
always have access to teh repo.

## Install plugin

We need to have the helm gcs plugin to use this

```shell
helm plugin install https://github.com/hayorov/helm-gcs.git
```

### Upgrading Plugin

```shell
helm plugin update gcs
```

## Init the bucket

!!! Note

    We only need to do this once when we create a new bucket.

```shell
helm gcs init gs://bysd-helmstore
```

## Add repo to Helm

```shell
helm repo add bysd-store gs://bysd-helmstore
```

## Push chart to repo

```shell
helm gcs push chart.tar.gz bysd-store
```

As a biproduct of this, it will update the `index.yaml` file for you

## Update the cache

```shell
helm repo update
```

## Remove chart

```shell
helm gcs rm chart repo-name
```

## Further Reading

[Github](https://github.com/hayorov/helm-gcs)
