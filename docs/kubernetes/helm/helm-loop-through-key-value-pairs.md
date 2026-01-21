---
reviewdate: '2026-12-20'
title: "Helm loop through key:value pairs"
---

## What

In helm, sometimes you want to creat resources off a key value list.

A good example would be a service load balancer in GKE, it can have a firewall automatically created

[See here to read more about that](../gke/configure-firewall-for-service-type-loadbalancer-in-gke.md)

## How

In your `values.yaml` file

```yaml
config:
  list:
    bradley: "is cool"
```

Then your resource would use:

```yaml
{{- range $k,$v := .Values.config.list}}
        - secretKey: {{$v}}
          remoteRef:
            key: {{$k}}
        {{- end }}
```

## Overview

To go through the list, you use `{{$k}}` for the key, and `{{$v}}` for the value
