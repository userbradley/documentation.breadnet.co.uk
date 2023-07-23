---
title: Authenticate to Fly docker Registry
---

# Authenticate to Fly docker Registry

## What

Fly.io run their own Docker registry we can push images to. I'm still working out what the difference between the 2 is in terms of speed, as 
you have to take in to factor:

* Pushing from Codefresh
* Pulling from Docker hub to their Infrastructure

## Authentication

### Command line

The flyctl tool has a built-in docker auth section

```shell
fly auth docker
```

This then authenticates you, and you can view the image your app is running with

```shell
fly image show --config app.toml
```

### External Applications

!!! warning "When to use this"
    This should really only be used when you're authenticating to external systems, like Codefresh.

#### GitHub Actions

Navigate to the [Personal Access Tokens page](https://fly.io/user/personal_access_tokens)

Create a token called `githubactions`

Create an Actions secret called `FLY_API_TOKEN` and paste the token in.

```yaml
      - name: Login to Fly Registry
        uses: docker/login-action@v2
        with:
          registry: registry.fly.io
          username: x
          password: ${{ secrets.FLY_API_TOKEN }}
```

#### Codefresh


Navigate to the [Personal Access Tokens page](https://fly.io/user/personal_access_tokens)

Create a token called `codefresh-registry`

In codefresh, go to Account settings and then [Create a new Docker Registry](https://g.codefresh.io/account-admin/account-conf/integration/registryNew)

Use the below values

| Field Name      | Value                         |
|-----------------|-------------------------------|
| `Registry name` | `fly`                         |
| `Username`      | `x`                           |
| `Password`      | Token from the Fly.io website |
| `Domain`        | `registry.fly.io`             |

In your codefresh steps, now consume it:

```yaml
  prod-docker-build:
    title: "Prod Docker Build"
    type: "build"
    working_directory: "/codefresh/volume/<name of repo>/"
    image_name: "<name of project>"
    tag: "${{CF_SHORT_REVISION}}"
    dockerfile: "Dockerfile"
    stage: "build-docker"
    registry: fly
```

This will build an image names:

```yaml
registry.fly.io/<name of project>:<git hash>
```