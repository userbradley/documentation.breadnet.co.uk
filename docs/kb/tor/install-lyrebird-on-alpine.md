---
title: Install lyrebird on Alpine
---

## What

!!! obfs4proxy
    Tor has renamed `obfs4proxy` to `lyrebird` if I am not mistaken

[Lyrebird](https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/lyrebird)
is the name of Tor's obfs4proxy that implements several
[pluggable transport](https://support.torproject.org/glossary/pluggable-transports/)
protocols, including obfs4, meek, Snowflake and WebTunnel.
In Tor Browser, it also implements the feature to [request bridges](https://tb-manual.torproject.org/bridges/)
and the circumvention API for Connection Assist.

## How

```shell
apk add tor lyrebird --update-cache --repository http://dl-4.alpinelinux.org/alpine/edge/community/ --allow-untrusted
```
