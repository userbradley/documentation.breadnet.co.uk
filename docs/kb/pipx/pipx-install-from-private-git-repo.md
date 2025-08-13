---
title: pipx install from private Git repo
---

## Why

If you are developing an internal application in Python, you want to make it easy for users to install it, or the instructions
for the application say to git clone the repo and then install.

## How

The below requires you've got SSH access to the git repo in question:

```shell
pipx install git+ssh://git@gitlab.com/repo/name/thing
```

### What about specific tags?

```shell
pipx install git+ssh://git@gitlab.com/repo/name/thing@v1.15.0
```
