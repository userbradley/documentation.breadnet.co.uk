---
reviewdate: '2026-12-20'
title: Recursive delete of .terraform directory
---

## What

Sometimes your file system can collect a lot of `.terraform` directories, or something just isn't right with terraform

## How

```shell
find ./ -type d -name ".terraform" -exec rm -rf {} +
```

### Tip of the day

You can set up a `zsh` or `bash` alias for this

Edit `~/.zshrc` and add the below

```
alias tdel='find ./ -type d -name ".terraform" -exec rm -rf {} +'
```

Then run `source ~/.zshrc` to refresh your current session

Now you can simply type `tdel` anywhere and it will delete `.terraform` directories

## Read next

* [Recursive delete of `.terragrunt-cache` directory](../terragrunt/recursive-delete-of-terragrunt-cache.md)
* [Recursive delete of `.terraform.lock.hcl`](recursive-delete-of-terraform-lock-hcl.md)
