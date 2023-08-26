---
title: Python install using Ansible
reviewdate: '2022-01-01'
---

For some reporting, Ansible needs python!

Have your hosts file as usual.

create a new task called python.yaml

```yaml
- name: dependency provisioning
  hosts: daily
  become: yes
  become_method: sudo
  gather_facts: false
  tasks:
    - name: install python2
      raw: sudo apt-get -y install python-simplejson
```

Run:

```shell
ansible-playbook python.yaml --ask-sudo-pass
```