---
title: Manually trigger workflow from CLI
---

## Why

Sometimes when using `on: workflow_dispatch` the action won\t show up in the UI

## How

Ensure the workflow is on `main` and run the below command

```shell
gh workflow run <file name>.yaml --ref main
```

!!! tip "Example"

    ```yaml
    # .github/workflows/manual.yaml
    name: Manual Production
    on:
      workflow_dispatch:
    jobs:
      site:
        runs-on: ubuntu-latest
        name: Build Bucket List
        environment:
          name: Production
          url: https://bucketlist.breadnet.co.uk
        steps:
          - name: Git Clone
            uses: actions/checkout@v4
          - name: Fly Build and Deploy
            uses: userbradley/actions-fly@v1.0.0
            with:
              flyToken: ${{ secrets.FLY_ACCESS_TOKEN }}
    ```

    The run

    ```shell
    gh workflow run manual.yaml --ref main
    ```
