---
reviewdate: '2026-12-20'
title: Import GitHub Organization users in to Terraform
---

## Why

Sometimes you want to manage the GitHub org through Terraform

## How

Make sure to replace `<org name>` with your GitHub organizations name

### Bootstrap the terraform

Create 2 files

```shell
touch {locals,members}.tf
```

In the `locals.tf` file, place the below

```terraform
locals {
  members = {
  }
}
```

And in the `members.tf` file

```terraform
resource "github_membership" "<org name>" {
  for_each = local.members
  username = each.key
  role     = each.value
}
```

### List the users in the org

Running the below with the GitHub CLI will give you a list of users in the org

```shell
 gh api \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  /orgs/<your org>/members | jq -r '.[] | .login'
```

Place that in the `members.tf` file, like below

```diff
locals {
  members = {
+  userbradley = "admin",
  }
}
```

!!! note "Admin or member?"
    Depending on the user access a user has in the org, they should be set as `member` or `admin`

    `admin` is `Owner` in the UI

    `member` is `Member` in the UI

### Import users

Run the below

```shell
gh api \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  /orgs/<your org>/members | jq -r '.[] | "terraform import '\''github_membership.<org name>[\"\(.login)\"]'\''  <your org>:\(.login)"'
```

This will give you a list of import commands for these users. Copy and paste the entire block and run them
