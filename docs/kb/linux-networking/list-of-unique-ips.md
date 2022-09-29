---
title: List of unique IP's
---

```bash
awk '{print $1}' access.log | sort | uniq -c | sort -nr
```

??? Info "Funny story"
    I had an AWS role interview, and this was what they were after.
    I actually wrote this page 8 months ago (2021)