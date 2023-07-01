---
title: 'docker-credential-desktop  executable file not found in path'
---

## What

I was trying to pull an image from `ghcr` after [authenticating podman to ghcr](authenticate-podman-to-ghcr.md) and got the below error

```shell
error: getting auth config for "ghrc.io/": getting auth config: error getting credentials - err: exec: "docker-credential-desktop": executable file not found in $PATH, out: 
```

## Solution


Edit `~/.docker/config.json`

Make note that we're changing it from `credsStore` by removing the additional `s`

```diff
{
  "stackOrchestrator" : "swarm",
  "experimental" : "disabled",
-  "credsStore" : "desktop"
+  "credStore" : "desktop"
}
```
