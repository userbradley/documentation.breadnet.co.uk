---
title: Create new Fly.io app
---

# Create new Fly.io app

## Create the app

```shell
fly app create <name>
```

## Save the config

```shell
fly config save -a <name>
```

This will then save a file called `fly.toml`

You can rename this, provided the fact that when ever you run `fly` ensure you specify the config file
