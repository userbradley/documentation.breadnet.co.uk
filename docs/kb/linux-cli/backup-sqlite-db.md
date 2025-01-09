---
title: Backup sqlite Database
---

# Backup sqlite database

## Command line utility

The `sqlite3` command line tool features the `.backup` command.

## Backup database

```shell
sqlite3 my_database.sq3 ".backup 'backup_file.sq3'"
```

The result is a copy named `backup_file.sq3` of the database `my_database.sq3`

It's different from regularly file copying, because it takes care of any users currently working on the database.

There are proper locks set on the database, so the backup is done exclusively.

## Additional Reading

* [StackOverflow](https://stackoverflow.com/questions/25675314/how-to-backup-sqlite-database)
