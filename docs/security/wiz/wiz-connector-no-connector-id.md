---
title: Wiz Kubernetes Failed executing entrypoint CONNECTOR_ID is not set
---

## What

When deploying the Kubernetes connector to a cluster using Wiz security, your deployment may fail with the below error

```json
{"level":"fatal","time":"2026-01-19T14:10:14.047213534Z","msg":"Failed executing entrypoint","error":"CONNECTOR_ID is not set"}
```

## How to resolve

Check that your wiz connector secret actually contains a value

```shell
kubectl get secret/wiz-connector -o yaml
```

If you see an output like the below, then your secret is not populated

```yaml
apiVersion: v1
data:
  connectorData: e30=
kind: Secret
metadata:
  creationTimestamp: "2026-01-19T11:21:22Z"
  labels:
    app.kubernetes.io/instance: wiz
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: wiz-kubernetes-connector
    app.kubernetes.io/version: "3.0"
    helm.sh/chart: wiz-kubernetes-connector-4.0.3
  name: wiz-connector
  namespace: wiz
  resourceVersion: "1768821682186527019"
  uid: 46685ad8-7fd7-496b-ac98-e8a740156b55
type: Opaque
```

### Recreate the secret

Depending on how you're managing the resources, you may have to recreate the secret by pulling it from External Secrets again, or re-run your `kubectl` command to create the secret
