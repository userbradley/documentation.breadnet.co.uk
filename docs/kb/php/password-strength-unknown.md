---
reviewdate: '2026-12-20'
title: Password Strength Unknown wordpress
---

## What is this error

This is an error you see when trying to log in or create a new user on a WordPress instance

## How to resolve

Add the below line to the `wp-config.php` file

```php
$_SERVER['HTTPS'] = true;
```

It should look like the below

```diff

<?php
+ $_SERVER['HTTPS'] = true;
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

```
