---
title: Tfupdate
---

```shell
tfupdate terraform -r ./
```

```shell
tfupdate provider -r google-beta ./
```

```shell
tfupdate provider -r google-beta ./
```

```shell
tfupdate release latest terraform-providers/terraform-provider-google
```

```shell
tfupdate provider google-beta -v ">= $(tfupdate release latest terraform-providers/terraform-provider-google)" -r ./
```

```shell
tfupdate terraform -v ">= $(tfupdate release latest hashicorp/terraform)" -r ./
```

## Resources

[Github](https://github.com/minamijoyo/tfupdate)