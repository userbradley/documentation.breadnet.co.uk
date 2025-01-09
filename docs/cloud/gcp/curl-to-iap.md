---
title: Curl to IAP
---

# Curl to IAP

You will need to have a service account already, and the ability to impersonate that account.

Your account will need to have the permission `Service Account Token Creator`

```bash
OAUTH_CLIENT_ID=<>
AUTHORIZED_SA=<>
URL=https://<>

ID_TOKEN=$(
   gcloud auth print-identity-token \
   --audiences  $OAUTH_CLIENT_ID \
   --include-email \
   --impersonate-service-account $AUTHORIZED_SA
)
```

```bash
curl --header "Authorization: Bearer $ID_TOKEN"  $URL
```
