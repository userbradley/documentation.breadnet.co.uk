---
title: Get the real IP address from Cloudflare
---

# Get the real IP address from Cloudflare

## Pre requisites

You may need to install the [Real IP Module](http://nginx.org/en/docs/http/ngx_http_realip_module.html) if this is on bare metal

--8<-- "docs/kb/nginx/nginx-extras.md"

If you are using docker, then it's installed from the get go!

## Create cloudflare IP file

Depending on what system you are using, this location may change.

On most installs the file is created in `/etc/nginx` so we will do that here.

```shell
cd /etc/nginx
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



In the window that opened, paste in the below

```nginx
real_ip_recursive on;
real_ip_header CF-Connecting-IP;

#v4
set_real_ip_from 173.245.48.0/20;
set_real_ip_from 103.21.244.0/22;
set_real_ip_from 103.22.200.0/22;
set_real_ip_from 103.31.4.0/22;
set_real_ip_from 141.101.64.0/18;
set_real_ip_from 108.162.192.0/18;
set_real_ip_from 190.93.240.0/20;
set_real_ip_from 188.114.96.0/20;
set_real_ip_from 197.234.240.0/22;
set_real_ip_from 198.41.128.0/17;
set_real_ip_from 162.158.0.0/15;
set_real_ip_from 104.16.0.0/13;
set_real_ip_from 104.24.0.0/14;
set_real_ip_from 172.64.0.0/13;
set_real_ip_from 131.0.72.0/22;

# V6
set_real_ip_from 2400:cb00::/32;
set_real_ip_from 2606:4700::/32;
set_real_ip_from 2803:f800::/32;
set_real_ip_from 2405:b500::/32;
set_real_ip_from 2405:8100::/32;
set_real_ip_from 2a06:98c0::/29;
set_real_ip_from 2c0f:f248::/32;
```

??? question "What does this do"
    This tells nginx that any time it sees one of these IP ranges, it should look at the header `CF-Connecting-IP` that gets sent
    and then use that as the connecting IP

## using this file in nginx

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

Your config file should look something like the below

```nginx
server {

    listen       80;
    listen  [::]:80;

    root /var/www/documentation;
    index  index.html;
}
```

We then need to tell nginx to **include** another config file with the include clause

```nginx
include /etc/nginx/cloudflare.conf;
```


So now our file looks like the below

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
