---
title: Copy containers between repos
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
* [Github source code](https://github.com/google/go-containerregistry/tree/main/cmd/gcrane)


## Gcrane not working

Somtimes after running the command, it returns with nothing.

I cant explain why it does this, but it's annoying.

### Create a file with all the images

```shell
gcrane ls userbradley/searchsploit > images.txt
```

Make sure to remove the `index.docker.io/reponame/container` at the start of the image, or it breaks

### Create a script to copy them one after another

```shell
## copy.sh
#!/bin/bash

images=$(cat images.txt)

for img in ${images}
do
    gcrane cp userbradley/searchsploit:${img} europe-west2.pkg.dev/bradley/searchsploit/searchsploit:${img}
done
```

The reason we specify the image name in the script is because when I was running it, it was copying the containers but not the tags

### Assign Execute Permissions

```shell
chmod +x copy.sh
```

### Run the copy job

```shell
./copy.sh
```

!!! Note
    You can replace `europe-west2...` with any Docker compliant repo. Only tested with GCR and GAR

## footnotes

!!! Note "If you are not copying to GAR"

    You may want to look at the below

    ```
    https://github.com/containers/skopeo
    ```
