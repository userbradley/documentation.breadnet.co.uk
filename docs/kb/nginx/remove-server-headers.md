---
title: Remove server Headers
---

# Remove server Headers

Install Nginx Extras

--8<-- "docs/kb/nginx/nginx-extras.md"

Add below

```shell
server_tokens off;
more_set_headers "Server: gws"; # (1)!
```

1. Set's the server header to `Google web server`
