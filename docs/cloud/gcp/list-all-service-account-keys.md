---
title: List all service account keys
---

## Why

As part of securing your cloud estate, you want to know how many service account's and keys there are.

## How

=== "Asset Inventory"

    Navigate to the Asset Inventory at the **ORG level**

    Click on `Asset Query` at the top

    Use the below SQL

    ```sql
    SELECT
        SPLIT(resource.data.name, '/')[1] AS project,
        SPLIT(resource.data.name, '/')[3] AS email,
        SPLIT(resource.data.name, '/')[5] AS keyId,
        resource.data.validAfterTime AS creationTime
    FROM
      iam_googleapis_com_ServiceAccountKey
    WHERE
      resource.data.keyType = "USER_MANAGED"
    ```

=== "gcloud CLI"

    !!! note "This was it not ideal"
        This method was used before GCP added the Asset Query option

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
