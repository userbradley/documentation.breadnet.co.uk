---
title: Authenticate flux with Google Artifact Registry
---

## What is the issue

Whilst in the process of adopting Flux, we needed to connect it to our _Helm Store_ (Name I've given to the Artifact Registry)
that holds all the helm charts

Flux does not support auto login for OCI HelmRepository ([See this issue here](https://github.com/fluxcd/source-controller/issues/798#issuecomment-1167816216))

## Solution

The solution is to run a Kubernetes CronJob on the 35'th minute of each hour, then on the HelmSource add the secret name

Something that is not in this guide is to give the `source-controller` KSA Token creator ([See here for Workload Identity](../gke/configure-gke-workload-identity.md))

### Cron Job

```yaml
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: source-controller
  namespace: flux-system
rules:
- apiGroups: [""]
  resources:
  - secrets
  verbs:
  - get
  - create
  - patch
---
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: source-controller
  namespace: flux-system
subjects:
- kind: ServiceAccount
  name: source-controller
roleRef:
  kind: Role
  name: source-controller
  apiGroup: ""
---
apiVersion: batch/v1
kind: CronJob
metadata:
  name: artifact-registry-credentials-sync
  namespace: flux-system
spec:
  suspend: false
  schedule: "*/35 * * * *"
  failedJobsHistoryLimit: 1
  successfulJobsHistoryLimit: 1
  jobTemplate:
    spec:
      template:
        spec:
          serviceAccountName: source-controller
          restartPolicy: Never
          containers:
          - image: google/cloud-sdk:latest
            name: create-secret
            imagePullPolicy: IfNotPresent
            env:
            - name: SECRET_NAME
              value: artifact-registry-credentials
            - name: GCR_REGISTRY
              value: https://europe-west2-docker.pkg.dev
            command:
            - /bin/bash
            - -ce
            - |-
              kubectl create secret docker-registry $SECRET_NAME \
                --dry-run=client \
                --docker-server="$GCR_REGISTRY" \
                --docker-username=oauth2accesstoken \
                --docker-password="$(gcloud auth print-access-token)" \
                -o yaml | kubectl apply -f -
```

### Configure the HelmRepository

```diff
apiVersion: source.toolkit.fluxcd.io/v1beta2
kind: HelmRepository
metadata:
  name: example
  namespace: flux-system
spec:
  interval: 1m
  timeout: 120s
  type: oci
  url: oci://europe-west2-docker.pkg.dev/sb-devops-ieozhc/test
+  secretRef:
+    name: artifact-registry-credentials
```

This should then allow the Flux `HelmRepository` to access Google Cloud Artifact Registry.

---

Source: [fluxcd:source-controller:798](https://github.com/fluxcd/source-controller/issues/798)
