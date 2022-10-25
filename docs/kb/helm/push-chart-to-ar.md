---
title: Push helm chart to Artifact Registry
---

# Push helm chart to Artifact Registry

## Pre-requisites 

You will need to have an Artifact registry repository created 

??? note "Create AR Repo"

    ```terraform
    resource "google_artifact_registry_repository" "helm-store" {
      repository_id = "helm-store"
      description   = "helm chart store"
      format        = "DOCKER"
      project       = var.project
      location      = var.region
      labels = {
        creator = "bstannard"
        use = "helm-chart-storage"
        user = "bstannard"
      }
    }
    ```

Update the `version` field in  `Chart.yaml`

=== "Before"

    ```yaml
    apiVersion: v2
    name: dummy-demo-chart
    description: A Helm chart for Kubernetes
    type: application
    version: 0.1.0
    appVersion: "1.16.0"
    ```

=== "After"

    ```yaml hl_lines="5"
    apiVersion: v2
    name: dummy-demo-chart
    description: A Helm chart for Kubernetes
    type: application
    version: 0.2.0
    appVersion: "1.16.0"
    ```

Once you have bumped the version, you can package it

## Packaging the chart

```shell
helm package <path to chart>
```

## Push the chart

```shell
helm push <chart name>-*.tgz oci://europe-west2-docker.pkg.dev/<your GCP project name>/helm-store/
```