---
reviewdate: '2026-12-20'
title: Set auto remote to true for Git CLI
---

## What

On a new computer of first time using git, if you want to push to another branch other than main, you need to
specify that branch with `--set-upstream`

An example of this error is

```shell
$ git commit blake2.cpp -m "Add workaround for missing _mm_set_epi64x"
[solaris 7ad22ff] Add workaround for missing _mm_set_epi64x
 1 file changed, 5 insertions(+)
$ git push
fatal: The current branch solaris has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin solaris
```

## Solution

This enables it for your global git config

```shell
git config --global --type bool push.autoSetupRemote true
```
