---
reviewdate: '2026-12-20'
title: Kubeconform google managed prometheus CRD's
---

## What

Kubeconform Export CRD from cluster

## How

```shell
export FILENAME_FORMAT='{kind}-{group}-{version}'
```

```shell
python3 ./scripts/openapi2jsonschema.py https://raw.githubusercontent.com/GoogleCloudPlatform/prometheus-engine/main/manifests/setup.yaml
```

```
helm template . | kubeconform -schema-location default -schema-location /Users/bradleystannard/github/kubeconform -schema-location default

kubectl get customresourcedefinitions.apiextensions.k8s.io/backendconfigs.cloud.google.com -o yaml
```

## Continued reading

* [Kubeconform](kubeconform.md)
