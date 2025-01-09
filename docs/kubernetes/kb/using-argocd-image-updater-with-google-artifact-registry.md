---
title: Using ArgoCD Image updater with Google Artifact Registry
---

# Using ArgoCD Image updater with Google Artifact Registry

## What

ArgoCD Image updater is a cool tool that allows you to update Images for containers, provided you use Argo CD

## The issue

From what I could see, argocd image updater needs you to provide credentials to the cli tool, to get images.

If you are using Google Artifact registry (Officially not supported, but works anyway) - You need to supply credentials as the application
does not use your local creds.

## Export Credentials

We will export the credentials to an Environment Variable, as this seems to be the only way that it picks them up

```shell
export auth=oauth2accesstoken:$(gcloud auth print-access-token)
```

This will run the command `gcloud auth print-access-token` first (as it's in parentheses, remember `PEMDAS`) then save its value as text.

Optionally, check what it looks like

```
echo $auth
```

Should return something like the below

```text
oauth2accesstoken:<secret>>
```

## Listing the images

```shell
argocd-image-updater test europe-west2-docker.pkg.dev/google-ar-project/repo/container --loglevel trace --disable-kubernetes --credentials env:auth
```

```text
time="2022-11-11T18:06:41Z" level=info msg="retrieving information about image" image_alias= image_name=europe-west2-docker.pkg.dev/google-ar-project/repo/container registry_url=europe-west2-docker.pkg.dev
time="2022-11-11T18:06:41Z" level=warning msg="Target platform is 'darwin/arm64', but that's not a supported container platform. Forgot --platforms?"
time="2022-11-11T18:06:41Z" level=debug msg="setting rate limit to 20 requests per second" prefix=europe-west2-docker.pkg.dev registry="https://europe-west2-docker.pkg.dev"
time="2022-11-11T18:06:41Z" level=debug msg="Inferred registry from prefix europe-west2-docker.pkg.dev to use API https://europe-west2-docker.pkg.dev"
time="2022-11-11T18:06:41Z" level=trace msg="Fetching credentials for registry https://europe-west2-docker.pkg.dev"
time="2022-11-11T18:06:41Z" level=info msg="Fetching available tags and metadata from registry" application=test image_alias= image_name=europe-west2-docker.pkg.dev/google-ar-project/repo/container registry_url=europe-west2-docker.pkg.dev
time="2022-11-11T18:06:41Z" level=trace msg="Performing HTTP GET https://europe-west2-docker.pkg.dev/v2/google-ar-project/repo/container/tags/list"
time="2022-11-11T18:06:41Z" level=info msg="Found 7 tags in registry" application=test image_alias= image_name=europe-west2-docker.pkg.dev/google-ar-project/repo/container registry_url=europe-west2-docker.pkg.dev
time="2022-11-11T18:06:41Z" level=trace msg="Finding out whether to consider 0.0.1 for being updateable" image=europe-west2-docker.pkg.dev/google-ar-project/repo/container
time="2022-11-11T18:06:41Z" level=trace msg="Finding out whether to consider 0.0.2 for being updateable" image=europe-west2-docker.pkg.dev/google-ar-project/repo/container
time="2022-11-11T18:06:41Z" level=trace msg="Finding out whether to consider 0.0.3 for being updateable" image=europe-west2-docker.pkg.dev/google-ar-project/repo/container
time="2022-11-11T18:06:41Z" level=trace msg="Finding out whether to consider 0.0.4 for being updateable" image=europe-west2-docker.pkg.dev/google-ar-project/repo/container
time="2022-11-11T18:06:41Z" level=trace msg="Finding out whether to consider 0.0.5 for being updateable" image=europe-west2-docker.pkg.dev/google-ar-project/repo/container
time="2022-11-11T18:06:41Z" level=trace msg="Finding out whether to consider 0.0.6 for being updateable" image=europe-west2-docker.pkg.dev/google-ar-project/repo/container
time="2022-11-11T18:06:41Z" level=trace msg="Finding out whether to consider 0.0.7 for being updateable" image=europe-west2-docker.pkg.dev/google-ar-project/repo/container
time="2022-11-11T18:06:41Z" level=debug msg="found 7 from 7 tags eligible for consideration" image=europe-west2-docker.pkg.dev/google-ar-project/repo/container
time="2022-11-11T18:06:41Z" level=info msg="latest image according to constraint is europe-west2-docker.pkg.dev/google-ar-project/repo/container:0.0.7" application=test image_alias= image_name=europe-west2-docker.pkg.dev/google-ar-project/repo/container registry_url=europe-west2-docker.pkg.dev

```

## What to read next

[]()

## footnotes

[Recipie on how to use it in GKE](https://github.com/argoproj-labs/argocd-image-updater/issues/319#issuecomment-1130547057)
