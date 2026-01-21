---
reviewdate: '2026-12-20'
title: Trigger Kubernetes Cron Job Manually
---

## Why

Sometimes when you have a Job that is on a weekly schedule, you don't want to wait a week to test it

## How

```shell
kubectl create job --from=cronjob/<name> <give it a name>
```

## Example

### Get the Job name first

```shell
kubectl get cronjobs.batch
```

```shell
NAME                SCHEDULE    SUSPEND   ACTIVE   LAST SCHEDULE   AGE
bread-roller   0 0 * * *   False     0        11h             15d
```

### Create the job

We are going to call this one `yeet`

```shell
kubectl create job --from=cronjob/bread-roller yeet
```

### View the container

```shell
k get pods
NAME                          READY   STATUS            RESTARTS   AGE
bread-7775f66dbc-qppxt        0/1     PodInitializing   0          5s
yeet-8hqrc                    0/1     Completed         0          6s
```
