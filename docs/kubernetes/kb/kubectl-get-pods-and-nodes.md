```shell
kubectl get pods -o=custom-columns="POD NAME:.metadata.name,NODE NAME:.spec.nodeName"
```