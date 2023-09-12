---
title: KSA with GCP SA
---

# Kubernetes Service account with Workload ID

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: bradley
  annotations:
    iam.gke.io/gcp-service-account: <gservice account email>
```

You will need to grant the GCP SA the below roles

```shell
PROJECT_ID.svc.id.goog[NAMESPACE/KSA]
```

As well as:

```shell
roles/iam.workloadIdentityUser
```

These need to be granted to the GCP SA in GCP

See [Workload Identity](configure-gke-workload-identity.md)
