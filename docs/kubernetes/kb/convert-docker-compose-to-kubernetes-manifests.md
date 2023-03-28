---
title: Convert Docker compose to Kubernetes manifest files
---

# Convert Docker compose to Kubernetes manifest files

## Why

Sometimes when working with docker (or podman) if makes sense to push the images in to Kubernetes.

Engineers may not have the required experience to convert their `docker-compose.yaml` in to the required kubernetes files

## How

### Install kompose

```shell
brew install kompose
```

### Convert a file

=== "Default"

    Open a directory with a `docker-compose.yaml` file in it
    
    Run the below
    
    ```shell
    kompose convert
    ```

=== "Pick a specific file"

    You can then specify any docker compose file
    
    ```
    kompose --file docker-voting.yml convert
    ```


You will then get a collection of `.yaml` files in the current directory