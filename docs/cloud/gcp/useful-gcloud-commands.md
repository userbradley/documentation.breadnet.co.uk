---
title: Useful gcloud commands
---

# Useful `gcloud` commands

## List folders in GCP Org

```shell
gcloud resource-manager folders list --organization=$(gcloud organizations list --format="value(ID)")
```

