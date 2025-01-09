---
title: Sleeper pod
---

# Sleeper pod

## Why

Sometimes we need to run a pod on the cluster to exec in to and test things, like web requests etc

## How

=== "Default"

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

    ```yaml hl_lines="6"
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

=== "Environments from config map"

    ```yaml hl_lines="12-15"
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
          envFrom:
            - configMapRef:
                name: <config map name>

    ```

## Exec in to the pod

```shell
admin exec -it pod/sleeper /bin/sh
```

<!-- @todo:

Create a file that houses this, and you can curl it and use envsubst

-->
