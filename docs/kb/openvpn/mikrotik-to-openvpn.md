![img.png](img.png)

![img_1.png](img_1.png)

![img_2.png](img_2.png)

issue:

```text
IP packet with unknown IP version=0 seen
```

```markdown
/ip neighbor discovery-settings set discover-interface-list=none
```

```markdown
ca.crt  client.crt  client.key
```

```shell
certificate import file-name=ca.crt 
certificate import file-name=client.crt 
certificate import file-name=client.key 
```

```shell
ppp profile add name=OVPN-client change-tcp-mss=yes only-one=yes use-encryption=required use-mpls=no
```


![img_3.png](img_3.png)

http://missinglink.github.io/mikrotik-openvpn-client/