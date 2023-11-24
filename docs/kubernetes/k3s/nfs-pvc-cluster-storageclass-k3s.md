---
title: Setting up k3s to use nfs as default storage class
---

## What's the problem

On k3s (and by extension any Kubernetes cluster **not** on a cloud provider that has their own storage class) maanging
storage persistence mainly boils down to using the `local-path` (note: Default on k3s)

When the pods are spanning multiple nodes, then this becomes an issue as the [Volume can only be mounted to a single pod on a single node](https://kubernetes.io/blog/2018/04/13/local-persistent-volumes-beta/#:~:text=note%20that%20local%20volumes%20are%20not%20suitable%20for%20most%20applications.%20Using%20local%20storage%20ties%20your%20application%20to%20that%20specific%20node%2C%20making%20your%20application%20harder%20to%20schedule.)

## What's the solution

* Install the [NFS CSI Driver](https://github.com/kubernetes-csi/csi-driver-nfs)
* Set it as the default Storage Class


!!! tip "You need to have an NFS server pre-existing"
    In order for this to work, you need to have a pre-existing NFS server.

    This is [out of scope](https://dslntlv9vhjr4.cloudfront.net/posts_images/ySlGfB8FeI8DU.jpg) for this KB


### Install the NFS CSI Driver

#### Add the Helm repo
```shell
helm repo add csi-driver-nfs https://raw.githubusercontent.com/kubernetes-csi/csi-driver-nfs/master/charts
```
#### Install the helm chart in the `kube-system` namespace

```shell
helm install csi-driver-nfs csi-driver-nfs/csi-driver-nfs --namespace kube-system --version v4.5.0
```

Wait about 5 minutes and then you can add the new `storageclass`

#### Add the new storage class

If you are using `nfs` with a password, see the official documentation

```yaml
# k3s-nfs-pvc.yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: nfs-csi
provisioner: nfs.csi.k8s.io
parameters:
  server: <ip address or dns name of nfs server>
  share: <path to nfs export>
reclaimPolicy: Delete
volumeBindingMode: Immediate
```

Apply this with `kubectl apply -f k3s-nfs-pvc.yaml`

??? tip "Example"

    ```yaml
    apiVersion: storage.k8s.io/v1
    kind: StorageClass
    metadata:
      name: nfs-csi
    provisioner: nfs.csi.k8s.io
    parameters:
      server: 172.16.2.4
      share: /data/nfs/k3s
    reclaimPolicy: Delete
    volumeBindingMode: Immediate
    ```

Check that the Storage Class is created

```shell
kubectl get storageclasses.storage.k8s.io
```

You should see an output similar to the below

```text
NAME                      PROVISIONER             RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
local-path(default)      rancher.io/local-path   Delete          WaitForFirstConsumer   false                  26d
nfs-csi                  nfs.csi.k8s.io          Delete          Immediate              false                  43h
```

### Set the `nfs-csi` as default

!!! note "This is optional"
    If for some reason (Not here to judge, what you do on your cluster is strictly between you and the control plane) you've
    come this far and still want to default to the default `local-path` then that's fine.

    You will just need to specify `spec.storageClassName: nfs-csi` to use the NFS storage

#### Configure `local-path` as non-default

```shell
kubectl patch storageclass local-path -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'
```

#### Configure `nfs-csi` as default

```shell
kubectl patch storageclass nfs-csi -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
```

## Testing

Now we need to test if this all worked.

Copy and paste the below in to a file called `pvc-test.yaml`

```yaml
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-deployment-nfs
spec:
  accessModes:
    - ReadWriteMany  # In this example, multiple Pods consume the same PVC.
  resources:
    requests:
      storage: 10Gi
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-nfs
spec:
  replicas: 1
  selector:
    matchLabels:
      name: deployment-nfs
  template:
    metadata:
      name: deployment-nfs
      labels:
        name: deployment-nfs
    spec:
      nodeSelector:
        "kubernetes.io/os": linux
      containers:
        - name: deployment-nfs
          image: nginx:latest
          volumeMounts:
            - name: nfs
              mountPath: "/mnt/nfs"
      volumes:
        - name: nfs
          persistentVolumeClaim:
            claimName: pvc-deployment-nfs
```

Apply the manifest with `kubectl apply -f <file-name>.yaml`

Then check if the deployment worked

```shell
kubectl get pvc
```

You should see one called `pvc-deployment-nfs` with the status `bound`

```text
NAME                 STATUS   VOLUME                                    CAPACITY   ACCESS MODES   STORAGECLASS   AGE
pvc-deployment-nfs   Bound    pvc-864e3e14-f384-4043-a7a9-a660af88e71d   10Gi        RWX            nfs-csi        1m
```


## Additional reading

* @kubernetes-csi/csi-driver-nfs
