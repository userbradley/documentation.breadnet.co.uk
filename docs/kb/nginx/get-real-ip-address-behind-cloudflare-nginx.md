---
title: Get real IP address behind cloudflare NGINX
---

## Pre requisites

You may need to install the [Real IP Module](http://nginx.org/en/docs/http/ngx_http_realip_module.html) if this is on bare metal

``` shell
apt-get install nginx-extras
```

If you are using containerised Nginx, then it comes pre-installed

## Create cloudflare IP file

Under your `nginx` directory, create a file called `cloudflare.conf`

```shell
touch cloudflare.conf
```

## Edit the cloudflare file

=== "Nano"

    ```shell
    nano cloudflare.conf
    ```

=== "Vim"

    ```shell
    vi cloudflare.conf
    ```

In the window that opened, paste in the below:

??? note "Freshness of the Ranges"
    This range is updated daily when the site is built

```nginx
--8<-- "docs/kb/nginx/cloudflare.conf"
```

This tells nginx that any time it sees one of these IP ranges, it should look at the header `CF-Connecting-IP` that gets sent
and then use that as the connecting IP

## Setting NGINX to use this

For argument’s sake, we will make the below assumptions

- Location of the config file: `/etc/nginx/cloudflare.conf`
- Location of the nginx config we want to fix: `/etc/nginx/bookstack.conf`

We need to edit the config of a site we want to resolve the IP issue to

=== "Nano"

    ```shell
    nano /etc/nginx/bookstack.conf
    ```

=== "Vim"

    ```shell
    vi /etc/nginx/bookstack.conf
    ```

Add the `include` statement in and point it to the full path of the file

```diff
server {

    listen       80;
    listen  [::]:80;

    root /var/www/documentation;
    index  index.html;
+   include /etc/nginx/cloudflare.conf;
}
```

## Check the config is valid

```shell
nginx -t
```

you should see the below

```text
nginx: the configuration file <> syntax is ok
nginx: the configuration file <> test is successful
```

## Restart nginx

```shell
systemctl restart nginx
```
