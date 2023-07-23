---
title: Change password using WPCli
---

# Change password using WPCli

## Why

Sometimes we need to change a users WordPress users password, and don't want to have to mess about with the Database

## How

### Install wpcli

???+ note "PHP needs to be installed"
    You need to have WP-cli installed

```shell
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
```

Move to the directory of a WordPress site and run the below

```shell
wp --info
```

### Change password

```shell
wp user update <user> --display_name=<> --user_pass=<password>
```

* `<user>` : The user login, user email or user ID of the user(s) to update.

### CLI Reference

#### wp user update

Updates an existing user.

~~~
wp user update <user>... [--user_pass=<password>] [--user_nicename=<nice_name>] [--user_url=<url>] [--user_email=<email>] [--display_name=<display_name>] [--nickname=<nickname>] [--first_name=<first_name>] [--last_name=<last_name>] [--description=<description>] [--rich_editing=<rich_editing>] [--user_registered=<yyyy-mm-dd-hh-ii-ss>] [--role=<role>] --<field>=<value> [--skip-email]
~~~

**OPTIONS**

	<user>...
		The user login, user email or user ID of the user(s) to update.

	[--user_pass=<password>]
		A string that contains the plain text password for the user.

	[--user_nicename=<nice_name>]
		A string that contains a URL-friendly name for the user. The default is the user's username.

	[--user_url=<url>]
		A string containing the user's URL for the user's web site.

	[--user_email=<email>]
		A string containing the user's email address.

	[--display_name=<display_name>]
		A string that will be shown on the site. Defaults to user's username.

	[--nickname=<nickname>]
		The user's nickname, defaults to the user's username.

	[--first_name=<first_name>]
		The user's first name.

	[--last_name=<last_name>]
		The user's last name.

	[--description=<description>]
		A string containing content about the user.

	[--rich_editing=<rich_editing>]
		A string for whether to enable the rich editor or not. False if not empty.

	[--user_registered=<yyyy-mm-dd-hh-ii-ss>]
		The date the user registered.

	[--role=<role>]
		A string used to set the user's role.

	--<field>=<value>
		One or more fields to update. For accepted fields, see wp_update_user().

	[--skip-email]
		Don't send an email notification to the user.
