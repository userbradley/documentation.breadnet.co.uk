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

The CRI is a plugin interface which enables the [Kubelet]() to use a wide variety of Container runtimes without the need to recompile the cluster components.

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


| Name                                                  | What it does                                                                                                                                                                                                    | Resources                                                                                                             |
|-------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| `kube-apiserver`                                      | At the top level, this is where `kubectl` connects to, as well as all the cluster based metrics, jobs, status updates and scheduling requests originate from. Also used for nodes to communicate to the master. | [kube-apiserver](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-apiserver/)                   |
| `etcd`                                                | Key value store of the cluster state, _fronted_ by the `kube-apiserver`. ETCD runs on the control plane nodes only.                                                                                             | [How does kubernetes use ETCD](https://www.techtarget.com/searchitoperations/tip/How-does-Kubernetes-use-etcd)        |
 | `kube-scheduler`                                      | Assigns pods to nodes, determines what nodes are available for placement of pods. Ranks each valid node and binds a pod to the node                                                                             | [kube-scheduler](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-scheduler/)                   |
| [`kube-controller-manager`](#kube-controller-manager) | A control loop that runs the _core_ controllers  (replication, endpoints, namespace, and serviceaccounts controller)                                                                                            | [kube-controller-manager](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/) |
| `node controller`                                     | Controls the lifecycle of nodes, their registration and status (`OutOfDisk`, `Ready`, `MemoryPressure` and `DiskPressure`                                                                                       | [What is a node](https://unofficial-kubernetes.readthedocs.io/en/latest/concepts/nodes/node/)                         |
| `ReplicationController`                               | Ensures the specified number of `pod replicas` are running at any given time.                                                                                                                                   | [ReplicationController](https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/)             |


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

---

## Kube-apiserver



??? info "The official definition of the `kube-apiserver` is"
    The Kubernetes API server validates and configures data for the api objects which include pods, services, replicationcontrollers, and others. The API Server services REST operations and provides the frontend to the cluster's shared state through which all other components interact.


The `kube-apiserver` is the primary management component of Kubernetes. 

When you issue a `kubectl` command, this is where the connection is made to. 

We don't actually _have to_ use kubectl, as kubectl is just a nice wrapper around making `HTTP/POST` request to any of the master nodes running the kube-aiserver

### Creating a pod (kube-apiserver example)

The below explains what happens when we do `kubectl create deployment nginx --image=nginx`

| Where it happens | What happens                                                                         | 
|------------------|--------------------------------------------------------------------------------------|
| Master           | Authenticate as a user                                                               |
| Master           | Validate the request (check request is valid, no feature gates etc)                  |
| Master           | Create pod Object                                                                    |
| Master           | Update `etcd`                                                                        |
| Master           | Update user that the pod has been created                                            |
| Master           | scheduler monitors the `kube-api` for changes                                        |
| Master           | sees a change of `+1 pod` with no nodes assigned                                     |
| Master           | Scheduler identifies a node to place the pod on, and communicates this to `kube-api` |
| Master           | `kube-apiserver` updates etcd                                                        |
| Master           | apiserver passes the information to the selected nodes kubelet on a *worker*         |
| Worker           | Kubelet creates pod on the node, instructs the CRI to deploy the image               |
| Worker           | CRE creates the image                                                                |
| Worker           | Updates kube-api                                                                     |
| Master           | kube-apiserver updates ETCD                                                          |

A similar pattern occurs each time anything is updated in the cluster

!!! note "Summary of Kubeapi"
    `kube-apiserver` is responsible for Authenticating and validating requests as well as retrieving and updating data in ETCD.

    In fact, `kube-apiserver` is the only _service_ that communicates with ETCD directly. Components like `scheduler`, `kubecontroller`, `kubelet` all use the `kube-apiserver`


### Viewing `kube-apiserver` configuration

We are able to view the configuration of the `kube-apiserver` on our cluster. Depending on how you provisioned the cluster, changes how you view the config.

=== "kubeadm"
    deployed as a pod called `kube-apiserver-master` in the `kube-system` namespace

    can view the config on `/etc/kubernetes/manifests/kube-apiserver.yml`

=== "Non Kubeadm"
    Can view the config at `/etc/systemd/system/kube-apiserver.service`

    can view the process of kube-apiserver by doing `ps -aus | grep kube-apiserver`

## Kube controller Manager

The Kube controller manager is a `daemon` that embeds `control loops` 

??? info "The official definition of the `kube-controller-manager` is"
    The Kubernetes controller manager is a daemon that embeds the core control loops shipped with Kubernetes. In applications of robotics and automation, a control loop is a non-terminating loop that regulates the state of the system. In Kubernetes, a controller is a control loop that watches the shared state of the cluster through the apiserver and makes changes attempting to move the current state towards the desired state. Examples of controllers that ship with Kubernetes today are the replication controller, endpoints controller, namespace controller, and serviceaccounts controller.

The sole job of the `kube-controller-manager` (KCM) is to run the various deployable resources and services in the cluster.

All the controllers (see [List of Controllers](cka-list-of-controllers.md)) are packed in to the `kube-controller-manager` 
which can be retrieved from `gs://kubernetes-release/release/v1.21.0/bin/linux/amd64/kube-controller-manager`

Enabling each controller is done using a feature gate under the option `--controllers` (See [Here](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/#:~:text=%2D%2Dcontrollers%20strings) for additional Documentation)

!!! tip "Faulty Controllers"
    If you have issues with the Controllers, there is most likely an issue with the `kube-controller-manager`

=== "kubeadm"
    you can view the file under `/etc/kubernetes/manifests/kube-controller-manager.yaml

    Pods show up as `kube-controller-manager-master` in `kube-system` namespace on the master node

=== "Non Kubeadm"
    you can view the service under: `/etc/systemd/system/kube-controller-manager.service`

    you can also view the running process using `ps -aux | grep kube-controller-manager`


An example of a controller is below

### Node Controller

The Node controller is to monitor the state of nodes, take actions and keep the applications they are running... Running.

This is done through the `kube-apiserver` (like everything).

!!! tip "Important numbers to remember"
    The kube-apiserver polls a node every **5 seconds**

    If a node does not reply in **40 seconds** it's marked as unreachable

    If a node does not come back in **5 minutes** the node is removed and workloads are rescheduled, only if the _deployment_ has an RS (Replica Set)

### ReplicationController

The replication controller is responsible for ensuring that the desired number of pod replicas are running at one time.

If a pod was to die, the ReplicationController is what is responsible for recreating the pods

??? info "The official definition of the `ReplicationController` is"
    A ReplicationController ensures that a specified number of pod replicas are running at any one time. In other words, a ReplicationController makes sure that a pod or a homogeneous set of pods is always up and available.

## Kube Scheduler 

`kube-scheduler` is a cluster control plane process that assigns pods to a node. (_note, this does not actually the run them on the node, see [Kubelet]()_)

The scheduler puts pods in a scheduling queue according to constraints (like CPU) and available resources on nodes. 


=== "Kubeadm"
    Runs as a pod on the master node
    `/etc/kubernetes/manifests/kube-scheduler.yaml`

=== "Non Kubeadm"
    Not sure, but probably going to be under `/etc/systemd/system/kube-scheduler.service`

    The config file for the scheduler exists under `/etc/kubernetes/scheduler.conf`


### Why do we need a scheduler? 

We need to ensure that the right pods are getting placed on the right nodes. 

An Example would be we need to run a pod on a node with a GPU, the scheduler makes sure that the pod will _land_ on a Node with a GPU attached.

### Scheduling Considerations

The scheduler looks at each pod and tries to find the best node for it.

#### Scheduling Phase 1: Filtering

Filtering step finds the nodes where it's possible to schedule the pod. If there are more than one, it moves on to phase 2

#### Scheduling phase 2: Scoring

1. Rank the surviving nodes from the [Filtering](#scheduling-phase-1-filtering) stage and assing a value to each node.
2. The score is assigned based on the active sorting rules (Default unless changed) 
3. If there are multiples, it picks one at random. 





<!-- Notes

Reposible for shceduling pods on nodes
Only responsible for deciding what pod goes on what node. Does not place the pod on the nodes. The Kubelete creates the pod.

An example is a port where the crane is the scheduler, it tells the captain it can expect a container, and then the captain (kubelet) decides where the pod goes. 

Why do we need a scheduler?
    We need to ensure that the right container ends up on the right node
    Example being a container needs epcific resoruces (taints and Tolerations)
    Make sure the containers are placed on the right nodes, depeding on certain critera

Scheduling considerations:
    Scheduler looks at each pod and tries to find the best node for it
    The Pod has a CPU and memory requirment.
    It goes in 2 phase:
        1. Tries to filter out the nodes that do not fit the criteria
        2. Ranks the nodes to identify the bet fit for the pod.
            Creates a score on each node on a scale of 1-10
            Calculates the free resoruces after the pod gets scheduled

The Scheduler is built in, but you can write your own one. 

Installing the Kube scheduler

Viewing the config




--->