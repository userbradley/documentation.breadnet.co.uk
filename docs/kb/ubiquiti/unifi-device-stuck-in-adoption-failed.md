---
title: Unifi device stuck in Adoption failed
---

## What

This can happen when the wind blows the wrong way quite frankly

This error is identifiable by the below error message

```text
Adoption Failed
```

![img.png](../../assets/ubiquiti-adoption-failed.png)

## How to resolve

Sometimes this issue will go away on its own. Sometimes it requires quite an aggressive approach.

!!! tip "How to follow this guide"
    Best to follow this guide one section after another. Between each step check in the Unifi Console

### Restart the controller

You can either reboot the controller, or restart the service

=== "Restart Service"

    ```shell
    systemctl restart unifi
    ```

=== "Restart Controller"

    ```shell
    reboot now
    ```

### Reset the Access point

Open **Settings** > **System** > **Device SSH Authentication**

Make a note of the SSH password and Username.

SSH to the access point

```shell
ssh <username>@<ip>
```

When prompted, type in the password from the UI.

!!! danger "Do not power down the device"
    Doing so will brick the Access Point

You will get a shell, run the below

```shell
sudo syswrapper.sh restore-default
```

The SSH session will time out after about 5 minutes.

Check the console, perhaps the device says it's ready for adoption

### Delete the access point from the database

!!! danger "This could break things badly"
    If something goes wrong, it could break the unifi install quite badly.

SSH to the Unifi controller **Not the access point**

Open a connection to the Database
```shell
mongo --port 27117
```

Use the `ace` database

```shell
use ace
```

Using the Mac address from the UI, replace `<mac>` in the below and run the command

```shell
db.device.remove({"mac" : "<mac>"})
```

The exit the database
```shell
exit
```

Restart the controller

```shell
systemctl restart unifi
```

You now need to set the inform URL on the access point

### Adopt the access point

!!! tip "Assumes you reset the access point"
    The below assumes you've reset the access point

SSH to the access point

Username and password are `ubnt`

```shell
ssh ubnt@<ip>
```

Set the inform for the controller

```shell
set-inform http://<ip/hostname>:8080/inform
```

In the console it will show the device as pending adoption.

## What if this didn't work?

Sorry, this is what worked for me.

Try:

* Reset the access point
* Upgrade the access point
* Restart the controller
* Delete from the database
* Restart the controller
* Set Inform

If that doesn't work, it may be worth resetting the controller all together
