---
title: Netplan Set static IP
---

# Netplan Set static IP

Edit the file under `/etc/netplan/`

Change the File that does not have `wifi` in the name as below


```yaml
network:
  ethernets:
    enp2s0:
      addresses: [192.168.1.254/24]
      gateway4: 192.168.1.1
      nameservers:
        addresses: [1.1.1.1,1.0.0.1]
  version: 2
```

Save and exit the document

You have 2 options here

* Test - Test the changes and if you don't press enter after 120 seconds undoes the changes
* Apply - Applies the changes right away

=== "Test the changes"

    ``` shell
    netplan try
    ```


=== "Apply them right away"

    ``` shell
    netplan apply
    ```
