---
title: Authenticate Twine to Google Artifact Registry
---

## Why

If you work at a company that uses python, there is a high chance that you need to store python packages in a private registry

## How

In order to authenticate to GAR with Twine, we need to do the below

### Install Keyring

=== "pip3"

    ```shell
    pip3 install keyring
    ```

=== "pip"

    ```shell
    pip install keyring
    ```

### Install the Artifact Registry Backend

=== "pip3"

    ```shell
    pip3 install keyrings.google-artifactregistry-auth
    ```
=== "pip"

    ```shell
    pip install keyrings.google-artifactregistry-auth
    ```

### Get the config for your repo

```shell
gcloud artifacts print-settings python \
    --project=<your project goes here> \
    --repository=<repository name goes here> \
    --location=<location goes here>
```

Which will give you something like the below

```text
# Insert the following snippet into your .pypirc

[distutils]
index-servers =
    python-packages

[python-packages]
repository: https://europe-west2-python.pkg.dev/<project>/<repo>/

# Insert the following snippet into your pip.conf

[global]
extra-index-url = https://europe-west2-python.pkg.dev/<project>/<repo>/simple/
```

### Setup your files

The next steps will have you editing files

#### `.pypric`

```text
[distutils]
index-servers =
    < repo name>

[PYTHON-REPO-ID]
repository = https://europe-west2-python.pkg.dev/<project>/<repo>
```

#### Pip config

!!! note "There are multiple locations for this file"
    You should run `pip config debug` and note the files that exist

    **Tip**: look for `exists: True`

Using the file that exists, or the one you use, insert the below in to it

```text
global]
extra-index-url = https://europe-west2-python.pkg.dev/<project>/<repo>/simple/
```


### Gcloud auth for good measures

```shell
gcloud auth login
```
