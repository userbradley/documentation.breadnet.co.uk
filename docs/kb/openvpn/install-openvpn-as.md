---
title: Install OpenVPN AS
---

!!! note "Why this page exists"
    OpenVPN make you sign up to get these install commands, so this is an f-you to them.

```shell
apt update && apt -y install ca-certificates wget net-tools gnupg

wget https://as-repository.openvpn.net/as-repo-public.asc -qO /etc/apt/trusted.gpg.d/as-repository.asc

echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/as-repository.asc] http://as-repository.openvpn.net/as/debian jammy main">/etc/apt/sources.list.d/openvpn-as-repo.list

apt update && apt -y install openvpn-as
```
