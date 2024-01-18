---
title: Rename local git branch
---

## How

```shell
git branch -m <new name>
```

## Create an alias

```shell
git config --global alias.rename 'branch -m'
```

Now you can run `git rename <new name>`
