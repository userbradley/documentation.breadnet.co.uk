---
title: Connections on a port
---

# Connections on a port

```bash
netstat -tn 2>/dev/null | grep :80 | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr | head
netstat -anpe | grep "80" | grep "LISTEN"
```
