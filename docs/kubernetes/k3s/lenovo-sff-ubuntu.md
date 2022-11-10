---
title: Lenovo Computer not installing Ubuntu
---

# Error 1962: No operating system found.


This is a post to save other people some time and pain. What follows may apply to other systems using a similar Lenovo BIOS.



## Symptoms


If a user selects Optimal or Default BIOS options, wipes the pre-installed existing operating systems and partitions, and then installs a Linux distribution in UEFI mode on an SCU device, the ThinkStation S30 may return the following error and refuse to boot after successful installation.


!!! error 
    
    Error 1962: No operating system found.



## Description



It appears that, prior to to following the BootOrder specified in the UEFI Boot Manager, the Lenovo BIOS first checks the UEFI Boot Manager configuration for an entry labelled "Windows Boot Manager".[1]



If this entry is not found, an error is presented to the user and the boot sequence terminates. The Lenovo BIOS does not require that the entry labelled "Windows Boot Manager" be used, only that it be present.



This may be related to the behaviour observed here.



It would be good if someone from Lenovo could confirm the observations about the behaviour of the Lenovo UEFI BIOS.





## Solution



Ensure that the SCU device is the set up as the first boot device in the BIOS Setup Primary Boot Sequence.
Lenovo has documented this issue here.

Ensure that there is an entry in the UEFI Boot Manager labeled "Windows Boot Manager"



Add an Entry to the UEFI Boot Manager labeled "Windows Boot Manager"


The following can be performed after installation of the operating system. The instructions assume that the user has access to "Live" installation media, is able to boot from that media and issue commands at the shell. It is also assumed that the user has a basic understanding of Linux devices references. The operating system must have been installed in UEFI mode and GRUB2 (or another bootloader) must have created at least one valid EFI boot file on the EFI system partition.



1. Insert the Live installation media, shutdown and power off the system.
2. Power on the system.
3. Interrupt the boot sequence with Enter or F12 and select the live installation media for boot.
4. Open a shell.
5. Establish whether or not the Live installation provides the efibootmgr tool, if it does not, install the package that provides efibootmgr.
6. As root, inspect the current configuration of the UEFI Boot Manager:

```shell
sudo efibootmgr -v
```

If there is already an entry labelled `"Windows Boot Manager"`, the remainder of these instructions do not apply.

If there is no entry, add one. For example:

```shell
sudo efibootmgr -c -d /dev/sda -p 1 -l '\EFI\ubuntu\grubx64.efi' -L "Windows Boot Manager"
```

Please note that the option provided to the -l option can be any valid EFI boot loader.
Verify that the entry was added to the UEFI Boot Manager:

```shell
sudo efibootmgr -v
```

Set the desired boot order of the UEFI Boot Manager, for example if the boot loader for Ubuntu is 0000 and, Windows Boot Loader dummy is 0001, and remaining boot devices are 000A-000C:

```shell
sudo efibootmgr -o 0000,0001,000A,000B,000C
```

Veryify that the BootOrder variable has been set correctly:

```shell
sudo efibootmgr -v
```

Optionally, adjust the value of the Timeout option to provide the user with more time to interrupt the boot process, for example, to extend the timeout to 10 seconds:

```shell
sudo efibootmgr -t 10
```

Shutdown the system, remove the live installation media and reboot.
After booting into the installed operating system, confirm that the BootCurrent variable has selected the correct loader and is behaving as expected. Please note, you may have to install efibootmgr in the installed operating system.

```shell
sudo efiboogmgr -v
```

If the above fails, consult the documentation of your boot loader and ensure that it is configured correctly. Also ensure that your EFI system partition is laid out correctly and formatted as FAT32.



Notes:

[1] It is possible that the BIOS checks for the presence of either "Windows Boot Manager' or "Red Hat Enterprise Linux", however I have not tested this: "Windows Boot Manager" worked and that suits me. Others may prefer a different aesthetic.

## Additional Reading

[Form Thread](https://forums.lenovo.com/t5/ThinkStation/UEFI-Mode-installation-of-Linux-distributions-on-Thinkstation/td-p/1018555)