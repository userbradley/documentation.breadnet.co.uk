---
title: Using the downward API in Kubernetes
---

Kubernetes has something called the `Downward API` that allows pods to get information of their own running state
and then expose it as env variables (As the below example)

## What is exposed

See [Official Documentation](https://kubernetes.io/docs/concepts/workloads/pods/downward-api/#available-fields)
for more fields

| Name                            | Description                                                                                              |
|---------------------------------|----------------------------------------------------------------------------------------------------------|
 | `metadata.name`                 | the pod's name                                                                                           |
| `metadata.namespace`            | the pod's namespace                                                                                      |
| `metadata.uid`                  | the pod's unique ID                                                                                      |
| `metadata.annotations['<KEY>']` | the value of the pod's annotation named <KEY> <br/>(for example, `metadata.annotations['myannotation']`) |
| `metadata.labels['<KEY>']`      | the text value of the pod's label named <KEY> <br/>(for example, `metadata.labels['mylabel']`)           |
| `spec.serviceAccountName`       | the name of the pod's service account                                                                    |
| `spec.nodeName`                 | the name of the node where the Pod is executing                                                          |
| `status.hostIP`                 | the primary IP address of the node to which the Pod is assigned                                          |
| `status.podIP`                  | the pod's primary IP address (usually, its IPv4 address)                                                 |

## Example Manifest

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - image: nginx:latest
    name: downward-test
    command:
    - my-app --pod_id=$(POD_ID) --pod_name=$(POD_NAME) --namespace_name=$(NAMESPACE_NAME)
    env:
    - name: POD_ID
      valueFrom:
        fieldRef:
          fieldPath: metadata.uid
    - name: POD_NAME
      valueFrom:
        fieldRef:
          fieldPath: metadata.name
    - name: NAMESPACE_NAME
      valueFrom:
        fieldRef:
          fieldPath: metadata.namespace
```
