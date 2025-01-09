---
title: "xcrun: error: invalid active developer path"
---

## What this is

This is an issue after an update on a Mac from one version to next **Major** version.

In my case it was from `Monterey 12.6.1` to `Ventura Version 13.0`

## How to resolve

### Install xcode

```shell
xcode-select --install
```

!!! info "If you can't click install"

    Sometimes the `TOS` box does not display, so pan out (3 finger swipte up) and you will see it.

Annoyingly the installing box does not fade to the background, and stays in focus the entire time

![](../../assets/xcode.png)

### Still not working

Failing that you can also try the below

```shell
sudo xcode-select --reset
```
