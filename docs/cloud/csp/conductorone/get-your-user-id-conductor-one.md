---
title: Get your user ID Conductor One
---

## Why

Some of the Terraform requires you to supply your user ID, and perhaps you want to get users information from the CLI

## How

### Using Cone CLI

```shell
cone whoami -o json | jq ".id"
```

### Using JWT Token

!!! tip "Requires the Cone CLI"
    Also requires `jq` cli

Using this absolute monstrosity of a shell command

```shell
cone token -o json | jq ".access_token" | cut -d " " -f 2 | cut -d "." -f 2 | base64 -d  | sed 's/$/}/'  | jq ".sub" | xargs | cut -d ":" -f 2
```

### Web UI

Navigate to **Admin** > **Users**

Select the user you care about

Note the URL in your search bar will be as follows

```text
https://company.conductor.one/users/1nCZW7XUnu0gVB4LYCvyaTop6mD
```

### Terraform

```hcl
data "conductorone_user" "my_user" {
  email = "<your email>"
}

output "my_user_id" {
  value = data.conductorone_user.my_user.id
}
```

## Next steps

You can now get information about the user

```shell
cone get-user 1nCZW7XUnu0gVB4LYCvyaTop6mD
```

## Additional Reading

* [List users in Conductor one using the API](list-users-in-conductor-one-using-the-api.md)
