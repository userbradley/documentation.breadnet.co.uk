---
title: Set grocy to use pritunl Zero usernames
---

# Set grocy to use pritunl Zero usernames

## Why

Grocy allows you to set a username field passed as a header from a reverse proxy.

This makes it easier to provision users and not mess about with creating users in 2 places.

## How

Firstly we need to find the headers that it passes.

Luckily I have done this already in [Pritunl Forwarded Headers](../pritunl/pritunl-forwarded-header.md)

The Header we need is:

* `X-Forwarded-User`

## Configure Grocy

Open the `config.php` file located in `config/data/config.php`

Edit the line:

`79` and `82`

Update them to the below:

```injectablephp
// Either "Grocy\Middleware\DefaultAuthMiddleware", "Grocy\Middleware\ReverseProxyAuthMiddleware"
// or any class that implements Grocy\Middleware\AuthMiddleware
Setting('AUTH_CLASS', 'Grocy\Middleware\ReverseProxyAuthMiddleware');

// Options when using ReverseProxyAuthMiddleware
Setting('REVERSE_PROXY_AUTH_HEADER', 'X-Forwarded-User'); // The name of the HTTP header which your reverse proxy uses to pass the username (on successful authentication)
```

## Create users in Pritunl

Now you need to creat a user in Pritunl.
