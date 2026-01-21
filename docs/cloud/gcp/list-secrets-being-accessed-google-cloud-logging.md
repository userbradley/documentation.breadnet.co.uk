---
reviewdate: '2026-12-20'
title: List secrets being accessed Google cloud logs
---

## Why

You may want to see what secrets are being accessed in a project, or by who/ what service acocunt

## How

```shell
protoPayload.methodName="google.cloud.secretmanager.v1.SecretManagerService.AccessSecretVersion"
```
