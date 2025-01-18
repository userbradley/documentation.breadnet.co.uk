---
title: The following signatures couldn't be verified because the public key is not available
---

I got this error when installing Unifi

``` yaml
root@unifi-01:~# sudo apt-get update

Err:5 https://dl.ubnt.com/unifi/debian stable InRelease
  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 06E85760C0A52C50 # (1)
Reading package lists... Done
W: GPG error: https://dl.ubnt.com/unifi/debian stable InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 06E85760C0A52C50
E: The repository 'https://www.ui.com/downloads/unifi/debian stable InRelease' is not signed.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
```

1. This is the line we need to take note of

Specifically the line

```
The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 06E85760C0A52C50
```

## What's the issue?

The Key was requested, but could not be found on the system.

## Solution

Make a note of the `keyID` we need - This is the section after `NO_PUBKEY`

```text
NO_PUBKEY 06E85760C0A52C50
```

Run the below to pull the keys from `keyserver.ubuntu.com`

```shell
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 06E85760C0A52C50
```

!!! tip
    Replace the key with the one that has errored for you
