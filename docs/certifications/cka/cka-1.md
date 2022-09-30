---
title: CKA - Page 1
---

## Resources

Code for exam reduction: *DEVOPS15*

Github for additional stuff: [https://github.com/kodekloudhub/certified-kubernetes-administrator-course](https://github.com/kodekloudhub/certified-kubernetes-administrator-course)

## Cluster Architecture

These nodes may be physical or virtual and host applications in the form of containers

This is responsible for storing the values and managing pods, containers, and then the values are stored in a key value store.

This is under the master called Kube-scheduler, which checks taints, placement and restarts

All actions are done via the Kubernetes API which is exposed via the kube-apiserver

Everything is in the form of containers, so all the nodes need to have docker installed or a similar runtime egine (containerd or rokt)

The Kubeapi server pulls from the kube-apiserver to see what needs to be done.

The pods and containers need to be able to communicate, on the hosts there is a service called Kube-proxy that ships traffic around

### Master

* Manages resources
* Plans
* Schedules
* Monitors nodes
* Has the etcd cluster

kube-apiserver

Kube controller manager

kube-scheduler

### Worker Node

Kublet

Kube-proxy

Container run time supported: Docker, rkt

## ETCD

ETCD is a distributed reliable key value store

Key value store stores a key and a vlaue

Normal Database example:

| Name     | Age  | Location |
|----------|------|----------|
| Mike     | `32` | Place 1  |
| Not mike | `54` | Place 2  |


Whereas a `key value store`

| Key      | Value   |
|----------|---------|
| Name     | Mike    |
| Location | Place 1 |

So querying a key value store is like:

`Put Name "Mike"`

and then querying is like: `get name`

It's used for querying bits of operational data, and it's fast.

Etcd listens on `2379` by default. 

### The role it plays

ETCD stores all the stuff that you get when you run a kubectl get:

* Nodes
* PODs
* Configs
* Secrets
* Accounts
* Roles
* Bindings
* Others
* 
It's important to know that when etcd runs it's to be bound to the host IP, you should then point it to kube-apiserver


### List all keys etcd contains

```shell
etcdctl get / --prefix -keys-only
```

In an HA deployment, etcd installed a master server to each master instance, and that they know about eachother. This is set under the --initial-cluster option



The Scheduler monitors the pods and when it realises there is a pod with no node, it assigns it, then notifies etcd

Kube-api server is responsible for

* Authenticating users
* Validates requests
* Retireves data
* Update ETCD
* Scheduler
* Kubelet
* 
If you're setting up K8 the hard way, kubeapi-server is installed as a binary and needs to be on the master server

There are alot of certificates that are used throughout the kube-api server

To View kubeapi-server details




