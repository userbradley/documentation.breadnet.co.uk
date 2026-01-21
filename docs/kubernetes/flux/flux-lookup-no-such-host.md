---
reviewdate: '2026-12-20'
title: Flux Lookup no such host
---

## What

```text
{"level":"error","ts":"2023-10-28T17:17:09.299Z","msg":"unable to record event","name":"flux-system","namespace":"flux-system","reconciler kind":"GitRepository","error":"POST http://notification-controller.flux-system.svc.cluster.local./ giving up after 5 attempt(s): Post \"http://notification-controller.flux-system.svc.cluster.local./\": dial tcp: lookup notification-controller.flux-system.svc.cluster.local. on 10.43.0.10:53: no such host"}
```

## How to fix

You are most likely getting this error because your Kubernetes cluster is not using `cluster.local` as the Cluster domain

#### How to find Cluster Domain

=== "K3S"

    View the config map for CoreDNS

    ```shell
    kubectl get cm/coredns -o yaml
    ```

    In there you will find the below

    ```yaml hl_lines="8"
    apiVersion: v1
    data:
      Corefile: |
        .:53 {
            errors
            health
            ready
            kubernetes cluster.bread in-addr.arpa ip6.arpa {
              pods insecure
              fallthrough in-addr.arpa ip6.arpa
            }

    ```

=== "GKE"

    ```shell
    kubectl get deployment/kube-dns -o yaml
    ```

    And locate the below part like this


    ```yaml hl_lines="3"
          containers:
          - args:
            - --domain=cluster.local.
            - --dns-port=10053
            - --config-dir=/kube-dns-config
            - --v=2

    ```

### Bootstrap Flux

Now when you run the bootstrap command, add the `--cluster-domain` field

```diff
flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=fleet-infra \
  --branch=main \
  --path=./clusters/my-cluster \
+  --cluster-domain cluster.bread \
  --personal
```
