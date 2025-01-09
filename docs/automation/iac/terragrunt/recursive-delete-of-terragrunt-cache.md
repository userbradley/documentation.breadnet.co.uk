---
title: Recursive delete of .terragrunt-cache directory
---

## What

Sometimes your file system can collect alot of `.terragrunt-cache` directories, or something just isn't right with terragrunt

## How

```shell
find ./ -type d -name ".terragrunt-cache" -exec rm -rf {} +
```

### Tip of the day

You can set up a `zsh` or `bash` alias for this

Edit `~/.zshrc` and add the below

```
alias tgdel='find ./ -type d -name ".terragrunt-cache" -exec rm -rf {} +'
```

Then run `source ~/.zshrc` to refresh your current session

Now you can simply type `tgdel` anywhere and it will delete `.terragrunt-cache` directories

## Read next

* [Recursive delete of `.terraform` directory](../terraform/recursive-delete-of-terraform.md)
