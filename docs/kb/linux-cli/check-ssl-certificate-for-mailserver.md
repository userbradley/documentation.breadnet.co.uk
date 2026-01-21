---
reviewdate: '2026-12-20'
title: Check SSL certificate for Mail server
---

## Why

When troubleshooting Mail issues, or setting up [MTA-STS](../../security/on-dmarc-red-sift/setup-mta-sts-using-on-dmarc.md) it's useful
to know if you've got SSL on your server, or what the certificate is

## How

### SMTP

```shell
openssl s_client -connect <mail server>:25 -starttls smtp
```

### SMTPS

```shell
openssl s_client -connect <mail server>:465
```
