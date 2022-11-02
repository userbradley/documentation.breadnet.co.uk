---
title: Your Xcode is too outdated.
---

# Your Xcode is too outdated.

## Why

This is an error that comes up after a major upgrade 

You will see the below error 


```text
Error: Your Xcode (14.0.1) is too outdated.
Please update to Xcode 14.1 (or delete it).
Xcode can be updated from the App Store.

Error: Your Command Line Tools (CLT) does not support macOS 13.
It is either outdated or was modified.
Please update your Command Line Tools (CLT) or delete it if no updates are available.
Update them from Software Update in System Preferences.

If that doesn't show you any updates, run:
  sudo rm -rf /Library/Developer/CommandLineTools
  sudo xcode-select --install

Alternatively, manually download them from:
  https://developer.apple.com/download/all/.
You should download the Command Line Tools for Xcode 14.1.
```

## How to fix

### System Preferences

??? note "What to do if there's no updates"
    Continue to [Command line fix](#command-line-fix)

1. Open System preferences on the Mac
2. Go to `Software update`
3. Check for Updates
4. Install Updates


### Command Line fix

```shell
sudo rm -rf /Library/Developer/CommandLineTools
sudo xcode-select --install
```

A pop-up should display like the below

![xcode-select](../../assets/xcode-select.png)

Click `install` then 3 finger swipe up and click it again.

It should display the below now

![img_1.png](../../assets/xcode-select-tos.png)

## Still getting the error

Open `xcode` and check the version:

1. Open `xcode` 
2. Click `Xcode` on the top bar
3. Click `about Xcode`

If the version is not the latest version (`14.1` at time of writing) - You will need to do the below

### Update Command line tools for xcode

Open terminal

```shell
 softwareupdate --list
```

This should _hoprefully_ show the below

```text
➜ softwareupdate --list
Software Update Tool

Finding available software
Software Update found the following new or updated software:
* Label: Command Line Tools for Xcode-14.0
        Title: Command Line Tools for Xcode, Version: 14.0, Size: 687109KiB, Recommended: YES, 
```

Upgrade it with:

```shell
softwareupdate --install --all
```


## Still not working

If it's still not working, move `xcode` to trash, reboot and re-install it

## Possible side effects

### XCRUN

XCRUN may become unavailable during the installation

![img_2.png](../../assets/xcrun-xcode-select.png)

Do not worry, it will come back once it's installed

## What to read next

[xcrun error: invalid active path](xcrun-error-invalid-active-developer-path.md)


