---
title: Sleeper pod
---

## Why

Sometimes we need to run a pod on the cluster to exec in to and test things, like web requests etc

## How

=== "No Service account"

    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      name: sleeper
    spec:
      containers:
        - name: alpine
          image: alpine:latest
          # Just spin & wait forever
          command: [ "/bin/sh", "-c", "--" ]
          args: [ "while true; do sleep 30; done;" ]
    ```

=== "Service account"

    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      name: sleeper
    spec:
      serviceAccountName: <>
      containers:
        - name: alpine
          image: alpine:latest
          # Just spin & wait forever
          command: [ "/bin/sh", "-c", "--" ]
          args: [ "while true; do sleep 30; done;" ]
    ```

## Exec in to the pod

```shell
kubectl exec -it pod/sleeper /bin/sh
```