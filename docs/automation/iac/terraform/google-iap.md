---
title: Google IAP
---

# Google IAP

## Get the brands available

```shell
gcloud alpha iap oauth-brands list --project=<>
```

## Create terraform

```terraform
resource "google_iap_brand" "thing" {
  support_email     = "bradley@breadnet.co.uk"
  application_title = "Cloud IAP protected Application"
  project           = var.project
}
```

## Import

```terraform
terraform import google_iap_brand.thing <name from previous command>
```


## Resources

[Issue 6704](https://github.com/hashicorp/terraform-provider-google/issues/6074#issuecomment-635495412)
