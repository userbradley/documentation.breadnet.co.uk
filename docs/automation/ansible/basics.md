---
title: Ansible Basics
reviewdate: '2022-01-01'
---


<p id="bkmrk-i-always-create-a-fo">I always create a folder for new tasks, so installing Nginx</p>
<p id="bkmrk-ansible">Ansible<br>|<br>|-----Nginx<br>|        |---hosts<br>|        |---nginx.yaml</p>
<p id="bkmrk-etc">etc</p>
<p id="bkmrk-change-the-directory">Change the directory to the task at hand, so here it's installing Nginx</p>
<p id="bkmrk-create-a-file-called">Create a file called ansible.cfg and place the below in the file. Subsitute out the hosts for the names, and the server addresses for either their hostname, should you have dns set up, or their IP if you do not.</p>
<pre id="bkmrk-%5Bdefaults%5D-hostfile-"><code class="language-YAML">[defaults]
hostfile = hosts</code></pre>
<p id="bkmrk-next-we-will-create-">Next we will create the hosts file, this is what ansible will reference later when we ask it to point to either a server, or a set of servers</p>
<pre id="bkmrk-%5Bexample1%5D-%3Chost1%3E-%3C"><code class="language-YAML">[example1]
&lt;host1&gt;
&lt;host2&gt;
&lt;1.1.1.1&gt;
&lt;1.0.0.1&gt;

[webservers]
web.bread
dbserver.bread
example.bread

[production:servers] #we can call a group by using this
webservers
example1</code></pre>
<p id="bkmrk-ansible-is-a-bitch-a">Ansible is a bitch and only uses ssh with keys. follow this guide <a title="SSH Keys" href="http://bookstack.bread/books/kb-articles/page/ssh-keys">here</a> on how to move your key to the server you want to work on</p>
<p id="bkmrk-%C2%A0">to ping a server and check that asnible can see it: <code>ansible &lt;host&gt; -m ping </code></p>
<p id="bkmrk-creating-the-ansible">Creating the ansible job is fun. Here we will install nginx</p>
<p id="bkmrk-because-it%27s-yaml%2C-u" class="callout warning">Because it's yaml, use double space</p>
<pre id="bkmrk-------hosts%3A-nginx-s"><code class="language-yaml">---
- hosts: nginx
  sudo: yes
  tasks:
    - name: install nginx
      apt: name=nginx update_cache=yes state=latest</code></pre>
<p id="bkmrk-%C2%A0-0"> </p>
<p id="bkmrk-to-ping-a-server-and"> </p>
<p id="bkmrk-running-an-ansible-j"><span style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Oxygen, Ubuntu, Roboto, Cantarell, 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;">Running an ansible job</span></p>
<pre id="bkmrk-ansible-playbook-%3Cho"><code class="language-">ansible-playbook &lt;host group&gt; &lt;task&gt;.yaml &lt;--ask-sudo-pass&gt;</code></pre>