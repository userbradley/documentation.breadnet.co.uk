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

This assumes it's not created with a deployment

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

=== "Broken"
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

=== "Fixed"

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

=== "Broken"
    
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

=== "Fixed"

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

## Deployments

Assume namespace is `default` unless told otherwise

### How many PODs exist on the system?

```shell
kubectl get pods
```

### How many ReplicaSets exist on the system?

```shell
kubectl get rs #(1)!
```

1. `rs` is a standing for replicaset, which we can get from `kubectl api-resources`

### How many Deployments exist on the system?

```shell
kubectl get deployments
```

### How many Deployments exist on the system now?

```shell
kubectl get deployments
```

### How many ReplicaSets exist on the system now?

```shell
kubectl get rs #(1)!
```

1. `rs` is a standing for replicaset, which we can get from `kubectl api-resources`

### How many PODs exist on the system now?

```shell
kubectl get pods
```

### Out of all the existing PODs, how many are ready?

```shell
kubectl get pods
```

```text
# Result from command
controlplane ~ ➜  k get po
NAME                                   READY   STATUS             RESTARTS   AGE
frontend-deployment-7fbf4f5cd9-bgwdl   0/1     ImagePullBackOff   0          82s
frontend-deployment-7fbf4f5cd9-hrn69   0/1     ImagePullBackOff   0          82s
frontend-deployment-7fbf4f5cd9-7z2ml   0/1     ImagePullBackOff   0          82s
frontend-deployment-7fbf4f5cd9-xdbxg   0/1     ImagePullBackOff   0          82s
```

A: None, 0

### What is the image used to create the pods in the new deployment?

```shell
kubectl get deployments
kubectl describe deployments/frontend-deployment
```

Locate `Pod Template.*.Image`

### Why do you think the deployment is not ready?

A: `ImagePullBackOff` - No image found with that name on the Public Docker Registry

### Create a new Deployment using the deployment-definition-1.yaml file located at /root/.

!!! tip "How to figure out the issue and save time"
    Best way to find out what the issue is, is to apply it and see what it comes back with.

```shell
kubectl apply -f 
```

We get the error back:

```text
Error from server (BadRequest): error when creating "deployment-definition-1.yaml": deployment in version "v1" cannot be handled as a Deployment: no kind "deployment" is registered for version "apps/v1" in scheme "k8s.io/apimachinery@v1.26.0-k3s1/pkg/runtime/scheme.go:100"
```

We can check that the `apiVersion` is correct with the below

```shell
kubectl api-resources
```

```text
# Response
➜ kubectl api-resources | grep deployments                                       
deployments                       deploy       apps/v1                                true         Deployment
```

We can tell it's correct, so it needs to be the `kind` requires an Uppercase. `kind` uses PascalCase (first letter of the word is capitalized)

=== "Broken"

    ```yaml
    ---
    apiVersion: apps/v1
    kind: deployment
    metadata:
      name: deployment-1
    spec:
      replicas: 2
      selector:
        matchLabels:
          name: busybox-pod
      template:
        metadata:
          labels:
            name: busybox-pod
        spec:
          containers:
          - name: busybox-container
            image: busybox888
            command:
            - sh
            - "-c"
            - echo Hello Kubernetes! && sleep 3600
    ```

=== "Fixed"

    ```yaml
    ---
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: deployment-1
    spec:
      replicas: 2
      selector:
        matchLabels:
          name: busybox-pod
      template:
        metadata:
          labels:
            name: busybox-pod
        spec:
          containers:
          - name: busybox-container
            image: busybox888
            command:
            - sh
            - "-c"
            - echo Hello Kubernetes! && sleep 3600
    ```

### Create a new Deployment with the below attributes using your own deployment definition file.

```shell
kubectl create deployment httpd-frontend --image="httpd:2.4-alpine" --replicas=3 --dry-run=client -o yaml > deployment.yaml
kubectl apply -f deployment.yaml
```

## Namespaces

### How many Namespaces exist on the system?

```shell
kubectl get ns
```

Count the namespaces

### How many pods exist in the research namespace?

```shell
kubectl get pods -n research
```

### Create a POD in the finance namespace.

```shell
kubectl run redis --image redis -n finance
```

### Which namespace has the blue pod in it?

```shell
kubectl get pods --all-namespaces --field-selector=metadata.name=blue
```

### What DNS name should the Blue application use to access the database db-service in its own namespace - marketing?

A: db-service

We know this because they are both in the same namespace, so we dont have to use cross namespace URL's

## Services

Assume namespace is `default` unless told otherwise

### How many Services exist on the system?

```shell
kubectl get service
```

### What is the type of the default kubernetes service?

```text
# Results
controlplane ~ ➜  kubectl get svc
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.43.0.1    <none>        443/TCP   2m10s
```

A: ClusterIP

### What is the targetPort configured on the kubernetes service?

```shell
kubectl edit svc/kubernetes
```

View `spec.ports.1.targetPort`

### How many labels are configured on the kubernetes service?

```shell
kubectl edit svc/kubernetes
```

View `metada.labels`

### How many Endpoints are attached on the kubernetes service?

A: 1

We know this because in the below yaml, there is one entry below `spec.ports.`

```yaml
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: "2023-01-14T17:42:24Z"
  labels:
    component: apiserver
    provider: kubernetes
  name: kubernetes
  namespace: default
  resourceVersion: "193"
  uid: 4570bc97-ad41-4080-931f-08a0fbb72e59
spec:
  clusterIP: 10.43.0.1
  clusterIPs:
  - 10.43.0.1
  internalTrafficPolicy: Cluster
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - name: https
    port: 443
    protocol: TCP
    targetPort: 6443
  sessionAffinity: None
  type: ClusterIP
status:
  loadBalancer: {}
```

### How many Deployments exist on the system now?

```shell
kubectl get deployments
```

### What is the image used to create the pods in the deployment?

```shell
kubectl describe deployment/simple-webapp-deployment
```

##  Imperative Commands

### Deploy a pod named nginx-pod using the nginx:alpine image

```shell
kubectl run nginx-pod --image=nginx:alpine
```

### Deploy a redis pod using the redis:alpine image with the labels set to tier=db.

Either use imperative commands to create the pod with the labels. Or else use imperative commands to generate the pod definition file, then add the labels before creating the pod using the file.

```shell
kubectl run redis --image redis:alpine -l="tier=db"
```

### Create a service redis-service to expose the redis application within the cluster on port 6379

```shell
kubectl create service clusterip redis-service --tcp=6379:6379
```

### Create a deployment named webapp using the image kodekloud/webapp-color with 3 replicas.

```shell
kubectl create deployment webapp --image=kodekloud/webapp-color --replicas=3
```

### Create a new pod called custom-nginx using the nginx image and expose it on container port 8080

```shell
kubectl run custom-nginx --image=nginx --port=8080
```

### Create a new namespace called dev-ns

```shell
kubectl create ns dev-ns
```

### Create a new deployment called redis-deploy in the dev-ns namespace with the redis image. It should have 2 replicas.

```shell
kubectl create deployment redis-deploy --image=redis --replicas=2 -n dev-ns
```

### Create a pod called httpd using the image httpd:alpine in the default namespace. Next, create a service of type ClusterIP by the same name (httpd). The target port for the service should be 80.

I went about this creating a pod and then a service, which is not correct.

The correct way would be to run the below

```shell
kubectl run httpd --image=httpd:alpine --port=80 --expose
```