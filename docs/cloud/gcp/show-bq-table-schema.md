---
title: Show BigQuery Table Schema
---

## Why

Sometimes people create them in the UI and they need to be imported in to terraform

## How

### Set your project first

This needs to be set to the BigQuery project

```shell
gcloud config set project <>
```

### Get the Dataset Name

In the BigQuery UI, find the Dataset you want, and click on `Details`

Make a note of the `Table ID` at the top

### Get the Schema


!!! note "Project Name"
    Ensure that the project name has a colon (`:`) after it.

    You can also omit the project name if you've set your global projecect (See [Set your Project first](#set-your-project-first))
```shell
bq show --schema <project name>:<dataset ID>.<table name> | jq
```
