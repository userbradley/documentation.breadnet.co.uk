he sqlite3 command line tool features the .backup dot command.

You can connect to your database with:

sqlite3 my_database.sq3
and run the backup dot command with:

.backup backup_file.sq3
Instead of the interactive connection to the database, you can also do the backup and close the connection afterwards with

sqlite3 my_database.sq3 ".backup 'backup_file.sq3'"
Either way the result is a copy named backup_file.sq3 of the database my_database.sq3.

It's different from regularly file copying, because it takes care of any users currently working on the database. There are proper locks set on the database, so the backup is done exclusively.


https://stackoverflow.com/questions/25675314/how-to-backup-sqlite-database