---
title: Set static IP address on service type Load balancer
---

## Why

If you're exposing a service like SFTP, you cant use `ingress` as this is for layer 7 connections

## How

Modify your service as below

```diff
apiVersion: v1
kind: Service
metadata:
  name: sftpgo
spec:
  type: LoadBalancer
  selector:
    run: sftpgo
  ports:
    - name: sftp
      port: 2022
      protocol: TCP
      targetPort: 2022
+ loadBalancerIP: 34.105.255.179
```

!!! tip
    Make sure you set this to the IP address you've reserved in GCP
