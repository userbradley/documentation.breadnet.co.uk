---
title: CKA Practice questions struggled
---

## Taints and Tolerations

### Create another pod named bee with the nginx image, which has a toleration set to the taint mortein

!!! warning "Struggled"
This is a question I struggled on

```shell
kubectl run bee --image=nginx --dry-run=client -o yaml > bee.yaml
```

Edit the file and add the below

```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: bee
  name: bee
spec:
  containers:
  - image: nginx
    name: bee
    resources: {}
  tolerations:
  - key: "spray"
    operator: "Equal"
    value: "mortein"
    effect: "NoSchedule"
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```

### Which nodes can the pods for the blue deployment be placed on?

!!! warning "Struggled"
This is a question I struggled on

```shell
kubectl describe nodes/controlplane | grep -i taints
```

I made the assumption that we can simply look at the roles of the nodes

Check if `controlplane` and `node01` have any taints on them that will prevent the pods to be scheduled on them. If there are no taints, the pods can be scheduled on either node.
So run the following command to check the taints on both nodes.

``` shell
kubectl describe node controlplane | grep -i taints
kubectl describe node node01 | grep -i taints
```
