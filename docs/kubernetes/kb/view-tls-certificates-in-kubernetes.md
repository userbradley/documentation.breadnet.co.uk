---
reviewdate: '2026-12-20'
title: View TLS certificates in Kubernetes
---

## Why

If you're using a service like Cert manager, you may want to check the certificate is as you'd expect

## How

Get TLS Secrets

```shell
kubectl get secrets --field-selector type=kubernetes.io/tls
```

Replace `<name>` with the secret name.

```shell
kubectl get secret/<name> -o json | jq -r '.data."tls.crt"' | base64 -d | openssl x509 -noout -text
```

## Additional Reading

<https://blog.kubovy.eu/2020/05/16/retrieve-tls-certificates-from-kubernetes/>
