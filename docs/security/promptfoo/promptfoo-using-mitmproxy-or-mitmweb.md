---
reviewdate: '2026-12-20'
title: Promptfoo using Mitmproxy or mitmweb
---

## What

If you wish to MITM the requests being made from [Promptfoo](https://www.promptfoo.dev/docs/intro/), you are able to by setting up a mitm proxy.

This example uses [`mitmproxy`](https://www.mitmproxy.org), specifically `mitmweb` which presents you with a web interface

## Setup Promptfoo

From the directory you wish to run the `promptfoo` cli from, you require the below environment variables

* `PROMPTFOO_CA_CERT_PATH`
* `HTTPS_PROXY`

```shell
export PROMPTFOO_CA_CERT_PATH=~/.mitmproxy/mitmproxy-ca-cert.pem
export HTTPS_PROXY=http://127.0.0.1:8080/
```

You can then run the `promptfoo` CLI
