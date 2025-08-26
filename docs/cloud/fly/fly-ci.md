---
title: Fly CI
---

To be able to use Fly.io in a CI, I need to build a custom docker image that has the Fly CLI.

## Logging in

One of the first issues I faced was how to login.

You can use an Access token (either create it via the UI, or command line)

Export it as an env variable

```shell
export FLY_API_TOKEN="<>"
```

Now when you run `flyctl apps list` it will work

## Installing Flyctl

The issue we have is installing it requires Curl to use their script.

As this is a _home lab_ and is not really production, we can use `master` and `latest` for version pinning.

In CI, we are doing the below:

* Set the API key globally on the pipeline
* Build a docker image based on what branch the commit is to
  * As a sub step, we push the image to Docker Hub
* Deploy the image to Fly.io

To know why we are not using their builder, read [Deployment Strategy](deployment-strategy.md)

```yaml
steps:
  fly-env:
    title: "Fly API Env"
    stage: "setup"
    image: alpine
    commands:
      - export FLY_API_TOKEN=${{FLY_API_TOKEN}}
      - cf_export FLY_API_TOKEN
  dev-docker-build:
    title: "Dev Docker Build"
    type: "build"
    working_directory: "/codefresh/volume/documentation.breadnet.co.uk/"
    image_name: "userbradley/documentation"
    tag: "dev-${{CF_SHORT_REVISION}}"
    dockerfile: "dev.Dockerfile"
    stage: "build-docker"
    registry: userbradley
    when:
      branch:
        only:
          - dev
  deploy-dev:
    title: Deploy Dev
    stage: "deploy"
    image: "userbradley/flyctl:latest"
    working_directory: "/codefresh/volume/documentation.breadnet.co.uk/"
    commands:
      - flyctl deploy --config dev.toml --image userbradley/documentation:dev-${{CF_SHORT_REVISION}} --detach
    when:
      branch:
        only:
          - dev
```
