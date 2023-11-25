---
title: SSH client setup using keys
reviewdate: '2022-01-01'
---

##### The following steps will set up your ssh keypairs on your local machine, copy the public key to your server, and configure your ssh client to use a specific private key with a server alias.

* * *

First, generate your keypair, I generally name the keys with my username-service, username-hostname, or username-device, sometimes even a combination of the three.

To generate keys for a new server at _securedomain.com_

`ssh-keygen -t rsa -b 4096 -C 'email@securedomain.com'`

Things to keep in mind:

*   The email does not have to be the same domain as the service/server you are connecting to
*   The `-t rsa -b 4096` options are safe and will work on most servers, you can also use `-t ed25519` if you wish.

Once you're in the `ssh-keygen` prompt it will ask you to provide a name for your keys _(you can also do this in the command itself using the `-f <filename>`)_

`Generating public/private rsa key pair.`
`Enter file in which to save the key (/home/user/.ssh/id_rsa):` _<new\_key\_name>_

The `ssh-keygen` application will then, prompt you for a passphrase to secure your key. (You don't have to, but it is recommended). If you don't wish to use a passphrase just press _ENTER_ twice.

* * *

Now, we need to copy our keys to the server, we do so by entering the following

`ssh-copy-id -i .ssh/yourkeyfile [username@hostname](mailto:username@hostname)`

This will effectively copy your keyfile over to the new server in a secure fashion. More reading on this [here.](https://www.ssh.com/ssh/copy-id "https://www.ssh.com/ssh/copy-id")

* * *

Next, you will want to add the key to your `.ssh/config` to be used automatically with the specified host it was created for; this saves the leg work of having to remember which key goes with which host, and also from having to type `-i /path/to/key` options with your ssh command.

To do this, first we need to edit our config, so open up `.ssh/config` in your preferred editor and enter the following:

    # EXAMPLE

    # This will set up the use of example as an alias for the FQDN of the server you want to connect to
    Host example
    Hostname example.securedomain.com
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/securedomain_username

In this config the following are true:

*    `Host` is an alias to the server we wish to connect to, it does not have to match the domain name.
*   `Hostname` is the actual FQDN of the server we wish to connect to
*    `AddKeysToAgent` tells ssh to add the specified keyfiles to our existing [s_sh-agent_](https://www.ssh.com/ssh/agent "https://www.ssh.com/ssh/agent")
*   `UseKeychain` tells ssh to utilize the _[keychain](https://www.techrepublic.com/article/configure-it-quick-use-keychain-to-simplify-ssh-connections/ "https://www.techrepublic.com/article/configure-it-quick-use-keychain-to-simplify-ssh-connections/"),_ which either starts the ssh-agent, or connects to an already running instance saving the trouble of typing the passphrase for a given key if you're logging in and out of a server frequently.
*    `IdentityFile` is your keyfile you wish to use for the host you are configuring; probably the key you just generated.

Using this config and example; we can now use the following command

`ssh [user@example](mailto:user@example)`

Which using this config, in the background is expanded out to the following command

`ssh -i ~/.ssh/securedomain_username user@example.securedomain.com`
