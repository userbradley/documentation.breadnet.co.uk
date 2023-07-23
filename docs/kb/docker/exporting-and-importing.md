---
title: Exporting and importing Docker Images
reviewdate: '2022-01-01'
---

Sometimes you will need to export an image as a zip file because you cant commit it to a repo

```shell
docker export <image>:<tag> -o <image>.zip
```

Copy the file where ever you need it to be done

When importing it doesn't pull over the run command, just the file system.

We need to import it differently

```shell
docker import \                       
--change 'CMD ["command", "goes", "here"]' \
<file>.zip <image>:<tag>
```

if you're still having issues, try

```shell
docker load < <file>.zip
```
