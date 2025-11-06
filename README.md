# [breadNET Documentation](https://documentation.breadnet.co.uk)

<p align="center">
  <h1 align="center">breadNET Documentation</h1>
  <p align="center">ISSN: 2755-8169</p>
  <p align="center">
    <a href="https://github.com/userbradley/documentation.breadnet.co.uk/actions/workflows/dev.yaml"><img alt="Dev" src="https://github.com/userbradley/documentation.breadnet.co.uk/actions/workflows/dev.yaml/badge.svg"></a>
    <a href="https://github.com/userbradley/documentation.breadnet.co.uk/actions/workflows/prod.yaml"><img alt="Production" src="https://github.com/userbradley/documentation.breadnet.co.uk/actions/workflows/prod.yaml/badge.svg"></a>
    <a href="https://wakatime.com/badge/user/befd4d51-df71-4caa-90ba-09a83c0524b0/project/fa7f3e73-d976-48d9-94f5-a17bd1bb4614"><img alt="Wakatime spent coding" src="https://wakatime.com/badge/user/befd4d51-df71-4caa-90ba-09a83c0524b0/project/fa7f3e73-d976-48d9-94f5-a17bd1bb4614.svg" ></a>
  </p>
</p>

[![Dev](https://github.com/userbradley/documentation.breadnet.co.uk/actions/workflows/dev.yaml/badge.svg)](https://github.com/userbradley/documentation.breadnet.co.uk/actions/workflows/dev.yaml) 
[![Production]()](https://github.com/userbradley/documentation.breadnet.co.uk/actions/workflows/prod.yaml)
[![wakatime](https://wakatime.com/badge/user/befd4d51-df71-4caa-90ba-09a83c0524b0/project/fa7f3e73-d976-48d9-94f5-a17bd1bb4614.svg)](https://wakatime.com/badge/user/befd4d51-df71-4caa-90ba-09a83c0524b0/project/fa7f3e73-d976-48d9-94f5-a17bd1bb4614)

This repo houses all the public documentation that I have created over the years, recently migrated to mkdocs

You can access it at [documentation.breadnet.co.uk](https://documentation.breadnet.co.uk)

## What is the tech stack

This site runs on [fly.io](https://fly.io?ref=documentation.breadnet.co.uk) and is built using GitHub actions

## Why mkdocs

I used to run Bookstack for my documentation when I used to live at my parents house (because electricity was basically free)
but since moving out I was unable to take my 48U server rack with me. Thanks Tory Government.

Mkdocs is simple and flexible where I need it to be, but has very little attack surface.

In fact, [if you can breach the website and prove a reverse shell I will pay you.](SECURITY.md)

Mkdocs uses markdown files making it easy to use, as most engineers know how to write markdown

## Why Migrate

I used to run bookstack, but since moving I found it was becoming annoying to run and maintain the server. MKdocs runs as a docker
container on anywhere that runs docker, or allows static content to be hosted.

## How to Contribute

If you see an issue with a page or something isn't right, please contribute changes back.

You can also [message me on matrix](https://matrix.to/#/#documentation-general:breadnet.co.uk) if you spot an issue

### Software you need installed to contribute

1. Podman or Docker
2. Pre-commit

Make a fork of this repo to your account, make the changes then run the below

```shell
podman-compose up
```

Or if you are using Docker:

```shell
docker compose up
```

Navigate to [http://localhost:8080](http://localhost:8080) where you will see the site rendered.

### Pre commit

We use pre-commit on this repo to keep bad things out

```shell
task pre-commit-install
```

This will install the pre-commit hooks on this repo, as well as run pre-commit on the files.

### I want to run `mkdocs` locally

```shell
python3 -m venv .venv
source .venv/bin/activate
pip3 install -r requirements.txt
brew install cairo freetype libffi libjpeg libpng zlib pngquant
```

The first time you run this, it will be super slow and can take upwards of 40 seconds to build. This is because it
populates the `.cache` dir with all the social images and Fonts.

## CI

This repo uses a fair bit of CI for a simple site

Below takes you through the actions that run when you open a Pull request

### Auto Assign

This action will automatically set the user who created the PR as the assignee and then set [@userbradley](https://github.com/userbradley) as the reviewer

### Dev

This action will build the site and deploy it to my Fly account. Nothing special is done here

### Pre Commit

This runs the pre-commit on the changes, and will error if there is something wrong.

### Trufflehog Secret scanner

Checks you've not accidentally commited a secret in to the repo!

### Production

This action runs only on commits to `main` (eg: through a Pull request)

The action will deploy the site to my Fly account under the `documentation.breadnet.co.uk` domain

## Uptime

[Status Page](https://status.breadinfra.net/endpoints/public-sites_production-documentation)
_Note: You won't be able to access this site if you do not have an approved email address_

This site is hosted on Fly and has a system in place to promote changes from Development to Production, meaning something
would have had to go **really** wrong for the site to not be online

Eventually I will create an archive of this site as a Google storage object that you can download, but until then if it goes down then
just suffer.

From the migration, the URl changed.  `bookstack.breadnet.co.uk` will redirect to `documentation.breadnet.co.uk`, and all
pages that were originally on `bookstack` should now redirect to a page on mkdocs. see [redirect.conf](redirect.conf) for pages

## Branching Strategy

### main

This is the main branch of the site and repo, which holds the live site that you can access.

The Dev build must pass, and you require approval before merging in to main is allowed

### feat/**

The site is built off any Pull requests that touch the below files.

```yaml
- docs/**
- .github/workflows/dev.yaml
- overrides/**
- mkdocs.yml
- dev-robots.txt
- .htpasswd
- dev.Dockerfile
- cloudflare.conf
- deny.conf
- dev-nginx.conf
- dev.toml
```

Please use `feat/**` as your branch name when contributing changes
