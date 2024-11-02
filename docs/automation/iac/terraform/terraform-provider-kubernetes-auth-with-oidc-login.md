---
title: Terraform Provider for Kubernetes authenticate with `oidc-login`
---

## What

If you use the `oidc-login` tool to authenticate to your cluster, you may have issues when it comes to using the terraform
provider for Kubernetes. This boils down to not wanting to use the root certificates

## How

Firstly, copy the value of `certificate-authority-data` under your `kubeconfig` for the cluster you want to use

```yaml
apiVersion: v1
clusters:
  - cluster:
      certificate-authority-data: ""
```

### Terraform config

1. Update `cluster_ca_certificate` to be the copy and pasted from the above. Ensure this is base64 decoded. You can also use a variable or file
2. Update `oidc-issuer-url` to the issuer of your `oidc` issuer. 
3. Update `oidc-client-id` to the OIDC client ID from your OIDC issuer
4. Update `oidc-client-secret` to the Secret from your OIDC issuer

Depending on your issuer and how you've configured your cluster, you may want to add as many or as little `oidc-extra-scope`'s 

```terraform
provider "kubernetes" {
  host                   = "https://172.16.2.0:6443"
  cluster_ca_certificate = base64decode("")
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command = "kubectl"
    args = [
      "oidc-login",
      "get-token",
      "--oidc-issuer-url=<>/",
      "--oidc-client-id=<>",
      "--oidc-client-secret=<>",
      "--oidc-extra-scope=groups",
      "--oidc-extra-scope=email",
    ]
  }
}
```

??? note "Example using Azure AD (Entra)"

    ```terraform
    provider "kubernetes" {
      host                   = "https://172.16.2.0:6443"
      cluster_ca_certificate = base64decode("<redacted>")
      exec {
        api_version = "client.authentication.k8s.io/v1beta1"
        command = "kubectl"
        args = [
          "oidc-login",
          "get-token",
          "--oidc-issuer-url=https://sts.windows.net/87be2c44-88cf-4eee-84a6-f2f47f2e8131/",
          "--oidc-client-id=36c6496f-3b53-4fea-bbfb-b4a69cccc646",
          "--oidc-client-secret=OAH8Q~tDUjHJK7iubJs16SfBupt2cJiPGZjosd8IVa32",
          "--oidc-extra-scope=groups",
          "--oidc-extra-scope=email",
        ]
      }
    }
    
    ```

## Additional Reading

* [Configure K3s to use Azure Entra](../../../kubernetes/k3s/oidc-azure-ad.md)