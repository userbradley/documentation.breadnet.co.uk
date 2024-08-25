---
title: Get secret from docker-credential-gcloud cli
---

## Why

Not sure, perhaps you want to see what the Secret comes out as

## How

The command line `docker-credential-gcloud` CLI has 3 methods, [from what I can tell](https://github.com/docker/docker-credential-helpers#development)

* `GET`
* `LIST`
* `DELETE`

For all of these except `list`, you need to pass the URL of the server as standard input.

### Get

```shell
echo "europe-west2-docker.pkg.dev" | docker-credential-gcloud get
```

Example output

```json
{
  "Secret": "ya29.<gcloud token>",
  "Username": "_dcgcloud_token"
}
```

### List

```shell
docker-credential-gcloud list
```

Example output

```json
{
  "https://asia.gcr.io": "_dcgcloud_token",
  "https://eu.gcr.io": "_dcgcloud_token",
  "https://gcr.io": "_dcgcloud_token",
  "https://marketplace.gcr.io": "_dcgcloud_token",
  "https://staging-k8s.gcr.io": "_dcgcloud_token",
  "https://us.gcr.io": "_dcgcloud_token"
}

```
### Delete

Not entirely sure that this actually deletes the credentials

```shell
docker-credential-gcloud delete
```
