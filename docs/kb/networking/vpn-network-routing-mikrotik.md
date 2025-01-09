---
title: VPN network routing Mikrotik
---

# VPN network routing Mikrotik

This is a bit rough and ready and may contain mistakes but should point you in the right direction. This is also not the only way it could be done and may not be the best

Add IP addresses you want to route via the VPN to an address list

```shell
/ip firewall address-list
add address=192.168.88.254 list=OutVpn
```

create a rule to mark packets from your address list for routing

```shell
/ip firewall mangle
chain=prerouting action=mark-routing new-routing-mark=VpnRoute passthrough=yes \
src-address-list=OutVpn log=no log-prefix="" dst-address=0.0.0.0/0
```

NAT the traffic so that traffic tunnelling through the VPN appears to come from 192.168.42.10 (the Hap IP)

```shell
/ip firewall nat
add action=src-nat chain=srcnat disabled=yes src-address-list=OutVpn to-addresses=\
    192.168.42.10
```

Add a Route sending all marked packets/traffic via the VPN

```shell
/ip route
add check-gateway=ping distance=1 gateway=YourVpn routing-mark=VpnRoute
```
