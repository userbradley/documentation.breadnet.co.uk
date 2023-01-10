---
title: CKA - Page 1
---

# CKA - Page 1

## What is Kubernetes

Kubernetes is a container orchestration platform that is designed to [Scale to the planet](https://kubernetes.io/#planet-scale). It achieves this using a number of 
somewhat independent stacks of technology, like [etcd](#etcd) and [nginx]().

This and all other pages are my study notes for the CKA exam.



## Additional Study Resources

Code for exam reduction: `DEVOPS15`

GitHub for additional stuff: [kodekloudhub/certified-kubernetes-administrator-course](https://github.com/kodekloudhub/certified-kubernetes-administrator-course)

## Kubernetes Architecture 

Kubernetes hosts your application in an automated fashion. 

It's designed that applications can be both segmented logically, and allowed to communicate.

## Container runtime

In order for nodes (Both master and workers) to be able to run [Pods]() we need to have a `CR` (Container runtime).

A CR is the software installed on the nodes that allow containers (Docker containers) to be run. A few examples of common Container runtimes are below

* [containerD](https://containerd.io)
* [CRI-O](https://cri-o.io)
* [Docker engine](https://docs.docker.com/engine/)
* [Mirantis Container Runtime](https://www.mirantis.com/software/container-runtime/)

The CR communicates to the [`CRI`](#container-runtime)

### Container Runtime Interface (CRI)

The CRI is a plugin interface which enables the [Kubelet]() to to use a wide variaty of Container runtimes without the need to recompile the cluster components.

!!! Note "Where it's required"
    The CRI and CR are required to be on each node.

## Nodes

Kubernetes is split into 2 node types

* [Master](#master) - Responsible for managing the cluster
* [Workers](#worker) -  Responsible for running the containers (nae; workload)


### Master

Masters run the below _workloads_ (They are not workloads _per-se_ but can be deployed as pods on the masters)

The job of the `master` node (or nodes) is to control the workers, place pods on nodes that have the resources as well as keep a general
eye on the cluster.

It stores information on the cluster in something called [ETCD](#etcd) - A key value store.

The master is made up of the below components:


| Name                      | What it does                                                                                                                                                                                                    | Resources                                                                                                             |
|---------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| `kube-apiserver`          | At the top level, this is where `kubectl` connects to, as well as all the cluster based metrics, jobs, status updates and scheduling requests originate from. Also used for nodes to communicate to the master. | [kube-apiserver](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-apiserver/)                   |
| `etcd`                    | Key value store of the cluster state, _fronted_ by the `kube-apiserver`. ETCD runs on the control plane nodes only.                                                                                             | [How does kubernetes use ETCD](https://www.techtarget.com/searchitoperations/tip/How-does-Kubernetes-use-etcd)        |
 | `kube-scheduler`          | Assigns pods to nodes, determines what nodes are available for placement of pods. Ranks each valid node and binds a pod to the node                                                                             | [kube-scheduler](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-scheduler/)                   |
| `kube-controller-manager` | A control loop that runs the _core_ controllers  (replication, endpoints, namespace, and serviceaccounts controller)                                                                                            | [kube-controller-manager](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/) |
| `node controller`         | Controls the lifecycle of nodes, their registration and status (`OutOfDisk`, `Ready`, `MemoryPressure` and `DiskPressure`                                                                                       | [What is a node](https://unofficial-kubernetes.readthedocs.io/en/latest/concepts/nodes/node/)                         |
| `ReplicationController`   | Ensures the specified number of `pod replicas` are running at any given time.                                                                                                                                   | [ReplicationController](https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/)             |


### Workers

Worker nodes are where the actual Workloads are run. A good example of a workload is a simple `nginx` deployment.

Some facts about the worker nodes:

* Required to register with the master nodes (using the `kubelet`)
* Report their status back to the master undoes
* `kubelet` orchestrates the workloads on the nodes using _instructions_ passed from the Kube-apiserver
* Uses 'kube-proxy' to facilitate inter-cluster communication. 

The worker is made up of the below component:

| Name         | What it does                                                                                                                                  | Resources                                                                                                              |
|--------------|-----------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------|
| `kubelet`    | Responsible for regiersting the `node` with the masters as well as ensuring that pods described by the apiserver are running and are healthy. | [kubelet](https://kubernetes.io/docs/reference/command-line-tools-reference/kubelet/)                                  |
| `kube-proxy` | Runs on each node, this is where services _live_ (services being `kind: Service`)                                                             | [kube-proxy](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-proxy/#auto-generated-edit-notice) |

## ETCD

ETCD is a distributed reliable key value store

Key value store stores a key and a value

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

It's important to know that when etcd runs it's to be bound to the host IP, you should then point it to kube-apiserver


### List all keys etcd contains

```shell
etcdctl get / --prefix -keys-only
```

In an HA deployment, etcd installed a master server to each master instance, and that they know about each other. This is set under the `--initial-cluster` option

## Kube-apiserver



??? info "The official definition of the `kube-apiserver` is"
    The Kubernetes API server validates and configures data for the api objects which include pods, services, replicationcontrollers, and others. The API Server services REST operations and provides the frontend to the cluster's shared state through which all other components interact.


The `kube-apiserver` is the primary management component of Kubernetes. 

When you issue a `kubectl` command, this is where the connection is made to. 

We don't actually _have to_ use kubectl, as kubectl is just a nice wrapper around making `HTTP/POST` request to any of the master nodes running the kube-aiserver

### Creating a pod (kube-apiserver example)

| Where it happens | What happens | 
|------------------|--------------|
| | |
| | |
| | |
| | |
| | |
| | |
| | |
| | |
| | |
| | |
| | |
| | |
| | |

<!-- notes

When creating a pod
(master node does this below)
    1 - authenticates a user
    2 - validates a request
    3- Creates a pod object
    4- updates etcd
    5- updates the user that a pod has been created
    6- scheduler monitors the API server for chanegs
    7 - scheduler sees a pod with no nodes assigned
    8- scheduler identifies the righ node to place the pod on and communicates it back to the kubeapi
    9 - apiserver updates etcd
    10 - apiserver passes information to the kubelet on the correct worker node
(on worker node now)
    11- kubelet creates the pod on the node, instructs teh CRE to deploy the image
    12 - once done, updates the status back to the kube-api
(master now)
    13- once updated to kube-api, kupeapi server updates to etcd

A similar pattern is followed when any change is requested
!!! the kube-api is at the center of all changes 

summary: Kube-api server is responsible for authenticating and validating requests, retrieving and updating data in etcd. In fact its the only component that interacts with etcd
    scheduler kubecontorller manager and kubelet all use the apiserver.

Viewing kubeapi config options

=== kubeadm
    deployed as a pod called `kube-apiserver-master` in the `kube-system` namespace

    can view the config on `/etc/kubernetes/manifests/kube-apiserver.yml`

=== non-kubeadm
    Can view the config at `/etc/systemd/system/kube-apiserver.service`
    can view the process of kube-apiserver by doing `ps -aus | grep kube-apiserver`


-->

The Scheduler monitors the pods and when it realises there is a pod with no node, it assigns it, then notifies etcd

Kube-api server is responsible for

* Authenticating users
* Validates requests
* Retrieves data
* Update ETCD
* Scheduler
* Kubelet
* 
If you're setting up K8 the hard way, kubeapi-server is installed as a binary and needs to be on the master server

There are alot of certificates that are used throughout the kube-api server






