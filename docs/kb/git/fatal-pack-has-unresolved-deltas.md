---
title: "fatal: pack has unresolved deltas"
---

## What

In Git, a pack (also called a packfile) is a compressed storage format that Git uses to efficiently store objects (commits, trees, blobs, and tags).

If you try and manually delete the file, you get the error

```text
fatal: pack has unresolved deltas
```

## How to resolve

```shell
mv .git .git-old
git init
git remote add origin <repo url>
git fetch
git reset origin/main --mixed
git branch --set-upstream-to=origin/main main
```

If you have `pre-commit` configured, re-install it

```shell
pre-commit install
```
