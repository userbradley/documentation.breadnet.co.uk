---
title: Recursive delete of .terraform directory
---

# Recursive delete of .terraform directory

```shell
find ./ -type d -name ".terraform" -exec rm -rf {} +
```