---
title: "Terraform plugin: Cannot locate module locally, unknown reason"
---

Terraform changed how they structure modules in the config fie

So previously a module would look like this:

```terraform
module "cloudrun-binding" {
  source  = "git::ssh://git@github.com/userbradley/terraform-module-google-iam-binding.git//serviceaccount?ref=2022.03.08"
  email   = google_service_account.cloudrun.email
  project = var.project
  role    = google_project_iam_custom_role.cloudrun.role_id
}
```
We get the error 

```
Terraform plugin: Cannot locate module locally, unknown reason
```

To resolve this, change the format to:

```terraform
source = "git::ssh://git@github.com/userbradley/terraform-module-google-iam-binding.git?ref=2022.03.08//serviceaccount"
```

We got this from the modules.json file

![](/assets/x5BORuXlBtctN0Mi-image-1646765189176.png)