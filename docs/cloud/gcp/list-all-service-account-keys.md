---
title: List all service account keys
---

## Why

As we move towards not doing things badly, we will be using stuff like Workload Identity [federation]

## How

The below assumes you are already authenticated to google cloud, if you are not then

```shell
gcloud auth application-default login
```


### Create the file

Create a file called `list-sa.sh`


### Write the script

In the file, paste the below

=== "User managed keys"

    !!! question "What are user managed keys?"
        User managed keys are the keys you create through the UI


    ```shell
    gcloud projects list --format="value(project_id)" | while read -r project_id; do
         gcloud iam service-accounts list --project=$project_id --format='value(email)' | while read -r sa_email; do
           echo "Service Account: $sa_email"
           gcloud iam service-accounts keys list --iam-account=$sa_email --managed-by=user; done
    done

    ```


=== "All keys"

    !!! question "Why is this one different"
        Google service accounts have Google managed keys that are created on the _back end_ and do not display in the UI


    ```shell
    gcloud projects list --format="value(project_id)" | while read -r project_id; do
         gcloud iam service-accounts list --project=$project_id --format='value(email)' | while read -r sa_email; do
           echo "Service Account: $sa_email"
           gcloud iam service-accounts keys list --iam-account=$sa_email; done
    done
    ```

### Make it Executable

```shell
chmod +x list-sa.sh
```

### Execute and leave it to run

```shell
./list-sa.sh
```
