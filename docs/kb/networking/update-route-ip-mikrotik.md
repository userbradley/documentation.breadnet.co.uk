---
reviewdate: '2026-12-20'
title: Update the To Address on Mikrotik VPN Routing
---

## Why

Due to how the VPN is set up, the TLS will re-negotiate every 24 hours.

This means that once every 24 hours the connection will drop.

## How do I know the connection has dropped

You will have no internet

## How to resolve it

### Connect to the router

!!! note "Use another device for this"
    Due to how the network is set up, you cant use a device on the VPN network to access the router

=== "Winbox"

    Search for `Winbox` on your computer.

    Type in the IP address of the router

    ![img_9.png](../../assets/winbox_login.png)

    Type in the password

    Click `Connect`

=== "Website"

    Navigate to the Router's IP address

    Type in your username and password

    ![img_8.png](../../assets/web_login.png)

    Click `Login`

### Locate the new IP address

=== "Winbox"

    Click `IP` then `Address`

    ![img_10.png](../../assets/winbox_ip-address.png)

    Make note of the IP address of the VPN tunnel. It will probably be called `London`

    ![img_11.png](../../assets/winbox_ip-address-list.png)

    In our example, the IP address is `172.27.232.9`

    (_nb: this is an old screenshot, just use your imagination_)

=== "Website"

    Click `IP` then `Address`

    ![img.png](../../assets/web_ip.png)

    Make note of the IP address of the VPN tunnel. It will probably be called `London`

    ![img_1.png](../../assets/web_ip-address.png)

    In our example, the IP address is `172.27.232.9`

### Update the IP address

=== "Winbox"

    Navigate to `IP` > `Firewall`

    ![img_12.png](../../assets/winbox_ip-firewall.png)

    Click on the `NAT` tab

    ![img_13.png](../../assets/winbox_firewall-nat.png)

    Then **double-click** on the `src-nat` rule (_one at the bottom_)

    ![img_14.png](../../assets/web_nat-rules.png)

    Click on `Action`

    ![img_15.png](../../assets/winbox_nat-rule.png)

    !!! info "It will have an address already in it"
    This is expected. We need to update it

    Type the new Address in to the box.

    Click `apply` then `ok`

=== "Website"

    Navigate to `IP` > `Firewall`

    ![img_2.png](../../assets/web_ip-firewall.png)

    Click on the `NAT` tab

    ![img_3.png](../../assets/web_nat.png)

    Then **double-click** on the `src-nat` rule (_one at the bottom_)

    ![img_4.png](../../assets/web_nat-rules.png)

    Scroll down till you find a field called `To Address`

    !!! info "It will have an address already in it"
    This is expected. We need to update it

    ![img_5.png](../../assets/web_to-address-old.png)

    Type the new Address in to the box.

    _the field will go blue once changed_

    ![img_6.png](../../assets/web_to-address-updated.png)

    Scroll to the top of the page, and click `apply` then `ok`

    ![img_7.png](../../assets/mikrotik-ok-cancel-apply.png)
