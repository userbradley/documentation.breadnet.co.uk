---
title: CKA Practice tests
---

# CKA Practice tests

[KodeCloud Tests](https://kodekloud.com/courses/labs-certified-kubernetes-administrator-with-practice-tests/)

## Pods

### How many pods Exist on the cluster in the current namespace (default)

```shell
kubectl get pods 
```

### Create a new pod with the nginx image.

```shell
kubectl run nginx --image nginx
```

### What images are the pods created with

This assuemes it's not created with a deployment

```shell
kubectl describe pods/<>
```

### What nodes are the pods placed on

```shell
kubectl get pods -o wide
```

Then look at `NODE`

### How many containers are part of the pod webapp?

```shell
kubectl describe pods/<>
```

### What images are used in the new webapp pod?

```shell
kubectl describe pods/<>
```

Then look at the `Containers.*.Image`

### What is the state of the container agentx in the pod webapp?

```shell
kubectl get pods
```

Container was in `ImagePullBackOff` but the answer was `error`

### Why do you think the container agentx in pod webapp is in error?

There was no image found on Docker hub, hence `ImagePullBackOff`

### What does the READY column in the output of the kubectl get pods command indicate?

Running containers in pod/ total number of containers in pod

### Delete the webapp Pod.

```shell
kubectl delete pod/webapp
```

### Create a new pod with the name redis and with the image redis123.

```shell
kubectl run redis --image=redis123 --dry-run=client -o yaml > redis.yaml
kubectl apply -f redis.yaml
```

### Now change the image on this pod to redis.


```shell
kubectl run redis --image=redis --dry-run=client -o yaml > redis.yaml
kubectl apply -f redis.yaml
```

## Replica Sets

Assume namespace is `default` unless told otherwise

### How many PODs exist on the system?

```shell
kubectl get pods
```

### How many ReplicaSets exist on the system?

```shell
kubectl get replicasets
```

### How about now? How many ReplicaSets do you see?

```shell
kubectl get replicasets
```

```text
controlplane ~ ➜  kubectl get replicasets
NAME              DESIRED   CURRENT   READY   AGE
new-replica-set   4         4         0       6s
```

Answer: 1

### How many PODs are DESIRED in the new-replica-set?

```text
NAME              DESIRED   CURRENT   READY   AGE
new-replica-set   4         4         0       6s
```

```shell
kubectl get replicasets
```

Then view the number under `DESIRED`

### What is the image used to create the pods in the `new-replica-set`?

```shell
kubectl describe replicaset/new-replica-set
```

View `Pod Template. Image`

### How many PODs are READY in the new-replica-set?

```shell
kubectl get replicasets
```

```text
NAME              DESIRED   CURRENT   READY   AGE
new-replica-set   4         4         0       2m44s
```

View `READY`

### Why do you think the PODs are not ready?

The image doesnt exist

### Delete any one of the 4 PODs.

```shell
kubectl get pods
kubectl delete pod/new-replica-set-gxbxt
```

### How many PODs exist now?

```shell
kubectl get pods
```

a: 4

Because it recreated the pod we deleted

### Why are there still 4 PODs, even after you deleted one?

ReplicaSet ensures that the desired number of PODs always run

### Create a ReplicaSet using the replicaset-definition-1.yaml file located at /root/.

=== Broken
    ```yaml
    apiVersion: v1
    kind: ReplicaSet
    metadata:
      name: replicaset-1
    spec:
      replicas: 2
      selector:
        matchLabels:
          tier: frontend
      template:
        metadata:
          labels:
            tier: frontend
        spec:
          containers:
            - name: nginx
              image: nginx
    ```

=== Fixed

    ```yaml
    apiVersion: apps/v1
    kind: ReplicaSet
    metadata:
      name: replicaset-1
    spec:
      replicas: 2
      selector:
        matchLabels:
          tier: frontend
      template:
        metadata:
          labels:
            tier: frontend
        spec:
          containers:
            - name: nginx
              image: nginx
    ```

### Fix the issue in the replicaset-definition-2.yaml file and create a ReplicaSet using it.

=== Broken

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: replicaset-2
spec:
  replicas: 2
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
```

=== Fixed


```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: replicaset-2
spec:
  replicas: 2
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: nginx
        image: nginx
```

### Delete the two newly created ReplicaSets - replicaset-1 and replicaset-2

```shell
kubectl delete -f replicaset-definition-1.yaml
kubectl delete -f replicaset-definition-2.yaml
```

### Fix the original replica set new-replica-set to use the correct busybox image.

```
unset KUBE_EDITOR
export KUBE_EDITOR=nano
kubectl edit replicasets/new-replica-set
# Edit image
kubectl delete pods/<names of pods>
```

### Scale the ReplicaSet to 5 PODs.

> Use kubectl scale command or edit the replicaset using kubectl edit replicaset.

```shell
kubectl get rs
kubectl scale rs/new-replica-set --replicas=5
```

### Now scale the ReplicaSet down to 2 PODs.

```shell
kubectl get rs
kubectl scale rs/new-replica-set --replicas=2
```