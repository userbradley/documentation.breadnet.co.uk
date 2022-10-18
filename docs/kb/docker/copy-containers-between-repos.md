---
title: Copy containers between repos
outdated: true
---

# Copy containers between repos

## What

This is especially useful when moving from `gcr.io` to the new Artifact registry that Google offer.

That's not to say that you can't use this for copying between private repositories (as long as you're authenticated)

## How

We can use a tool called [`gcrane`](https://github.com/google/go-containerregistry/blob/main/cmd/gcrane/README.md)

## Install `gcrane`

```shell
go install github.com/google/go-containerregistry/cmd/gcrane@latest
```

This will build and install the package to your `$PATH`

## List images

```shell
gcrane ls userbradley/searchsploit
```

We should see something similar to the below

```shell
index.docker.io/userbradley/searchsploit:alpine-0.0.1
index.docker.io/userbradley/searchsploit:alpine-0.0.2
index.docker.io/userbradley/searchsploit:alpine-base
index.docker.io/userbradley/searchsploit:ubuntu-0.0.1
index.docker.io/userbradley/searchsploit:ubuntu-1
```

## Copy all images to AR

```shell
gcrane cp -r userbradley/searchsploit europe-west2.pkg.dev/bradley/searchsploit/searchsploit
```

## External sources 

* [Google Documentation](https://cloud.google.com/artifact-registry/docs/docker/copy-from-gcr#gcrane-local)
* [Github source code](https://github.com/google/go-containerregistry/blob/main/cmd/gcrane/README.md)