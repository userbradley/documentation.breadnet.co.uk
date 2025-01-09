---
title: MkDocs on Fly.io
---

## What

This guide hopes to set the groundwork on how to get an mkdocs site up and running
on [Fly.io](https://fly.io?ref=documentation.breadnet.co.uk)

### What is Fly

Fly is a _serverless_ hosting service that allows you to run Containers pretty much for free

### What is mkdocs

Mkdocs is a documentation system designed for Markdown and extreme simplicity.

We are going to use the [Material for mkdocs](https://squidfunk.github.io/mkdocs-material/?utm_source=breadnet.co.uk&utm_medium=kb&utm_campaign=mkdocs%20on%20fly.io) theme, but it's very easily changed to suit others.

## How

### Prerequisites

* Have a working mkdocs site
* Have a GitHub account
* Have a fly.io account (They're free)

### Configure the Dockerfile

As Fly.io (Fly) runs everything as Containers, we need to have one.

Create a file called `Dockerfile` and `nginx.conf` in the same directory as your `mkdocs.yaml` file

```sh
touch {nginx.conf,Dockerfile}
```

In the `Dockerfile` place the below

```dockerfile
FROM squidfunk/mkdocs-material:latest as BUILDER
WORKDIR /app
COPY mkdocs.yml /app/mkdocs.yml
COPY docs /app/docs
RUN ["mkdocs", "build"]

FROM nginx:stable-alpine3.17-slim
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=BUILDER /app/site /var/www/documentation
HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1"
EXPOSE 80
```

And in the `nginx.conf` file, the below:

```nginx
server {

    listen       80;
    listen  [::]:80;

    root /var/www/documentation;
    index  index.html;

    error_page 404 403 /404.html;
    error_page  404              /404.html;
    location = /404.html {
        root /var/www/documentation;
        internal;
    }

    location /healthz { # Setups the `/healthz` page
       stub_status on; # Turns on the module designed to output status of the server
       access_log off; # Do not log requests to this endpoint
       allow 127.0.0.1; # Allows Localhost
       allow 172.16.0.0/12; # Allow Consul to access the page
       deny all; # Any one else gets put in the bin
    }
}
```

Now we need to test if this works

=== "Docker"

    ```shell
    docker build docs:1 && docker run -p 8080:80 docs:1
    ```

=== "Podman"

    ```shell
    podman build docs:1 && podman run -p 8080:80 docs:1
    ```

Browse to <http://localhost:8080> and you should see your site

### Fly.io part

Next is to create a Fly app.

Change `<name>` to the name of your documentation.

```shell
fly app create <name>
```

We then need to save the config file to use later in the GitHub actions stage

```shell
fly config save -a <name>
```

This will then save a file called `fly.toml`

You should edit this file to it is similar to the below

```toml
app = "<name>"
kill_signal = "SIGINT"
kill_timeout = 5
processes = []

[env]

[experimental]
  allowed_public_ports = []
  auto_rollback = true

[[services]]
  internal_port = 80
  processes = ["app"]
  protocol = "tcp"
  script_checks = []
  [services.concurrency]
    hard_limit = 100
    soft_limit = 80
    type = "connections"

  [[services.ports]]
    force_https = true
    handlers = ["http"]
    port = 80

  [[services.ports]]
    handlers = ["tls", "http"]
    port = 443

  [[services.http_checks]]
    grace_period = "10s"
    interval = "30s"
    method = "GET"
    timeout = "5s"
    path = "/healthz"
```

We can then run this build step locally, and push

!!! note "Only works with docker"
    Due to the Fly CLI depending heavily on Docker to run Locally, if you're using something like
    containerd or Podman, you cant run this locally

```shell
flyctl deploy --config fly.tom --dockerfile Dockerfile --local-only --push --detach --auto-confirm
```

This command will

1. Build the app using the `Dockerfile`
2. Validate the config is correct
3. Push the Dockerfile to the Fly.io registry
4. Deploy the application

You should then get the URL of your app which you can go to and validate it works well

### GitHub Actions

Navigate to [fly.io/user/personal_access_tokens](https://fly.io/user/personal_access_tokens?ref=documentation.breadnet.co.uk) and
create a new one on the top right hand side.

Copy this to your clipboard as we need it later.

In GitHub, navigate to your repo, then **Settings** > **Secrets and Variables** > **Actions**

Here, create a **Repository Secret** called `FLY_ACCESS_TOKEN` - Paste in the value from the Fly.io dashboard

In your repo, create a directory called `.github/workflows`

```shell
mkdir -p .github/workflows
```

Create a file called `build-site.yaml`

```shell
touch .github/workflows/build-site.yaml
```

In this file, we need to put the below

```yaml
name: Build Site
on:
  push:
    branches:
      - main
    paths:
      - docs/**
      - .github/workflows/build-site.yaml
      - mkdocs.yml
      - Dockerfile
      - fly.toml
jobs:
  site:
    runs-on: ubuntu-latest
    name: Build Documentation
    steps:
      - name: Git Clone
        uses: actions/checkout@v4
      - name: Fly Build and Deploy
        uses: userbradley/actions-fly@v1.0.0
        with:
          flyToken: ${{ secrets.FLY_ACCESS_TOKEN }}
```

This uses a GitHub action I created, which under the hood just runs the fly command we ran earlier, but uses your Fly token

Commit all the files, and push to your repo. When a commit _touches_ the `docs/**` files, the `mkdocs.yaml` file or
anything in the `docs` directory, it will build the site.

## Things don't work

Please open an issue, and use the `Docs dont work` tab to file an issue.

I am happy to assist!

If you need an example of this working, this repo uses Fly

See [.github/workflows/prod.yaml](https://github.com/userbradley/documentation.breadnet.co.uk/blob/main/.github/workflows/prod.yaml)

## What to read next?

* [Setup Broken Link Checker for your mkdocs site](../../kb/markdown/lychee-link-checker.md)
