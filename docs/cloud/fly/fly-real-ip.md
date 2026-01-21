---
reviewdate: '2026-12-20'
title: Get the Real IP address from fly when behind cloudflare
---

!!! warning "A note on this KB"
    You should only use this page if you are using *both* cloudflare *proxy* and fly.io

## Why

It's not really needed too much on the Fly side, it's more *a nice to have*.

We have this *issue* when you put an instance behind Cloudflare and enable the proxy, you don't get the Real IP address of the
device connecting, you get the Cloudflare exit node IP

```shell
2022-11-16T18:26:07Z app[de9671a1] lhr [info]172.19.2.81 - - [16/Nov/2022:18:26:07 +0000] "GET /search/search_index.json HTTP/1.1" 200 437657 "https://dev-documentation.breadnet.co.uk/" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36" "2.24.11.40, 149.248.195.56"
2022-11-16T18:26:16Z app[de9671a1] lhr [info]172.19.2.81 - - [16/Nov/2022:18:26:16 +0000] "GET /cloud/aqua/aqua-page-2/ HTTP/1.1" 200 95930 "https://dev-documentation.breadnet.co.uk/" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36" "2.24.11.40, 149.248.195.56"
```

## Solution

You will need to navigate to both the links below and grab the up-to-date IP's

* [CF V4](https://www.cloudflare.com/ips-v4)
* [CF V6](https://www.cloudflare.com/ips-v6)

Once located, create a new file and put the IP's in the below format

```shell
set_real_ip_from 173.245.48.0/20;
```

At the top of the file, add the below

```shell
real_ip_recursive on;
real_ip_header CF-Connecting-IP;

## Fly Internal IP
set_real_ip_from 172.19.0.0/16;
```

## Example

* [My Nginx config](https://github.com/userbradley/documentation.breadnet.co.uk/blob/main/nginx.conf)
* [Cloudflare IP list](https://github.com/userbradley/documentation.breadnet.co.uk/blob/main/cloudflare.conf)
