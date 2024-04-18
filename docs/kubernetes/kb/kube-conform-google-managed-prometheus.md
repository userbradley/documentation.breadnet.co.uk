---
title: Kubeconform google managed prometheus CRD's
---

export FILENAME_FORMAT='{kind}-{group}-{version}'

➜ python3 ./scripts/openapi2jsonschema.py https://raw.githubusercontent.com/GoogleCloudPlatform/prometheus-engine/main/manifests/setup.yaml

helm template . | kubeconform -schema-location default -schema-location /Users/bradleystannard/github/kubeconform -schema-location default

kubectl get customresourcedefinitions.apiextensions.k8s.io/backendconfigs.cloud.google.com -o yaml
