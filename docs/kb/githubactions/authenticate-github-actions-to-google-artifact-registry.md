---
title: Authenticate GitHub actions to Google Artifact Registry
reviewdate: '2023-10-22'
---

## Why

When using GitHub Actions to build docker images and push them to GAR, you need to authenticate.

## How

### Pre-requisites

You need to have configured [_Authenticating to GCP using Workload identity Federation_](authenticate-github-actions-to-gcp-using-workload-identity-federation.md)

## Workflow File

```yaml
name: GCP Auth Example to GAR

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
          token_format: 'access_token'
          workload_identity_provider: ${{vars.WORKLOAD_IDENTITY_PROVIDER}}
          service_account: ${{vars.SERVICE_ACCOUNT}}

      - uses: 'docker/login-action@v2'
        name: Log docker in to Google Container Store
        with:
          registry: 'europe-west2-docker.pkg.dev'
          username: 'oauth2accesstoken'
          password: '${{ steps.auth.outputs.access_token }}'
```

