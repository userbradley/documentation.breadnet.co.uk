---
title: Kubeconform flux files
---

## What

When writing flux config, it's possible that your IDE has no idea about the schema (Looking at you intelliJ) as such, you
may land up committing some real garbage

This all assumes you're using `kustomizations.yaml` to wrap up flux files. If that's not the case, see [native files](#native-files)

## GitHub action

I have written a GitHub action to do this

* @userbradley/action-flux-kustomize-kubeconform

## Tools required

* cURL
* kustomize
* kubeconform

## How

### Download the schemas and package them

```shell
curl -sL https://github.com/fluxcd/flux2/releases/latest/download/crd-schemas.tar.gz | tar zxf - -C /tmp/flux-crd-schemas/master-standalone-strict
```

??? question "why master-standalone-strict?"
    I am not sure, but when running `kubeconform` in verbose mode, it looks for `/tmp/flux-crd-schemas/master-standalone-strict/*.json`

    ```text hl_lines="2 4"
    ➜ cat gotk-sync.yaml| kubeconform "-strict" "-schema-location" "/tmp/flux-crd-schemas" "-summary" "-verbose" "-output" "pretty" "-exit-on-error" "-debug"
    2024/03/23 12:16:45 using schema found at /tmp/flux-crd-schemas/master-standalone-strict/gitrepository-source-v1.json
    ✔ stdin: GitRepository flux-system is valid
    2024/03/23 12:16:45 using schema found at /tmp/flux-crd-schemas/master-standalone-strict/kustomization-kustomize-v1.json
    ✔ stdin: Kustomization flux-system is valid
    Summary: 2 resources found parsing stdin - Valid: 2, Invalid: 0, Errors: 0, Skipped: 0
    ```

### Kustomize build and validate

=== "Dont fail hard"

    The below will not fail if it finds schemas it doesn't recognise

    ```shell
    kustomize build | kubeconform "-strict" "-ignore-missing-schemas" "-schema-location" "default" "-schema-location" "/tmp/flux-crd-schemas" "-summary" "-verbose" "-output" "pretty"
    ```

=== "Fail hard"


    Below will fail hard if it finds something it doesn't recognize

    ```shell
    kustomize build | kubeconform "-strict" "-schema-location" "/tmp/flux-crd-schemas" "-summary" "-verbose" "-output" "pretty" "-exit-on-error"
    ```

## Native files

If you are not using kustomizations to bundle files, you can use the below

=== "Dont fail hard"

    The below will not fail if it finds schemas it doesn't recognise

    ```shell
    cat *.yaml | kubeconform "-strict" "-ignore-missing-schemas" "-schema-location" "default" "-schema-location" "/tmp/flux-crd-schemas" "-summary" "-verbose" "-output" "pretty"
    ```

=== "Fail hard"


    Below will fail hard if it finds something it doesn't recognize

    ```shell
    cat *.yaml | kubeconform "-strict" "-schema-location" "/tmp/flux-crd-schemas" "-summary" "-verbose" "-output" "pretty" "-exit-on-error"
    ```
