---
title: Set Grocy to use Cloudflare Zero trust usernames
---


## Why

Grocy allows you to set a username field passed as a header from a reverse proxy.

This makes it easier to provision users and not mess about with creating users in 2 places.

## How

Firstly we need to find the headers that it passes.

The Header we need is:

* `Cf-Access-Authenticated-User-Email`

## Configure Grocy

Open the `config.php` file located in `config/data/config.php`

Update the below options

```injectablephp
Setting('AUTH_CLASS', 'Grocy\Middleware\ReverseProxyAuthMiddleware');
Setting('REVERSE_PROXY_AUTH_HEADER', 'Cf-Access-Authenticated-User-Email'); // The name of the HTTP header which your reverse proxy uses to pass the username (on successful authentication)
```

When you put Grocy behind Cloudflare Zero, users will automatically be logged in based on their authentication email address
