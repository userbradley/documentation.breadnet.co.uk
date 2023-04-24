---
title: View startup script on Google Compute Engine
---

## Why

When troubleshooting a startup script, sometimes you want to see what was applied, from in the VM

## How

```shell
curl --header "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/attributes/startup-script"
```