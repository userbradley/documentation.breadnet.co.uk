---
title: List project wide SSH keys in Google Cloud
---

## Why

Sometimes project wide SSH keys are enabled on the project and you'd like to list them

## How

```shell
gcloud compute project-info describe \
 --format="value(commonInstanceMetadata[items][ssh-keys])"
```

Ideally you should not enable project wide SSH keys, [disable it in the org policy](https://cloud.google.com/compute/docs/oslogin/manage-oslogin-in-an-org#set-org-policy)

## Further reading

* [Add keys](https://cloud.google.com/compute/docs/connect/add-ssh-keys#gcloud)
