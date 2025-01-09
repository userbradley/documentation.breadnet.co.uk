---
title: gcloud Disable Dependent Services
---

## What

When using [gcloud to disable services](gcloud-disable-services.md), you may run in to the below error

```text
Please specify disable_dependent_services=true if you want to proceed with disabling all services.
```

This is _actually_ a terraform error that the API has returned.

It should really read:

```text
Please specify disableDependentServices:true if you want to proceed with disabling all services.
```

But that's none of my Business

## How

You will need to use [`gcurl`](gcurl.md)

#### Setup gcurl

```shell
alias gcurl='curl -H "Authorization: Bearer $(gcloud auth print-access-token)" -H "Content-Type: application/json"'
```

#### Get the project numerical ID

```shell
gcloud projects list | grep "project-name"
```

Make a note of the Numerical ID

#### Disable the service

```shell
PROJECT=1234
SERVICE="service.googleapis.com"
gcurl -d '{ "disableDependentServices": true,}' "https://serviceusage.googleapis.com/v1/projects/${PROJECT}/services/${SERVICE}:disable"
```
