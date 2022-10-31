---
title: Send test email on Passbolt
---

# Send test email on Passbolt

Exec in to the container

```shell
docker exec -it passbolt /bin/sh
```

move to bin

```shell
./cake passbolt send_test_email test@breadnet.co.uk
```

[Check Passbolt is healthy](check-passbolt-is-healthy.md)
