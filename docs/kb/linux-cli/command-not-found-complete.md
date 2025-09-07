---
title: "command not found: complete"
---

## When this happens

For example, AWS cli requires `complete` for the completion to work

## Example Error

```shell
/home/gus-the-hamster/: command not found: complete
```

## Resolution

Add the below to your `~/.zshrc`

```shell
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
```
