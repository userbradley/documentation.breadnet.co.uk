---
title: Configure GKE workload Identity
---

!!! note "Not to be confused with Workload Identity Federation"
    These are different systems. They both allow external workloads to authenticate to Google Cloud Platform
## What

Workload Identity allows pods running in [GKE](https://cloud.google.com/kubernetes-engine/) clusters to _assume_ their own
service account and authenticate onwards to the platform

## How

There are several steps that are required to enable workload identity to work - Categorized as below:

1. [Enable Workload Identity on the GKE cluster](#enable-workload-identity-on-the-gke-cluster)
2. [Enable the required API's](#enable-the-required-apis)
3. [Creating a service account and assigning it permissions](#creating-a-service-account-and-assigning-it-permissions)
4. [Creating a Kubernetes service account]()


### Enable workload Identity on the GKE cluster

In your config for GKE, ensure the below are configured.



```terraform

variable "project" {
  type        = string
  description = "Name of the project the GKE cluster exists in"
  default     = "workload-id-cluster-example"
}

resource "google_container_cluster" "primary" {
  name                        = "workload-id-cluster"
  project                     = var.project


  node_config {

    metadata = {
      disable-legacy-endpoints = true
    }

    workload_metadata_config {
      mode = "GKE_METADATA" # (1)!
    }
  }

  workload_identity_config {
    workload_pool = "${var.project}.svc.id.goog" # (2)!
  }
}
```

1. The way GKE and GCP deals with platform authentication is by making a call to the metadata API (`http://169.254.169.254/computeMetadata/v1/`) - By running the
metadata API **in the cluster**, we essentially hijack the request. This enables running the metadata API internally to the cluster
2. Workload identity requires a pool. The format of this pool ID is `<project-id>.svc.id.goog` - We substitute the project ID here from a variable

### Enable the required API's

In order to actually make use of Workload Identity, you need the below API's enabled in your project

* `iam.googleapis.com`
* `iamcredentials.googleapis.com`

### Creating a service account and assigning it permissions

Below creates 3 resources

#### Service Account

A service account is created that the pod will then use. This pod service account will have access to anything else you
grant it IAM access to

#### google_project_iam_member.gcp-wid-user

This allows the service account to be used by the GKE cluster as a workload identity user.

#### google_project_iam_member.gke-wid-user

This allows the Service account to be _bound_ to a Kubernetes service account

```terraform
resource "google_service_account" "example" {
  project     = "workload-id-cluster-example"
  account_id  = "wid-example"
  description = "Example account for Workload Identity"
}

resource "google_project_iam_member" "gcp-wid-user" {
  project  = "workload-id-cluster-example"
  role     = "roles/iam.workloadIdentityUser"
  member   = "serviceAccount:${google_service_account.example.email}"
}

resource "google_project_iam_member" "gke-wid-user" {
  project = "workload-id-cluster-example"
  role    = "roles/iam.workloadIdentityUser"
  member  = "serviceAccount:${var.project}.svc.id.goog[wid-example-ns/wid-example]" #(1)!
}
```

1. This is in the format of

    ```
    [<kubernetes Namespace>/<Kubernetes Service account name>
    ```

    For more details see [How to use Workload Identity](https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity)

### Creating a Kubernetes service account

As mentioned, we need to connect the Google service account to the Kubernetes service account

You will need to get the email address of the Service account you created in the [Service account](#creating-a-kubernetes-service-account) step

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: wid-example
  namespace: wid-example-ns
  annotations:
    iam.gke.io/gcp-service-account: wid-example@workload-id-cluster-example.gserviceaccount.com
```

### Consume the service account in pods

There are many locations in GKE where a Service Account can be used, below are the most common

#### Pod

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: wid-example
  namespace: wid-example-ns
spec:
  serviceAccountName: wid-example
  containers:
    - name: alpine
      image: alpine:latest
      command: [ "/bin/sh", "-c", "--" ]
      args: [ "while true; do sleep 30; done;" ]
```

#### Deployment

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: wid-example
  namespace: wid-example-ns
spec:
  replicas: 1
  selector:
    matchLabels:
      app: wid-example
  template:
    spec:
      serviceAccountName: wid-example
      containers:
        - image: nginx:latest
          name: nginx
```
## Troubleshooting

### Gaia id not found

```text
Unable to generate access token; IAM returned 404 Not Found: Not found; Gaia id not found for email wid-example@workload-id-cluster-example.gserviceaccount.com
```

You've probably got the email address wrong of the service account, double check it.

Try and run the below command to see if you can get a token

```shell
curl -H "Metadata-Flavor: Google" http://169.254.169.254/computeMetadata/v1/instance/service-accounts/default/token
```
