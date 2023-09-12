---
title: Bulk retag
reviewdate: '2022-01-01'
---


This page is now _superseded_ by [Copy images between repositories](copy-containers-between-repos.md)

```bash
docker images <old repo> --filter "since=<old repo>"  --format "docker tag {{.Repository}}:{{.Tag}} <new repo>:{{.Tag}} | docker push <new repo>:{{.Tag}}" | bash
```
