---
title: Wildcard Certificates
---

```shell
certbot certonly \
--manual  \
--preferred-challenges=dns   \
--email legal@breadnet.co.uk   \
--server https://acme-v02.api.letsencrypt.org/directory  \
--agree-tos   \
--manual-public-ip-logging-ok   \
-d *.example.com
```