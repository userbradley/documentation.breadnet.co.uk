---
title: Configure podman to use Remote Google Container Registry
---



```toml
# /etc/containers/registries.conf
unqualified-search-registries = ["europe-west2-docker.pkg.dev"]

[[registry]]
prefix = "europe-west2-docker.pkg.dev"
insecure = false
blocked = false
location = "europe-west2-docker.pkg.dev/<redacted>/containers"

[[registry.mirror]]
location = "europe-west2-docker.pkg.dev/<redacted>/containers"
```