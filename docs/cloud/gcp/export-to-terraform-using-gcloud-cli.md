---
title: Export to terraform using gcloud cli
---

# Export to terraform using gcloud cli

1. Create a bucket if your GCP account has location constraints enabled
2. Enable `cloudasset.googleapis.com` on GCP

```shell

gcloud beta resource-config bulk-export --reseource-format=terraform --storage-path='gs://tf-eport-bucket-qwjhef'
```


This will print out to stdout, which is useful and also not.

We can append > file.tf

so it's like

```shell
gcloud beta resource-config bulk-export --resource-format=terraform --storage-path='gs://tf-eport-bucket-qwjhef' > file.tf
```

There should now be a file called file.tf in your current directory.

You can view it using cat file.tf

If you are going to re-structure it, I suggest moving the file to a git repo, committing and pushing it, then making changes.



Try and split out your resources in to new files