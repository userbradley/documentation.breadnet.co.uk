---
title: "command not found: compdef"
---

## What

This is an error you will see when running `source ~/.zshrc` after installing zsh autocomplete

```shell
➜ source ~/.zshrc
/dev/fd/13:2: command not found: compdef
/dev/fd/13:213: command not found: compdef
```

## Solution

Edit your `.zshrc` file and put the below in at the top

```shell
autoload -Uz compinit
compinit
```

