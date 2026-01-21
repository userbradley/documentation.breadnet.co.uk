---
reviewdate: '2026-12-20'
title: Configure GKE workload Identity
---

!!! note "Not to be confused with Workload Identity Federation"
    These are different systems. They both allow external workloads to authenticate to Google Cloud Platform

## What

Workload Identity allows pods running in [GKE](https://cloud.google.com/kubernetes-engine/) clusters to _assume_ their own
service account and authenticate onwards to the platform

## How

!!! note "there are 2 methods to do this with"
    Google cloud have released a new way to _workload Identity_

    It's important to check that your applicatin will work. If yuo're making calls to Google cloud resources, cehck they're
    on [the supported list here](https://cloud.google.com/iam/docs/federated-identity-supported-services)


    Some things have remained the same. These are excluded from the tabbed sections

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

=== "New Method"

    The new method of Workload identity does not require a GCP service account.

    You now only need to grant your _member_ where it needs access.

    If we use the example of accessing a bucket from within the cluster

    === "gcloud CLI"



        ```shell
        gcloud storage buckets add-iam-policy-binding gs://BUCKET \
        --role=roles/storage.objectViewer \
        --member=principal://iam.googleapis.com/projects/PROJECT_NUMBER/locations/global/workloadIdentityPools/PROJECT_ID.svc.id.goog/subject/ns/NAMESPACE/sa/KSA_NAME \
        --condition=None
        ```

    === "Terraform"

        The below instructions assume you are using the default Kubernetes Service account name of `external-dns` in the namespace `external-dns`

        Create a file called `main.tf` and place in it the below. _Note: If you're an experienced terraform user feel free to split these out in to different files_

        ```hcl
        variable "gke-project" {
          type        = string
          description = "Name of the project that the GKE cluster exists in"
          default     = "GKE-PROJECT"
        }

        variable "ksa_name" {
          type        = string
          description = "Name of the Kubernetes service account that will be accessing the DNS Zones"
        }

        variable "kns_name" {
          type        = string
          description = "Name of the Kubernetes Namespace"
        }

        data "google_project" "project" {
          project_id = var.gke-project
        }

        locals {
          member = "principal://iam.googleapis.com/projects/${data.google_project.project.number}/locations/global/workloadIdentityPools/${var.gke-project}.svc.id.goog/subject/ns/${var.kns_name}/sa/${var.ksa_name}"
        }

          resource "google_storage_bucket_iam_member" "member" {
          bucket = google_storage_bucket.default.name
          role = "roles/storage.admin"
          member = local.member
          }
        ```

        Replace the following

        * `GKE-PROJECT` : Project that contains your GKE cluster
        * `variable "ksa_name"` : Name of the Kubernetes service account
        * `variable "kns_name"` : Name of the Kubernetes Name Space that will house the service account



    ### Creating a Kubernetes service account

    As mentioned, we need to connect the Google service account to the Kubernetes service account

    You will need to get the email address of the Service account you created in the [Service account](#creating-a-kubernetes-service-account) step

    ```yaml
    apiVersion: v1
    kind: ServiceAccount
    metadata:
      name: wid-example
      namespace: wid-example-ns
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

=== "Old method"

    There are several steps that are required to enable workload identity to work - Categorized as below:

    1. [Enable Workload Identity on the GKE cluster](#enable-workload-identity-on-the-gke-cluster)
    2. [Enable the required API's](#enable-the-required-apis)
    3. [Creating a service account and assigning it permissions](#creating-a-service-account-and-assigning-it-permissions)
    4. [Creating a Kubernetes service account]()




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
