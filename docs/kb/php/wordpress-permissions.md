---
title: WordPress permissions
reviewdate: '2022-01-01'
---

```bash
chown www-data:www-data  -R * # Let Apache be owner
find . -type d -exec chmod 755 {} \;  # Change directory permissions rwxr-xr-x
find . -type f -exec chmod 644 {} \;  # Change file permissions rw-r--r--
```
