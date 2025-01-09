---
title: nginx redirects to the first alphabetical site when not found in config
---

!!! Note "This is expected"

    This is expected behaviour of nginx, and when you think about it, it makes sense.

    If you point a DNS entry towards the server that it does not recognise, it will send it to the first page it has, and when there is no
    site sepcified as default, it falls back to alphabetical.

This is a weird thing I saw when I was migrating sites.

1. Move DNS from old server to new server
2. Forget to create site
3. Browse to URL
4. Sends traffic to `anal.breadnet.co.uk` (filename `anal.breadnet.co.uk`)

When I changed another site to be `aa-<>` it sent it to that site.

What seems to be happening is that a site is elected as default, based on alphabetical order in the sites
enabled directory.

## How to fix

Create a site called `default`

```nginx
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    listen 443 default_server ssl;
    listen [::]:443 default_server ssl;
    return 444; # silently drop the connection
    # or you can define some landing page here
}
```

This will return a `444`

??? info "What is http:444"

    ![http 444](https://http.cat/444)

Enable the site by creating a symbolic link (`ln -s`)

## Additional Resources

[Nginx doesnt listen on port 80 twice](https://stackoverflow.com/questions/60362642/nginx-doesnt-listen-on-port-80-twice/60362700#60362700)

[Block access with https ipaddress on nginx](https://stackoverflow.com/questions/69824838/block-access-with-https-ipaddress-on-nginx/69825652#69825652)

[Nginx redirects to the first alphabetical site when not found in config](https://stackoverflow.com/questions/71267882/nginx-redirects-to-the-first-alphabetical-site-when-not-found-in-config)
