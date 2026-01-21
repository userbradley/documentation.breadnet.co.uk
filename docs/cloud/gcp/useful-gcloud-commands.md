---
reviewdate: '2026-12-20'
title: Useful gcloud commands
---

## Get projects

```shell
gcloud projects list
```

## List organizations

```shell
gcloud organizations list --format="value(ID)"
```

## List folders in GCP Org

```shell
gcloud resource-manager folders list --organization=$(gcloud organizations list --format="value(ID)")
```

## Networking

???+ abstract "How to get the uri"
    simply append `--uri` to get the URI

### List Networks

```shell
gcloud compute network list --project=<>
```

### List subnets

```shell
gcloud compute networks subnets list --project=<>
```

## Enabled Services

### Get all enabled service in a project

```shell
gcloud services list --enabled --project=<>
```

### Get Just the name

=== "Native gcloud"
    ```shell
    gcloud services list --enabled --format="value(config.name)"
    ```

=== "with JQ"

    ```shell
    gcloud services list --format=json  | jq '.[].config.name' | tr -d '"'
    ```

## Additional Reading

* [Gcloud cheat sheet](https://gist.github.com/pydevops/cffbd3c694d599c6ca18342d3625af97)
