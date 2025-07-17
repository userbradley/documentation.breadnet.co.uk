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

Or you can do all projects

```shell
#!/bin/bash
for project in $(gcloud projects list --format="value(projectId)")
   do
      echo "ProjectId: $project"
      for user in $(gcloud compute project-info describe --project=$project --
         format="table[no-heading](commonInstanceMetadata.items.ssh-keys)" | grep -v ecdsa-sha2-nistp256 | cut -d ":" -f 1)
      do
         echo " -> User $user"
   done
done
```

Ideally you should not enable project wide SSH keys, [disable it in the org policy](https://cloud.google.com/compute/docs/oslogin/manage-oslogin-in-an-org#set-org-policy)

## Further reading

* [Add keys](https://cloud.google.com/compute/docs/connect/add-ssh-keys#gcloud)
* [List keys](https://stackoverflow.com/questions/63744427/gcloud-compute-project-info-describe-get-ssh-key-usernames-without-associated)
