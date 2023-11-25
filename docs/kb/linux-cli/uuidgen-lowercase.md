---
title: uuidgen Lowercase
---

# uuidgen Lowercase

!!! Note "Why we need this"

    If you're instaling [Submariner](https://submariner.io/) you need to create a UUID for the pods getting deployed as part of one of their
    commands in the [Quick start guide](https://submariner.io/getting-started/quickstart/managed-kubernetes/gke/)

```shell
alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]"'
```
