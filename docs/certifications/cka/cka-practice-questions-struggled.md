## Taints and Tolerations

### Create another pod named bee with the nginx image, which has a toleration set to the taint mortein.

!!! error "Struggled"
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