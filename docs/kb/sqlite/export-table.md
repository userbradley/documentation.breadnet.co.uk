---
title: Export single table from sqlite
---

## Open the database

```shell
sqlite3 grocy.db
```

## Set destination for where to export table to

```shell
.output /Users/bradleystannard/github/grocy_users.db
```

## Export the table

```shell
.dump users
```

Now there will be a file in the `/Users/bradleystannard/github/` directory called `grocy_users.db`

## What to read next

* [Import table](import-table.md)
