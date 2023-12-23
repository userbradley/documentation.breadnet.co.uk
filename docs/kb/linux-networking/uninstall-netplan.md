---
title: Uninstalling netplan
reviewdate: '2022-01-01'
---

**These directions have been tested also to Ubuntu 18.04.1 and will very likely work also for any future release using `netplan` and `systemd`.**

There's no need at all to fiddle with GRUB nor any manual file removal. The configuration set up in `/etc/networking` files and directories **will survive reboots**.

These are the **verified** steps:

1.  Check the actual interface names you are interested in with `ip l` for the _links_ (aka interfaces) and with `ip a` for addresses.
2.  Install `ifupdown` with `sudo apt -y install ifupdown`.
3.  Purge `netplan` with `sudo apt -y purge netplan.io`.
4.  Configure `/etc/network/interfaces` and/or `/etc/network/interfaces.d` accordingly to your needs (`man 5 interfaces` can be of some help with examples).
5.  Restart the `networking` service with `sudo systemctl restart networking; systemctl status networking` or `sudo /etc/init.d/networking restart; /etc/init.d/networking status`. The output of the `status` command should mention `active` as its status.
6.  The command `ip a` will show whether the expected network configuration has been applied.
7.  Optionally, manually purge the remants of the netplan configuration files with `sudo rm -vfr /usr/share/netplan /etc/netplan`.

No reboot is needed in order to "refresh" the IP configuration: it will be active as of step no.5 . In case of troubles, double-check the interface names. A typical IPv4 DHCP configuration will resemble this one:

    auto enp0s3
    iface enp0s3 inet dhcp

while a static IPv4 address can be configured like this:

    auto enp0s3
    iface enp0s3 inet static
    address 192.168.255.42/24
    gateway 192.168.255.254
    #dns-nameservers 8.8.8.8 208.67.222.222
