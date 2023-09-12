---
title: Terraform lock file update
---

# Terraform lock file update

## What it is

This file is a file that should be committed to git, it helps terraform track the versions of providers and plugins

## What is the issue

Sometimes when moving between say, ARM and Intel, the hashes are different.


## Add new systems

The below adds:

* Arm64
* Amd64
* Darwin64
* _windows_
```shell
terraform providers lock \
  -platform=linux_arm64 \
  -platform=linux_amd64 \
  -platform=darwin_amd64 \
  -platform=windows_amd64
```

## Delete them all together

!!! Note "This is my preferred method"
    If you are version locking your terraform version and provider version the lock file is basically just wasted space in git

```shell
find . -type f -name ".terraform.lock.hcl" | xargs rm
```
