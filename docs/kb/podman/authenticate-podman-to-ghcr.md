---
title: Authenticate Podman to GitHub Container Registry
---

## Why

Sometimes you want to push or pull container images from GitHub's container registry

## How

Create a personal access token in GitHub and give it access to:

`read:packages` if you are only pulling images, but if you plan to push and delete then add `write:packages` and `delete:packages`

Export it as an environment variable

```shell
export GHCR_TOKEN=TOKEN
```

### Podman login

```shell
echo $GHCR_TOKEN | podman login ghcr.io -u <gh username> --password-stdin
```

I had an issue where this did not seem to work, so I had to take manual steps

## Doing it our selves

Prepare the token and your username like the below

```text
github_user:token
```

An example would be

```text
userbradley:ghp_sDo2TpI6ONLUYGJH34KPWAq7QIfL0SInIe
```

base64 encode this

```shell
echo "userbradley:ghp_sDo2TpI6ONLUYGJH34KPWAq7QIfL0SInIe" | base64
```

Insert the output in to the config file

Edit `~/.config/containers/auth.json`

```json
{
  "auths": {
    "docker.io": {
      "auth": "dXNlcmJyYWRsZXk6YnJvX3N0b3BfaXQK"
    },
    "ghcr.io": {
      "auth": "dXNlcmJyYWRsZXk6Z2hwX1N0b3BUcnlpbmdUb0ZpbmRNeUNyZWRlbnRpYWxzSG9taWUK"
    }
  }
}
```

Now you should be able to access `ghcr` repos
