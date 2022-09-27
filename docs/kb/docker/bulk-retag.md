---
title: Bulk retag
---

```bash
docker images <old repo> --filter "since=<old repo>"  --format "docker tag {{.Repository}}:{{.Tag}} <new repo>:{{.Tag}} | docker push <new repo>:{{.Tag}}" | bash
```