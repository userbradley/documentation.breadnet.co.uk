---
title: Fly CI
---

# Fly CI

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

You need to have installed:

* Curl




