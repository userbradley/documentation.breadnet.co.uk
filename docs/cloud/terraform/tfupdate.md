---
title: Tfupdate
---

# Tfupdate

## Update terraform version

```shell
tfupdate terraform -r ./
```

## Update `google`

```shell
tfupdate provider -r google ./
```

## Update `google-beta`

```shell
tfupdate provider -r google-beta ./
```

## Print the latest version of `google` to stdout

```shell
tfupdate release latest terraform-providers/terraform-provider-google
```

## Update google using revision versioning

```shell
tfupdate provider google -v ">= $(tfupdate release latest terraform-providers/terraform-provider-google)" -r ./
```

## Update google-beta using revision versioning

```shell
tfupdate provider google-beta -v ">= $(tfupdate release latest terraform-providers/terraform-provider-google-beta)" -r ./
```

## Update terraform using revision versioning

```shell
tfupdate terraform -v ">= $(tfupdate release latest hashicorp/terraform)" -r ./
```

## Resources

[Github](https://github.com/minamijoyo/tfupdate)