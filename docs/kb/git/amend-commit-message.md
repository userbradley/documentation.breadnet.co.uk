---
title: Amend commit message
---

## What

When you type too fast, you may make a mistake on your commit message and want to edit it
before you push it

## How

```shell
git commit --amend
```

This will open a `VI/ Vim` editor where you can make your changes

!!! tip "How to use and exit vim"
    To edit, press `i` then you can type

    [To exit vim](https://www.reddit.com/r/vim/comments/m3zg46/a_memeworthy_compilation_of_images_from_a_group/), press `esc` then type `wq!` and press enter

Once done, you can `git push` as usual
