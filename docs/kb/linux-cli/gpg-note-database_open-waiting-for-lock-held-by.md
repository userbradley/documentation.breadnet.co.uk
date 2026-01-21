---
title: "gpg: Note: database_open waiting for lock (held by)"
reviewdate: '2026-12-20'
---

## What

This error often happens when trying to read keys from GPG or when doing a `git commit` when you've got signing enabled

For example this is the error I got

```text
~ using ☁️  default/
➜ gpg --list-secret-keys --keyid-format=long


gpg: Note: database_open 134217901 waiting for lock (held by 76922) ...
gpg: Note: database_open 134217901 waiting for lock (held by 76922) ...
gpg: Note: database_open 134217901 waiting for lock (held by 76922) ...
gpg: Note: database_open 134217901 waiting for lock (held by 76922) ...
gpg: Note: database_open 134217901 waiting for lock (held by 76922) ...
^C
gpg: signal Interrupt caught ... exiting
```

## Solution

```shell
rm ~/.gnupg/public-keys.d/pubring.db.lock
```

I saw a lot of chatter on the internet about using `ps aux` and all this guff, and none of them worked as well as just
deleting the lock file.

I'm not sure if this has a long-standing effect, but so far no issues.
