---
reviewdate: '2026-12-20'
title: Postgres create user and database
---

I am still getting my head around Postgres, and one thing I find I forget often is the create user and database command.

## Create user

```shell
CREATE ROLE <username> LOGIN PASSWORD '<password>';
```

## Create Database

```shell
CREATE DATABASE <database> OWNER <username>;
```
