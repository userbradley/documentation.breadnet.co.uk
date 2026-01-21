---
title: AWS SSO populate config
reviewdate: '2026-12-20'
---

When using AWS with Identity centre you will have many roles available to use. Depending on your setup thre may be
upwards of 1000 roles and accounts.

Generating that config by hand is nearly impossible

## How

We can make use of [aws-sso-util](https://github.com/benkehoe/aws-sso-util) package

### Install aws-sso-util

```shell
pipx install aws-sso-util
```

### Backup your current config

!!! warning "Ensure you back up your config"
    This page has you run commands that will permanently alter the config so if you need something,
    make sure you've backed it up

    I warned you!

```shell
cp ~/.aws/config ~/.aws/config.backup
```

### Generate config

You will need to know your _AWS Start URL_ which is the URL you go to for the identity centre.

Usually this is `https://<company-name>.awsapps.com/start/`

To configure `aws-sso-util` you can either set environment variables or add to your `~/.aws/config` file

=== "Use Environment Variables"

    Set the below environment variables

    * `AWS_DEFAULT_SSO_START_URL`
    * `AWS_DEFAULT_SSO_REGION` (the region that you've configured Identity Center in)

    Below is an example for `compyname` whose identity centre is in `eu-west-2`

    ```shell
    export AWS_DEFAULT_SSO_START_URL="https://companyname.awsapps.com/start"
    export AWS_DEFAULT_SSO_REGION="eu-west-2"
    ```

=== "Use `~/.aws/config`"

    Add the below to your `~/.aws/config` under the default profile

    ```shell
    sso_start_url = https://companyname.awsapps.com/start
    sso_region = eu-west-2
    ```

    Your config file should look like

    ```shell
    [default]
    sso_start_url = https://companyname.awsapps.com/start
    sso_region = eu-west-2
    ```

Once configured in your method of choice, you can now generate the profiles

=== "Dry run"

    The below command will generate the profiles in DRY RUN mode, so it does not modify you `.aws/config` file

    ```shell
    aws-sso-util configure populate --dry-run --region eu-west-2
    ```

    Once you're happy, you can click the tab `Set default region for all profiles` or `Set several regions for each profile`

=== "Set default region for all profiles"

    !!! note
        This will overwrite your `~/.aws/config`

        Ensure you've got a back up

    ```shell
    aws-sso-util configure populate --region eu-west-2
    ```

=== "Set several regions for each profile"

    !!! note
        This will overwrite your `~/.aws/config`

        Ensure you've got a back up

    ```shell
    aws-sso-util configure populate -r eu-west-1 -r us-east-1 -r eu-west-2 -r us-east-2 -r ca-central-1 -r ap-southeast-1 -r ap-southeast-2 --region-style long --include-region always
    ```

## Testing

Now that you've got all the roles configured, test that it's working

Change profile using something like [awsctx](awsctx.md)

Run the below and pick a role of your choice

```shell
aws sso login
awsctx
```

```shell
aws sts get-caller-identity
```

You should see an output like

```json
{
    "UserId": "7U67JA0MQJ3ZL0M3A342G4:user.name@companyname.domain",
    "Account": "830049139240",
    "Arn": "arn:aws:sts::830049139240:assumed-role/AWSReservedSSO_role_name_skdhjf44/user.name@companyname.domain"
}
```
