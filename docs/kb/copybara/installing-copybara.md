---
title: Installing Copybara
---

## What is Copybara

Copybara is a tool that what opensourced by google to copy code between public and private repos

## How to install

!!! note "Below assumes you are already in the Bazel repo"
    ```shell
     git clone https://github.com/google/copybara
    ```

```shell
brew install bazelisk
bazel build java/com/google/copybara:copybara_deploy.jar
```
