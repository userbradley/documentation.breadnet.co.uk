---
title: Cachet
outdated: true
---

When you change anything with Cachet, ensure that you clear the cache!

run the below in the cachet directory

```shell
rm -rf bootstrap/cache/*
```

then restart `apache2`

then:

```shell
php artisan cache:clear
```
