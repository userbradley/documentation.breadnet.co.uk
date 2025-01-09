---
title: Bulk change file extensions
---

## Why

During a migration of dokuwiki pages to mkdocs, I had to rename a boat load of files

## How

```shell
for f in *.txt; do mv -- "$f" "${f%.txt}.md"; done
```
