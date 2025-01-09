---
title: Remove the lien to allow deletion
---

## What causes this error

This is caused when a Lien is applied to a project to prevent accidental deletion via the API

## Example error

```text
╷
│ Error: Error when reading or editing Project b-n-eu-h-<redacted>: googleapi: Error 400: Precondition check failed.
│ Details:
│ [
│   {
│     "@type": "type.googleapis.com/google.rpc.PreconditionFailure",
│     "violations": [
│       {
│         "description": "A lien to prevent deletion was placed on the project by [xpn.googleapis.com]. Remove the lien to allow deletion.",
│         "subject": "liens/p747108796564-<>e395b-88fd-4b06-81be-374a3fd3f835",
│         "type": "LIEN"
│       }
│     ]
│   },
│   {
│     "@type": "type.googleapis.com/google.rpc.Help",
│     "links": [
│       {
│         "description": "Troubleshooting project deletion",
│         "url": "https://cloud.google.com/resource-manager/docs/troubleshooting-project-deletion"
│       }
│     ]
│   },
│   {
│     "@type": "type.googleapis.com/google.rpc.ErrorInfo",
│     "domain": "cloudresourcemanager.googleapis.com",
│     "reason": "PROJECT_DELETE_LIEN"
│   }
│ ]
│ , failedPrecondition
│
│
╵
ERRO[0022] Terraform invocation failed in /Users/<>
ERRO[0022] 1 error occurred:
        * exit status 1
```

## How to remove the Lien

Set the project:

```shell
gcloud config set project <project name>
```

List the Leins:

```shell
gcloud alpha resource-manager liens list
```

Delete the Lien:

```shell
gcloud alpha resource-manager liens delete <lien name>
```

## Delete the project

Depending on how you are managing the project, your mileage may vary

=== "Terraform"

    ```shell
    terraform destroy
    ```

=== "Terragrunt"

    ```shell
    terragrunt destroy
    ```

=== "UI"

    Learn to use Terraform
