---
title: List of headers pritunl Zero sends
---

## Headers

```text
X-Forwarded-For: 172.70.85.89
X-Forwarded-Host: header-test.breadnet.co.uk
X-Forwarded-Port: 443
X-Forwarded-Proto: https
X-Forwarded-User: <username>
```

## Explain

### X-Forwarded-For

The `X-Forwarded-For` (XFF) request header is a de-facto standard header for identifying the originating IP address of a client connecting to a web server through a proxy server.

### X-Forwarded-Host

The `X-Forwarded-Host` (XFH) header is a de-facto standard header for identifying the original host requested by the client in the Host HTTP request header.

### X-Forwarded-Port

Port that the connection came in on

### X-Forwarded-Proto

Name of the protocol that the request came in on

### X-Forwarded-User

Username that logged in to Pritunl
