---
reviewdate: '2026-12-20'
title: Add Google Organization to Rapid7
---

I have decided to write this documentation because the official rapid7 documentation is garbage and I feel I can do better

## Create an Org Role

Navigate to your Org profile, then select **IAM** > **Role**

At the top of the page, select `+ CREATE ROLE`

Fill out the below

| Field Name        | Value                                                                                                                                                                             |
|-------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Title             | `Rapid7 Crawler`                                                                                                                                                                  |
| Description       | `Role to allow Rapid7 to crawl GCP`                                                                                                                                               |
| ID                | `rapid7.crawler`                                                                                                                                                                  |
| Role Launch Stage | `General Availability`                                                                                                                                                            |
| Permissions       | `"bigquery.tables.get", "bigquery.tables.list", "cloudasset.assets.listResource", "cloudasset.assets.searchAllIamPolicies","storage.buckets.get", "storage.buckets.getIamPolicy"` |

Click `CREATE` once done

## Create service project and account

Due to how GCP works, you cant create service accounts at the org role. Instead, we need to creat a service account in a project,
then give it org level access

Create a Google Project in a location of your choice. It's recommended you create a folder called `External Auditing tools` and under there
create the project.

Once the project is created, navigate to **IAM and Admin** > **Service Accounts**

Click on **+ CREATE SERVICE ACCOUNT**

Fill out the below

| Field name                  | Value                                         |
|-----------------------------|-----------------------------------------------|
| Service Account Name        | `Rapid7 Crawler`                              |
| Service Account ID          | `rapid7-crawler`                              |
| Service Account Description | `Service Account used by Rapid7 to crawl GCP` |

Make a note of the email address, it will be in the format of

```text
<service-account-id>@<project-name>.iam.gserviceaccount.com`
```

Click `CREATE AND CONTINUE`

## Enable Project APIs

Rapid7 requires at minimum the enablement of the below API in the service project

* `cloudresourcemanager.googleapis.com`

To enable this, search for `Cloud Reource Manager API` in the [GCP console](https://pantheon.corp.google.com/)

## Grant service account Permissions at org level

Navigate to your GCP org by clicking the project selector at the top of your screen, then clicking the domain name

Navigate to **IAM and Admin**

Click `+GRANT ACCESS`

Fill out the below

| Field Name     | Value                                                                                        |
|----------------|----------------------------------------------------------------------------------------------|
| Add Principals | Email address from [Create Service project and account](#create-service-project-and-account) |

For the **Assign Roles** field add the below

* `roles/resourcemanager.folderViewer`
* `roles/iam.securityReviewer`
* `roles/viewer`
* `roles/resourcemanager.organizationViewer`

Also add the custom role you created. To locate this, click on the `Select a role` box, then click under `Quick access` click
**Custom** and scroll to locate your role
