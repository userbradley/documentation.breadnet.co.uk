---
title: Ansible Basics
reviewdate: '2026-12-20'
---

I always create a folder for new tasks, so installing Nginx

Ansible
|
|-----Nginx
|        |---hosts
|        |---nginx.yaml

etc

Change the directory to the task at hand, so here it's installing Nginx

Create a file called ansible.cfg and place the below in the file. Subsitute out the hosts for the names, and the server addresses for either their hostname, should you have dns set up, or their IP if you do not.

    [defaults]
    hostfile = hosts

Next we will create the hosts file, this is what ansible will reference later when we ask it to point to either a server, or a set of servers

    [example1]
    <host1>
    <host2>
    <1.1.1.1>
    <1.0.0.1>

    [webservers]
    web.bread
    dbserver.bread
    example.bread

    [production:servers] #we can call a group by using this
    webservers
    example1

Ansible is a bitch and only uses ssh with keys. follow this guide [here](http://bookstack.bread/books/kb-articles/page/ssh-keys "SSH Keys") on how to move your key to the server you want to work on

to ping a server and check that asnible can see it: `ansible <host> -m ping`

Creating the ansible job is fun. Here we will install nginx

Because it's yaml, use double space

    ---
    - hosts: nginx
      sudo: yes
      tasks:
        - name: install nginx
          apt: name=nginx update_cache=yes state=latest

Running an ansible job

    ansible-playbook <host group> <task>.yaml <--ask-sudo-pass>
