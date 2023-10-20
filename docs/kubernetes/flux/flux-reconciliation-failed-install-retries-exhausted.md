---
title: "Flux reconciliation failed: install retries exhausted"
---

## What

You may get the below error for what ever reason

```text
flux reconciliation failed: install retries exhausted
```

## Solution

### Suspend the release

```shell
flux suspend hr <release_name>
```

### Resume the release

```shell
flux resume hr <release_name>
```

You should now be able to run the below and see a passing release

```shell
flux get helmreleases
```

??? "Example of passing release"
    ```text
    ➜ flux get helmreleases -n default
    NAME    REVISION        SUSPENDED       READY   MESSAGE
    podinfo 4.0.6           False           True    Release reconciliation succeeded
    ```
