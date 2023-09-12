---
title: Useful gcloud commands
---

# Useful gcloud commands

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


## Additional Reading

* [Gcloud cheat sheet](https://gist.github.com/pydevops/cffbd3c694d599c6ca18342d3625af97)
