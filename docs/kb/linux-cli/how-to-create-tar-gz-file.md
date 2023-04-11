---
title: How to create tar.gz file
reviewdate: '2023-01-01'
---

## Why

Sometimes we want to create a tarball of a directory to store and save space

## How

Assuming we want to tarball the `/var/www` directory we would do the below

Move to the directory

```shell
cd /var
```

Start the Tarball

```shell
tar -czvf <name>.tar.gz www
```

## Additional Reading

[Cyberciti](https://www.cyberciti.biz/faq/how-to-create-tar-gz-file-in-linux-using-command-line/)