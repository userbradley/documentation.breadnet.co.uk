---
title: Authenticate GitHub actions to GCP using Workload Identity Federation
reviewdate: '2023-10-22'
---

## Why

When using GitHub actions, you will need to authenticate to Google cloud to access resources

## How

The below assumes you have 2 variables set:


| Variable Name                | Variable Example                                                                                                                              |
|------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| `WORKLOAD_IDENTITY_PROVIDER` | ```projects/<project numerical ID /locations/global/workloadIdentityPools/<project>/providers/<workload identity federation provider name>``` |
| `SERVICE_ACCOUNT`            | `tf-ar-robot@<project name>.gserviceaccount.com`                                                                                              |

These can be set at the GitHub Org level (*preferred*) or on the repo
```yaml
name: GCP Auth Example


jobs:
  docker:
    runs-on: ubuntu-latest
    permissions:
      id-token: write
      contents: read

    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - id: 'auth'
        name: 'Authenticate to Google Cloud'
        uses: 'google-github-actions/auth@v1'
        with:
          token_format: 'access_token' # (1)!
          workload_identity_provider: ${{vars.WORKLOAD_IDENTITY_PROVIDER}}
          service_account: ${{vars.SERVICE_ACCOUNT}}

```

1. Using the `token_format` of `access_token` is optional. This is used when authentication to Google Artifact Registry

## What to read next

* [Authenticate GitHub actions to Google Artifact Registry](authenticate-github-actions-to-google-artifact-registry.md)
