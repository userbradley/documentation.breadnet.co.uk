---
reviewdate: '2026-12-20'
title: Switch AWS profiles Easily
---

## Why

When you use AWS Identity Centre, you have multiple roles for multiple accounts, so your list of profiles gets hard to remember

## How

Add the below to your `~/.zshrc`

```shell
alias awsctx="export AWS_PROFILE=\$(aws configure list-profiles | fzf --prompt \"Pick your AWS Profile:\")"
```

!!! note "fzf"
    Ensure you have `fzf` installed

    ```shell
    brew install fzf
    ```

You can then use to select your profile by running

```shell
awsctx
```
