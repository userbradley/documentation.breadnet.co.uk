---
title: Git with different SSH keys
---

# Git with different SSH keys

## Why

I volunteer for scouts (which use bitbucket) and have a day job (which use bitbucket)

The issue is that I have my laptop SSH keys added to my work account, but to be able to git clone the repos on the scouts account,
would have to add different keys.

You would think I could set up an SSH config, but the domains are both `git@bitbucket.org`

## Solution

### Create SSH keys

Create `ssh` keys for this

Call the keys `scouts-bitbucket` or anything else

```shell
ssh-keygen -t ed25519
```

### env variable

either add to your `.envrc` or in your local window paste the below

```shell
export GIT_SSH_COMMAND="ssh -i ~/.ssh/scouts-bitbucket -o IdentitiesOnly=yes"
```

### Add the public key to BitBucket

```shell
cat ~/.ssh/scouts-bitbucket | pbcopy
```
