---
title: "Failed to get existing workspaces: querying Cloud Storage failed: storage: bucket doesn't exist"
---


# Failed to get existing workspaces: querying Cloud Storage failed: storage: bucket doesn't exist

## What this error means

You probably get this error when you are trying to run `terraform init`, and it says your other google account doesn't have access to the bucket

## How to resolve

### Make sure you have the correct account logged in

```shell
gcloud auth list
```

You should see your work account with an `*` next to it

### Set that as the default account

```shell
gcloud auth config set account "root@infra.breadnet.co.uk"
```

### Login to default account

```
gcloud auth application-default login
```

### Try again

```shell
terraform init
```

### Init and reconfigure

```shell
terraform init -reconfigure
```

### Remove terraform artifacts

!!! warning

    Only do this if nothing has worked so far!

```shell
rm -rvf .terraform*
```
