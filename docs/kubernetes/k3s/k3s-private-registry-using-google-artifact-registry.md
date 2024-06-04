---
title: K3s private registry using Google Artifact Registry
---

# K3s private registry using Google Artifact Registry

## Why

Sometimes you want to run OCI containers from a private registry, and you use Google Artifact Registry.

## How

1. Create a Service account in the Google Cloud IAM
2. Assign that Service account permissions to pull images
3. Create a Service account key for the Service account

### Format the key file

You need to format the keyfile so that it is all one line.

```shell
cat <keyfile-name>.json | tr -d '\n'
```

Example below

=== "Before"

    ```json
    {
      "type": "service_account",
      "project_id": "redacted",
      "private_key_id": "redacted",
      "private_key": "-----BEGIN PRIVATE KEY-----\nredacted\n-----END PRIVATE KEY-----\n",
      "client_email": "k3s-container-puller@redacted.iam.gserviceaccount.com",
      "client_id": "redacted",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/k3s-container-puller%40redacted.iam.gserviceaccount.com"
    }
    ```

=== "After"

    ```json
    { "type": "service_account", "project_id": "redacted",  "private_key_id": "redacted",  "private_key": "-----BEGIN PRIVATE KEY-----\nredacted\n-----END PRIVATE KEY-----\n",  "client_email": "k3s-container-puller@redacted.iam.gserviceaccount.com",  "client_id": "redacted",  "auth_uri": "https://accounts.google.com/o/oauth2/auth",  "token_uri": "https://oauth2.googleapis.com/token",  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/k3s-container-puller%40redacted.iam.gserviceaccount.com"}
    ```

### Create the file

!!! note "Pay special attention to the password"
    Ensure that you encapsulate the _password_ with `'` or you will get an error

!!! note "ensure that the username be set as "_json_key" string and not the "Key" value provided by gcp

```yaml
# registries.yaml
mirrors:
  europe-west2-docker.pkg.dev:
    endpoint:
      - "https://europe-west2-docker.pkg.dev"
configs:
  europe-west2-docker.pkg.dev:
    auth:
      username: _json_key
      password: '{ "type": "service_account", "project_id": "redacted",  "private_key_id": "redacted",  "private_key": "-----BEGIN PRIVATE KEY-----\nredacted\n-----END PRIVATE KEY-----\n",  "client_email": "k3s-container-puller@redacted.iam.gserviceaccount.com",  "client_id": "redacted",  "auth_uri": "https://accounts.google.com/o/oauth2/auth",  "token_uri": "https://oauth2.googleapis.com/token",  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/k3s-container-puller%40redacted.iam.gserviceaccount.com"}'
```

Name this `registries.yaml`

Copy this file to **all workers** (and servers if pods can be scheduled on them)

Create the file in `/etc/rancher/k3s/`

```shell
touch /etc/rancher/k3s/registries.yaml
```

!!! note "File name"
    The file name **must** be `/etc/rancher/k3s/registries.yaml` otherwise you will get errors

### Restart k3s

```shell
systemctl restart k3s
```

## Troubleshooting

If you get any errors, run `k3s server` in any CLI on the server, and observe the outputs there

### Unmarshalling error

```text
INFO[0000] Module overlay was already loaded
INFO[0000] Module nf_conntrack was already loaded
INFO[0000] Module br_netfilter was already loaded
INFO[0000] Module iptable_nat was already loaded
INFO[0000] Module iptable_filter was already loaded
INFO[0000] Using private registry config file at /etc/rancher/k3s/registries.yaml
FATA[0000] yaml: unmarshal errors:
line 9: cannot unmarshal !!map into string
```

Ensure that you surround the json line with `'`
