---
title: Useful log queries GCP
---

## What this document plans to achieve

List useful log queries in GCP

## Queries

### Service accounts

| Query                                                                   | Explainer                                          |
|-------------------------------------------------------------------------|----------------------------------------------------|
| `protoPayload.methodName="google.iam.admin.v1.CreateServiceAccountKey"` | Get entries when a service account key was created |
| `protoPayload.methodName="google.iam.admin.v1.CreateServiceAccount"`    | Service account creation                           |

### IP Address

| Query                                                   | Explainer                                           |
|---------------------------------------------------------|-----------------------------------------------------|
| `protoPayload.requestMetadata.callerIp="203.0.113.3"`   | Any and all events associated with the IP address   |

### IAM

| Query                                      | Explainer               |
|--------------------------------------------|-------------------------|
| `protoPayload.methodName = "setIamPolicy"` | List IAM policy updates |
