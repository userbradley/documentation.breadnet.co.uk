---
title: Wiz list terraform provider versions
---

## Why

As Wiz does not use the Hashicorp registry for its provider, not a public git repo we don't get a nice UI to see the versions.

All their docs do not include a version either.

When writing terraform you want to pin the provider version to ensure backwards compatibility etc. It's a best practice

## How

### Using `tfupdate` CLI

!!! note "Relies on the tfupdate command line tool"

    Can be installed from [github.com/minamijoyo/tfupdate](https://github.com/minamijoyo/tfupdate)

#### 1. Set the registry URL

```shell
export TFREGISTRY_BASE_URL="https://tf.app.wiz.io/"
```

#### 2. Query the registry for releases

```shell
tfupdate release list -s tfregistryProvider wizsec/wiz
```

You will then get an output like the below

```text
➜ tfupdate release list -s tfregistryProvider wizsec/wiz
1.28.11229
1.28.11336
1.28.11764
1.28.11875
1.28.12451
1.28.12559
1.28.12840
1.28.13179
1.28.13755
1.28.13893
```

### Using CURL

Terraform registries make use of `/.well-known/terraform.json` endpoints to work out where to access providers and modules

```shell
curl https://tf.app.wiz.io/.well-known/terraform.json | jq
```

We then get an output like

```json
{
  "modules.v1": "/v1/modules/",
  "providers.v1": "/v1/providers/"
}
```

Now we can make a request to the providers endpoint for the provider we want, in this case `wizsec/wiz`

```shell
curl -s https://tf.app.wiz.io/v1/providers/wizsec/wiz/versions | jq
```

We get an output similar to

```json
{
  "versions": [
    {
      "namespace": "wizsec",
      "name": "wiz",
      "version": "1.10.2114",
      "platforms": [
        {
          "os": "darwin",
          "arch": "amd64"
        },
        {
          "os": "darwin",
          "arch": "arm64"
        },
        {
          "os": "linux",
          "arch": "amd64"
        },
        {
          "os": "linux",
          "arch": "arm64"
        },
        {
          "os": "windows",
          "arch": "amd64"
        }
      ]
    },
    ...
  ]
}
```

## Specifying the version in out `providers.tf` file

```terraform
terraform {
  required_providers {
    wiz = {
      source  = "tf.app.wiz.io/wizsec/wiz"
      version = "1.28.13893"
    }
  }
}
```
