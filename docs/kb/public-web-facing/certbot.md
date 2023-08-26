---
title: certbot
reviewdate: '2022-01-01'
---

Installing certbot

```shell
sudo apt-get install certbot -y
```

Getting a cert (no `apache`/ `ngix` config)

```shell
certbot -d <domain> --manual --preferred-challenges dns certonly --staple-ocsp -m legal@breadnet.co.uk --agree-tos
```


To get a certificate for nginx
```shell
sudo certbot --nginx -d example.com -d www.example.com
```
