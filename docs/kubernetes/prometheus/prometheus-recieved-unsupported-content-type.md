---
title: received unsupported Content-Type text/html; charset=utf-8
---

## What

This happens when an exporter does not set the right response content type to `json` and instead just serves
the page as HTML.

This is most notable seen when using [intex/xpumanager](https://github.com/intel/xpumanager/blob/master/deployment/kubernetes/daemonset/base/daemonset-intel-xpum.yaml)

You will see an error such as the below in Prometheus

```text
received unsupported Content-Type "text/html; charset=utf-8"
```

## Solution

We need to set the `fallback_scrape_protocol` to `PrometheusText1.0.0`

The documentation details it as

```shell
# Fallback protocol to use if a scrape returns blank, unparsable, or otherwise
# invalid Content-Type.
# Supported values (case sensitive): PrometheusProto, OpenMetricsText0.0.1,
# OpenMetricsText1.0.0, PrometheusText0.0.4, PrometheusText1.0.0.
[ fallback_scrape_protocol: <string> ]
```

### `monitoring.coreos.com/v1`

``` diff
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: intel-xpumanager
  labels:
    app: intel-xpumanager
spec:
+ fallbackScrapeProtocol: PrometheusText1.0.0
  selector:
    matchLabels:
      app: intel-xpumanager
  endpoints:
    - port: metrics
      path: /metrics
      interval: 5s
```

## Additional Reading

* [Fallback scrape config](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#:~:text=fallback_scrape_protocol)
* [CRD definition](https://doc.crds.dev/github.com/prometheus-operator/prometheus-operator/monitoring.coreos.com/ServiceMonitor/v1@v0.86.1#spec-fallbackScrapeProtocol)
