---
title: Creating a helm chart
---

## Pre-requisites

1. `helm`

### Installing Helm

=== "Brew"

    ```shell
    brew install helm
    ```
=== "One liner"

    ```shell
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
    ```

=== "Other"

    See [Installing Helm](https://helm.sh/docs/intro/install/)

## Create a helm chart

=== "Simple way"

    ```shell
    helm create <name>
    ```

=== "Using name of current folder"

    ```shell
    helm create $(basename $(pwd))
    ```
