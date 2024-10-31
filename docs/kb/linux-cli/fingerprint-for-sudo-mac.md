---
title: Use fingerprint as sudo on mac
---

# Use fingerprint as sudo on Mac

## Why

Using sudo on any linux device can raise the risk level substantially.

Using your fingerprint already enrolled on the mac prevents someone from being able to type your password in when you're not around

## How

=== "Recent releases"

    Edit the file `/etc/pam.d/sudo_local`
    
    ```shell
    sudo nano /etc/pam.d/sudo_local
    ```
    
    Put the below in
    
    ```text
    auth sufficient pam_tid.so
    ```
    
    Save and exit, now try sudo in a new shell session

=== "Before Sonoma"


    Edit the below file in your favourite editor
    
    === "Nano"
    
        ``` shell
        sudo nano /etc/pam.d/sudo
        ```
    
    === "Vi/Vim"
    
        ``` shell
        sudo vi /etc/pam.d/sudo
        ```
    ---
    
    
    
    The file `/etc/pam.d/sudo` should look something like below
    
    ```text
    # sudo: auth account password session
    auth       sufficient     pam_smartcard.so
    auth       required       pam_opendirectory.so
    account    required       pam_permit.so
    password   required       pam_deny.so
    session    required       pam_permit.so
    ```
    
    
    Add the below line just under `# sudo: auth account password session`
    
    
    ```text
    auth       sufficient     pam_tid.so
    ```
    
    Your file should now look like the below
    
    ```diff
    # sudo: auth account password session
    + auth       sufficient     pam_tid.so
    auth       sufficient     pam_smartcard.so
    auth       required       pam_opendirectory.so
    account    required       pam_permit.so
    password   required       pam_deny.so
    session    required       pam_permit.so
    ```
    
    
    Save the file using the below commands
    
    === "Nano"
    
        Control x + `y` + enter
    
    === "Vi/Vim"
    
        Escape + `:wq!` + enter
    