---
title: Force containers to update when config map changes in helm
---

## Why

When we create a config map in Kubernetes, it syncs with the container the first time it creates, and then never again.

Sometimes in our applications we will update an env on the fly, or use a _range_ block to create infinite ones.

## How

Adding the below in to the `deployment.yaml` file will cause helm to basically `cat configmap.yaml | sha256sum` on the rendered template.

=== "Base Directory"

    This is for when the helm chart has all the `template` files in the same direcrory

    ```yaml
      template:
        metadata:
          annotations:
            checksum/config: {{ include (print $.Template.BasePath "/configmap.yaml") . | sha256sum }}
    ```

=== "Subdirectory"

    This is for when you have a folder splitting out say, _backend_ and _frontend_

    ```yaml
      template:
        metadata:
          annotations:
            checksum/config: {{ include (print $.Template.BasePath "/backend/configmap.yaml") . | sha256sum }}
    ```
