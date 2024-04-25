---
title: Kubeconform
---

## What

Kubeconform is a tool to validate Kubernetes files against their open API specification

## How

```shell
kubeconform -schema-location default -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' -verbose -output pretty
```
