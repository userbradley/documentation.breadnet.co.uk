---
title: Configure firewall for service type LoadBalancer in GKE
---

## Why

If you're exposing a service like SFTP, you cant use `ingress` as this is for layer 7 connections.

You also probably don't want any IP address to access the service

## How

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
+ loadBalancerSourceRanges:
+   - 2.24.11.68/32

```
