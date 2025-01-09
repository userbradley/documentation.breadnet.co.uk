---
title: Load image in to kind
---

## What

In KIND, if you don't want to push images to a remote registry, you can _load_ them in to the cluster your self.

## How

```shell
kind load docker-image <image-name>:<tag> -n <cluster-name>
```

Example loading `alpine:1234` in to our cluster called `kind`

```shell
kind load docker-image alpine:1234 -n kind
```

## My image cant be found

Do not use the tag `latest` as it will try and find the image on Docker hub.

You can either:

### set pull policy to `Never`

```yaml
imagePullPolicy: Never
```

### retag your image

```shell
docker tag alpine:latest alpine:1234
```

and then re-load the image

```shell
kind load docker-image alpine:1234 -n kind
```

## Additional Reading

- [Kind quick start: Load image](https://kind.sigs.k8s.io/docs/user/quick-start/#loading-an-image-into-your-cluster)
