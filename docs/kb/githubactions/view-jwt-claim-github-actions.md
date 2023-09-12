---
title: View JWT claims GitHub actions
---

## Why

When configuring Workload Identity federation for GitHub and Google cloud, it's useful to see the JWT claim being sent

## How

Add the below in to your workflow

!!! note "This is an official GitHub repository"
    This is not something I have created, so no stress.

    You can view it at [github/actions-oidc-debugger](https://github.com/github/actions-oidc-debugger)

```yaml
on: [push]

jobs:
  job_id:
    runs-on: ubuntu-latest
    name: auth
    permissions:
      id-token: 'write'

    steps:
      - name: Checkout actions-oidc-debugger
        uses: actions/checkout@v3
        with:
          repository: github/actions-oidc-debugger
          ref: main
          token: ${{ secrets.GITHUB_TOKEN }}
          path: ./.github/actions/actions-oidc-debugger
      - name: Debug OIDC Claims
        uses: ./.github/actions/actions-oidc-debugger
        with:
          audience: 'projects/PROJECT_NUMBER/locations/global/workloadIdentityPools/POOL_NAME/providers/PROVIDER_NAME'
```

You will get an output like

```json
{
  "actor": "userbradley",
  "actor_id": "41597815",
  "aud": "https://github.com/userbradley",
  "base_ref": "",
  "event_name": "push",
  "exp": <>,
  "head_ref": "",
  "iat": 1689766534,
  "iss": "https://token.actions.githubusercontent.com",
  "job_workflow_ref": "userbradley/dogbowl/.github/workflows/widfed-dogbowl.yml@refs/heads/main",
  "job_workflow_sha": "<>",
  "jti": "<>",
  "nbf": <>,
  "ref": "refs/heads/main",
  "ref_protected": "false",
  "ref_type": "branch",
  "repository": "userbradley/dogbowl",
  "repository_id": "<>",
  "repository_owner": "userbradley",
  "repository_owner_id": "<>",
  "repository_visibility": "private",
  "run_attempt": "2",
  "run_id": "<>",
  "run_number": "3",
  "runner_environment": "github-hosted",
  "sha": "<>",
  "sub": "repo:userbradley/dogbowl:ref:refs/heads/main",
  "workflow": ".github/workflows/widfed-dogbowl.yml",
  "workflow_ref": "userbradley/dogbowl/.github/workflows/widfed-dogbowl.yml@refs/heads/main",
  "workflow_sha": "<>"
}
```
