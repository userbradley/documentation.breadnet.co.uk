---
title: Ignore terraform module version dependabot
---

## Why

I've had an issue recently where we need to update a module, and it introduces a breaking change that we dont want to put through CI, or we are happy with a specific version.

## How

!!! note "This is only tested for Modules stored on GitHub"
    If you are storing them somewhere else you will need to check the logs

### All modules invocations

The below will locate all the modules, and not try update them to version `4.0.0`

```yaml
version: 2

updates:
# Terraform - One entry per thing we want to scan as per https://github.com/dependabot/dependabot-core/issues/649
  - package-ecosystem: "terraform"
    directory: "/terraform/platform/terraform-state"
    open-pull-requests-limit: 100
    schedule:
      interval: "weekly"
    ignore:
      - dependency-name: "*::github::userbradley/module*"
        versions:
          - 4.0.0
```

### Do not upgrade specific version to specific version

We are able to get a little smart and prevent Dependabot from updating specific version to a specific version

The below will now stop the module with the version `3.0.0` from being upgraded to version `4.0.0`
```yaml
version: 2

updates:
# Terraform - One entry per thing we want to scan as per https://github.com/dependabot/dependabot-core/issues/649

  - package-ecosystem: "terraform"
    directory: "/terraform/platform/terraform-state"
    open-pull-requests-limit: 100
    schedule:
      interval: "weekly"
    ignore:
      - dependency-name: "*::github::userbradley/module::3.0.0"
        versions:
          - 4.0.0
```

## FAQ

### Naming of the dependency

Why is it `*::github::userbradley/module*`?

Checking the logs for the Dependabot, this is what it was being referenced at, and was the only way I could get it to actually ignore the module.

If we use the example below:

**Repo Name**: `exampleorg/module-of-modules`

We would then set `dependency-name` to `"*::github::exampleorg/module-of-modules*"`
