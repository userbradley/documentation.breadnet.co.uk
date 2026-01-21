---
reviewdate: '2026-12-20'
title: Useful git aliases
---

## Why

I often mistype things when doing git operations. Think `git pus` instead of `git push` etc

## Aliases

### Rename branch

```shell
git config --global alias.rename 'branch -m'
```

Used by

```shell
git rename feat/1234
```

## Typo Fixers

```shell
git config --global alias.ad 'add'
git config --global alias.pus 'push'
```
