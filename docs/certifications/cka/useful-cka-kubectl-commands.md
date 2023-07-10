---
title: Useful CKA Kubectl Commands
---

# Useful CKA Kubectl Commands

## What this page is

This page contains only commands that would be useful to known whilst doing the CKA because:

* Some are shortcuts to generating files
* Some speed up finding resources
* They are Quality of Life things

## Create a pod

```shell
kubectl run nginx --image nginx
```

## Create Pod manifest file

The below commands creates the manifest file, but instead of applying it, prints it to `stdout`
```shell
kubectl run nginx --image nginx --dry-run=client -o yaml
```

!!! info "Example"
    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      creationTimestamp: null
      labels:
        run: nginx
      name: nginx
    spec:
      containers:
      - image: nginx
        name: nginx
        resources: {}
      dnsPolicy: ClusterFirst
      restartPolicy: Always
    status: {}
    ```

## Create Deployment

```shell
kubectl create deployment --image nginx nginx --dry-run=client -o yaml
```

!!! info "Example"
    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      creationTimestamp: null
      labels:
        app: nginx
      name: nginx
    spec:
      replicas: 1
      selector:
        matchLabels:
          app: nginx
      strategy: {}
      template:
        metadata:
          creationTimestamp: null
          labels:
            app: nginx
        spec:
          containers:
          - image: nginx
            name: nginx
            resources: {}
    status: {}
    ```

## Get all resources in a namespace

```shell
kubectl get all
```

### get all resources in a namespace using a selector

```shell
kubectl get all --selector env=prod
```