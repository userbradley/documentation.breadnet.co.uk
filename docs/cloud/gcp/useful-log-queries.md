---
title: Useful log queries GCP
---

## What this document plans to achieve

List useful log queries in GCP

## Queries

| Query                                                                   | Explainer                                          |
|-------------------------------------------------------------------------|----------------------------------------------------|
| `protoPayload.methodName="google.iam.admin.v1.CreateServiceAccountKey"` | Get entries when a service account key was created |
| `protoPayload.methodName="google.iam.admin.v1.CreateServiceAccount"`    | Service account creation                           |
