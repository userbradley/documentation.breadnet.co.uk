---
title: Filter fields from gcloud putput
---

# Filter fields from gcloud putput

## Why

Sometimes we just need a text based list of projects, or compute engine instances without the random garbage that comes with

## Run your command

In this example I am using the `gcloud alpha projects list --folder=<>"` to get a list of projects

## Make note of the headers 

The output of the command looks like the below

```shell
PROJECT_ID                     NAME                   PROJECT_NUMBER
preadnet-gke-services       projects/<>
breadnet-gke-prod       projects/<>
```

## Filter based on the values you want

As you can see from the above, we are able to filter on `PROJECT_ID`

The full command would then be:

```shell
gcloud alpha projects list --folder=<> --format="value(project_id)"
```