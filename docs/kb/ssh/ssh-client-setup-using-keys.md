---
title: SSH client setup using keys
reviewdate: '2022-01-01'
---

# SSH client setup using keys

<h5 id="bkmrk-the-following-steps-">The following steps will setup your ssh keypairs on your local machine, copy the public key to your server, and configure your ssh client to use a specific private key with a server alias.</h5>
<hr id="bkmrk-">
<p id="bkmrk-first%2C-generate-your">First, generate your keypair, I generally name the keys with my username-service, username-hostname, or username-device, sometimes even a combination of the three.</p>
<p id="bkmrk-to-generate-keys-for">To generate keys for a new server at <em>securedomain.com</em></p>
<p id="bkmrk-ssh-keygen--t-rsa--b"><code>ssh-keygen -t rsa -b 4096 -C 'email@securedomain.com'</code></p>
<p id="bkmrk-things-to-keep-in-mi"><span style="text-decoration: underline;">Things to keep in mind:</span></p>
<ul id="bkmrk-the-email-does-not-h">
<li>The email does not have to be the same domain as the service/server you are connecting to</li>
<li>The <code>-t rsa -b 4096</code> options are safe and will work on most servers, you can also use <code>-t ed25519</code> if you wish.</li>
</ul>
<p id="bkmrk-once-you%27re-in-the-s">Once you're in the <code>ssh-keygen</code> prompt it will ask you to provide a name for your keys <em>(you can also do this in the command itself using the <code>-f &lt;filename&gt;</code>)</em></p>
<p id="bkmrk-generating-public%2Fpr"><code>Generating public/private rsa key pair.</code><br><code>Enter file in which to save the key (/home/user/.ssh/id_rsa):</code> <span style="color: #ff0000;"><em>&lt;new_key_name&gt;</em></span></p>
<p id="bkmrk-the-ssh-keygen-appli">The <code>ssh-keygen</code> application will then, prompt you for a passphrase to secure your key. (You don't have to, but it is recommended). If you don't wish to use a passphrase just press <em>ENTER</em> twice.</p>
<hr id="bkmrk--0">
<p id="bkmrk-now%2C-we-need-to-copy">Now, we need to copy our keys to the server, we do so by entering the following</p>
<p id="bkmrk-ssh-copy-id--i-.ssh%2F"><code>ssh-copy-id -i .ssh/yourkeyfile <a href="mailto:username@hostname">username@hostname</a></code></p>
<p id="bkmrk-this-will-effectivel">This will effectively copy your keyfile over to the new server in a secure fashion. More reading on this <a title="https://www.ssh.com/ssh/copy-id" href="https://www.ssh.com/ssh/copy-id">here.</a></p>
<hr id="bkmrk--1">
<p id="bkmrk-next%2C-you-will-want-">Next, you will want to add the key to your <code>.ssh/config</code> to be used automatically with the specified host it was created for; this saves the leg work of having to remember which key goes with which host, and also from having to type <code>-i /path/to/key</code> options with your ssh command.</p>
<p id="bkmrk-to-do-this%2C-first-we">To do this, first we need to edit our config, so open up <code>.ssh/config</code> in your preferred editor and enter the following:</p>
<pre id="bkmrk-%23-example-%23-this-wil"><code class="language-shell"># EXAMPLE

# This will setup the use of example as an alias for the FQDN of the server you want to connect to
Host example
Hostname example.securedomain.com
AddKeysToAgent yes
UseKeychain yes
IdentityFile ~/.ssh/securedomain_username</code></pre>
<p id="bkmrk-in-this-config-the-f">In this config the following are true:</p>
<ul id="bkmrk-%C2%A0host-is-an-alias-to">
<li> <code>Host</code> is an alias to the server we wish to connect to, it does not have to match the domain name.</li>
<li>
<code>Hostname</code> is the actual FQDN of the server we wish to connect to</li>
<li> <code>AddKeysToAgent</code> tells ssh to add the specified keyfiles to our existing <a title="https://www.ssh.com/ssh/agent" href="https://www.ssh.com/ssh/agent">s<em>sh-agent</em></a>
</li>
<li>
<code>UseKeychain</code> tells ssh to utilize the <em><a title="https://www.techrepublic.com/article/configure-it-quick-use-keychain-to-simplify-ssh-connections/" href="https://www.techrepublic.com/article/configure-it-quick-use-keychain-to-simplify-ssh-connections/">keychain</a>, </em>which either starts the ssh-agent, or connects to an already running instance saving the trouble of typing the passphrase for a given key if you're logging in and out of a server frequently.</li>
<li> <code>IdentityFile</code> is your keyfile you wish to use for the host you are configuring; probably the key you just generated.</li>
</ul>
<p id="bkmrk-using-this-config-an">Using this config and example; we can now use the following command<br><br><code>ssh <a href="mailto:user@example">user@example</a></code></p>
<p id="bkmrk-which-using-this-con">Which using this config, in the background is expanded out to the following command</p>
<p id="bkmrk-ssh--i-%7E%2F.ssh%2Fsecure"><code>ssh -i ~/.ssh/securedomain_username user@example.securedomain.com</code></p>