---
title: Authenticate Podman to Google Artifact Registry
---

## What

Podman, like docker, stores it's Images in remote registers. One of the _many many_ options to chose from is [Google Artifact Registry](https://cloud.google.com/artifact-registry/docs)

## How

=== "Set your own"

    To get all the possible regions, use the `gcloud artifacts locations list` command

    ```shell
    export region=<>
    gcloud auth configure-docker $region-docker.pkg.dev
    ```

=== "europe-west2"

    ```shell
    gcloud auth configure-docker europe-west2-docker.pkg.dev
    ```

Then copy the file to your Podman config file

!!! warning "This will overwrite changes"
    The below command will overwrite the changes to your `~/.config/containers/config.json`

```shell
cp ~/.docker/config.json ~/.config/containers/config.json
```

## Example file to copy and paste from

!!! note "This may or may not work"
    The below is not tested, but it _should work_

If you need an example file of all regions etc., the below is an example

```json
{
  "credHelpers": {
    "gcr.io": "gcloud",
    "us.gcr.io": "gcloud",
    "eu.gcr.io": "gcloud",
    "asia.gcr.io": "gcloud",
    "staging-k8s.gcr.io": "gcloud",
    "marketplace.gcr.io": "gcloud",
    "asia-docker.pkg.dev":  "gcloud",
    "asia-east1-docker.pkg.dev": "gcloud",
    "asia-east2-docker.pkg.dev":  "gcloud",
    "asia-northeast1-docker.pkg.dev": "gcloud",
    "asia-northeast2-docker.pkg.dev":  "gcloud",
    "asia-northeast3-docker.pkg.dev": "gcloud",
    "asia-south1-docker.pkg.dev":  "gcloud",
    "asia-south2-docker.pkg.dev": "gcloud",
    "asia-southeast1-docker.pkg.dev":  "gcloud",
    "asia-southeast2-docker.pkg.dev": "gcloud",
    "australia-southeast1-docker.pkg.dev":  "gcloud",
    "australia-southeast2-docker.pkg.dev": "gcloud",
    "europe-docker.pkg.dev":  "gcloud",
    "europe-central2-docker.pkg.dev": "gcloud",
    "europe-north1-docker.pkg.dev":  "gcloud",
    "europe-southwest1-docker.pkg.dev": "gcloud",
    "europe-west1-docker.pkg.dev":  "gcloud",
    "europe-west10-docker.pkg.dev": "gcloud",
    "europe-west12-docker.pkg.dev":  "gcloud",
    "europe-west2-docker.pkg.dev": "gcloud",
    "europe-west3-docker.pkg.dev":  "gcloud",
    "europe-west4-docker.pkg.dev": "gcloud",
    "europe-west6-docker.pkg.dev":  "gcloud",
    "europe-west8-docker.pkg.dev": "gcloud",
    "europe-west9-docker.pkg.dev":  "gcloud",
    "me-central1-docker.pkg.dev": "gcloud",
    "me-central2-docker.pkg.dev":  "gcloud",
    "me-west1-docker.pkg.dev": "gcloud",
    "northamerica-northeast1-docker.pkg.dev":  "gcloud",
    "northamerica-northeast2-docker.pkg.dev": "gcloud",
    "southamerica-east1-docker.pkg.dev":  "gcloud",
    "southamerica-west1-docker.pkg.dev": "gcloud",
    "us-docker.pkg.dev":  "gcloud",
    "us-central1-docker.pkg.dev": "gcloud",
    "us-east1-docker.pkg.dev":  "gcloud",
    "us-east4-docker.pkg.dev": "gcloud",
    "us-east5-docker.pkg.dev":  "gcloud",
    "us-south1-docker.pkg.dev": "gcloud",
    "us-west1-docker.pkg.dev":  "gcloud",
    "us-west2-docker.pkg.dev": "gcloud",
    "us-west3-docker.pkg.dev":  "gcloud",
    "us-west4-docker.pkg.dev": "gcloud"
  }
}
```

### How this file is generated

Regions can be listed using `gcloud artifacts locations list`

File format is

```json
{
  "credHelpers": {
    "region-name-docker.pkg.dev.": "gcloud"
  }
}
```

## Further reading

* [Authenticate to google artifact registry](../../cloud/gcp/authenticate-to-google-artifact-registry.md)
* [Get secret from docker-credential-gcloud cli](../../cloud/gcp/get-secret-from-docker-credential-gcloud-cli.md)
