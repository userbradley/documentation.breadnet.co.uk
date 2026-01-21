---
reviewdate: '2026-12-20'
title: Set git username and email per repo
---

## Why

When doing dev work for your own personal repos on your work computer, you are logged in as a work user.
This then causes stuff to show up badly.

## Fix it

### Git commands

Navigate to your repo you wish to change

Run the below

```shell
git config user.name "<name>"
git config user.email "<email>"

```

Or you can edit the config file, like below:

### Edit `.git/config`

```text
[user]
    name = <your name>
    email = <your work email>

```
