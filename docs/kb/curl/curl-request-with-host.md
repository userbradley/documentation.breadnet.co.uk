---
title: Curl request with Host Header
---

## Why

Sometimes when you're testing NGINX or a WAF, you won't have a DNS record set up for it yet, so can't get to the virtual host.

## How

Below is an example making a curl request to an IP address with the Host being `not.relevant-land.fyi`

```shell
curl --header 'Host: not.relevant-land.fyi' http://172.16.0.1
```
