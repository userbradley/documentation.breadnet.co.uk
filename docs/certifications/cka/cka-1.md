---
title: CKA - Page 1
---

## What is Kubernetes

Kubernetes is a container orchestration platform that is designed to [Scale to the planet](https://kubernetes.io/#planet-scale). It achieves this using a number of
somewhat independent stacks of technology, like [etcd](#etcd) and nginx.

This and all other pages are my study notes for the CKA exam.

## Additional Study Resources

Code for exam reduction: `DEVOPS15`

GitHub for additional stuff: [kodekloudhub/certified-kubernetes-administrator-course](https://github.com/kodekloudhub/certified-kubernetes-administrator-course)

## Kubernetes Architecture

Kubernetes hosts your application in an automated fashion.

It's designed that applications can be both segmented logically, and allowed to communicate.

## Container runtime

In order for nodes (Both master and workers) to be able to run [Pods](#pods) we need to have a `CR` (Container runtime).

A CR is the software installed on the nodes that allow containers (Docker containers) to be run. A few examples of common Container runtimes are below

* [containerD](https://containerd.io)
* [CRI-O](https://cri-o.io)
* [Docker engine](https://docs.docker.com/engine/)
* [Mirantis Container Runtime](https://www.mirantis.com/software/container-runtime/)

The CR communicates to the [`CRI`](#container-runtime)

### Container Runtime Interface (CRI)

The CRI is a plugin interface which enables the [Kubelet](#kubelet) to use a wide variety of Container runtimes without the need to recompile the cluster components.

!!! Note "Where it's required"
    The CRI and CR are required to be on each node.

## Nodes

Kubernetes is split into 2 node types

* [Master](#master) - Responsible for managing the cluster
* [Workers](#workers) -  Responsible for running the containers (nae; workload)

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
| Master           | apiserver passes the information to the selected nodes kubelet on a _worker_         |
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

* [For custom scheduling see Scheduler](#scheduler)

`kube-scheduler` is a cluster control plane process that assigns pods to a node. (_note, this does not actually the run them on the node, see [Kubelet](#kubelet)_)

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

!!! note "A note on schedulers"
    Kubernetes ships with one by default, but you are able to write your own.

## Kubelet

Kubelet is responsible for registering the Worker node with the Masters.

It receives jobs (Like placing a pod) and passes that on to the CRE. These are _requested_ by _Scheduling Events_

It tells the CRE to pull the docker (or OCI) image, and then reports the status back to the masters on a regular basis.

=== "Kubeadm"
    It's not installed by default, so you have to install it

=== "Non Kubeadm"
    _Not confirmed_

## Kube Proxy

Kube proxy is responsible for all the _workload_ based networking.

It handles (non-exclusive list):

* Inter-pod networking
* Inter-pod-node networking
* Services IP networking communication

It does this by running a pod on each node (using a DaemonSet) which then adjusts iptables rules on the nodes.

The job of the Kube proxy is to look out for new services that have been scheduled and _host_ them

The `kube-proxy` needs to be installed, and run as a daemonset on all the nodes.

It's called `kube-proxy-<uuid>` and runs in the `kube-system` namespace

### Pod networking

Pod networking (we will touch on this in more depth later) uses a network that spans all nodes. Pods then get

### Accessing a service

When a `kind:Service` is created, an IP address gets assigned to the nodes (Not exactly, but this is the best way to think about it)

When a request for that `kind:Service` is made, the node accepts the traffic, and forwards it on to the serving pod.

## Pods

### What are pods

Pods are the smallest deployable item of _compute_ on a Kubernetes cluster.

Pods are made up of containers. Usually it's just one container, however it can be multiple.

!!! info "Note on multiple containers per pod"
    Only deploy multiple containers per pod if they are very tightly coupled. A good example would be apache2 and php-fpm (if memory serves me well.)

    Another good example is in GKE, we are able to deploy the Google cloud SQL proxy along side the container to access the Database without having to use IP address'

When we deploy an application, we are effectively deploying a collection of pods.

### How to scale the application

When your application is deployed in pods, to scale the application we <u>**do not**</u> add more containers to a pod,
instead we add more pods to the cluster.

We can use a [Deployment](#deployment) as well as HPA to scale the deployment manually and automatically.

### Networking and storage

Due to how kubernetes uses the underlying Kernel, and then Networking Namespaces, containers that are in the same pod share `localhost`

*[Networking Namespaces]: A network namespace is a logical copy of the network stack from the host system. Network namespaces are useful for setting up containers or virtual environments. Each namespace has its own IP addresses, network interfaces, routing tables, and so forth.

Containers in the same pod share storage mappings, so we can map storage to 2 containers in a pod, and they have rw access, without having to do anything special

### Creating a pod

We can create a pod using both [kubectl](../../kubernetes/kb/kubectl-commands.md) and `manifest` files.

#### using kubectl

```shell
kubectl run nginx --image nginx:latest
```

If we break the command down:

* kubectl: Kubernetes command line tool
* run: telling the cluster to run something
* `nginx`: name of the pod
* `--image` Name of the image to run, from the [public docker registry for nginx](https://hub.docker.com/_/nginx)

#### Using Yaml to create a pod

We are able to use a Data Serialization language called Yaml

*[Yaml]: YAML is a data serialization language that is often used for writing configuration files. Depending on whom you ask, YAML stands for yet another markup language or YAML ain't markup language (a recursive acronym), which emphasizes that YAML is for data, not documents.

Below is an example Pod

```yaml
apiVersion: v1 # (1)!
kind: Pod # (2)!
metadata: # (3)!
  name: my-app # (4)!
  namespace: test # (11)!
  labels: # (5)!
    app: my-app # (6)!
spec: # (7)!
  containers: # (8)!
    - name: nginx # (9)!
      image: nginx:latest # (10)!
```

1. The version of the Kubernetes API you plan to use. Designed to allow for backwards compatibility
2. What type of Object you're creating. In this case, a Pod
3. Data that helps uniquely identify the object
4. Name of the `Pod` **Not optional** to include
5. `Key Value` pairs attached to the `pod` to identify it, and are defined as `identifying attributes of objects that are meaningful and relevant to users`
6. User applied label **Optional**
7. Desired state of the Object you are creating
8. List of containers to create in the `pod` as we can [have multiple containers in a pod](#what-are-pods)
9. First item in the list by definition of `name`
10. Image as found on the [public docker registry for nginx](https://hub.docker.com/_/nginx)
11. Namespace to deploy the `Pod` in to **Optional**

## Deployment

Deployments are the easier means to manage Kubernetes applications. You are able to describe your deployment in YAML, and then kubernetes
automatically manages the Replica set that manages the pods.

You would use a Deployment over an RS (Replica Set) as it allows you to do things like:

* Rolling Updates
* Rollbacks

Below shows how Deployments interact with ReplicaSet and pods.

``` mermaid
flowchart TD
Deployment --> ReplicaSet --> Pods --> Containers
```

## Services

Services enable communication with various components inside and outside the cluster.

They are used to connect applications together in loosely coupled microservices, as well as getting user traffic in to the cluster

Below shows how services can work

``` mermaid
flowchart LR
A[Users] --> B[Service]
B --> C[Pods]
C --> D[Service]
C --> E[Backend Service]
D --> F[Pods]
E --> G[Pods]
G --> H[Database Service]
H --> I[Database ]
```

A service is a deployable piece of architecture in Kubernetes, in the form of `iptables` not actual compute.

There are several types of `Services`:

* ClusterIP
* NodePort
* LoadBalancer

Using a service we can access other services across namespaces as per the below diagram

```text
   * ------------------------------------- Name of the service as defines in the metadata.name field
   |           * ------------------------- Name of the namespace, In this example it's my-namespace
   |           |         * --------------- Denotes it's a Service
   |           |         |   * ----------- Incase you forget you're in a clluster
   |           |         |   |       * --- Suffic
   |           |         |   |       |
my-service.my-namespace.svc.cluster.local
```

### ClusterIP

The service type `ClusterIP` is most commonly used for internal traffic between different _microservices_ as the IP address is _registered_
in side the cluster and is not really designed for external access.

In the below diagram, you can see where it's useful to use a service

``` mermaid
flowchart TB
AA[Load Balancer] --> A & B & C
A[web pod 1] & B[web pod 2] & C[web pod 3] --> D[back-end]
D--> E[Backend pod 1] & F[Backend pod 2] & G[Backend pod 3] --> H[redis]
H --> I[Redis pod 1] & J[Redis pod 2] & K[Redis pod 3]
```

This allows us to scale each layer up and down, move it between clusters etc. and not have to update any IP address'

Secondly, using a service here means we can call it my DNS name, so each service gets a dns entry like the below

We are able to create a service with the below:

### Example of a ClusterIP

```yaml
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    app: my-cs
  name: my-cs
spec:
  ports:
  - port: 5678
    protocol: TCP
    targetPort: 8080
  selector:
    app: my-cs
  type: ClusterIP
```

### NodePort

The Service type `NodePort` allows us to _publish_ a port on the kubernetes nodes themselves.

!!! note "Numbers to remember"
    The ports can only be allocated **between** *_30000_ and **32767**

When a type `NodePort` is exposed, traffic needs to be sent to the IP address of the nodes, along with the port.

Assuming a worker node is on the IP address `192.168.69.2` we would do

#### Example of a NodePort

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  type: NodePort
  selector:
   name: MyApp
  ports:
    # By default, and for convenience, the `targetPort` is set to the same value as the `port` field.
    - port: 80
      targetPort: 80
      # Optional field
      # By default and for convenience, the Kubernetes control plane will allocate a port from a range (default: 30000-32767)
      nodePort: 30007
```

```shell
curl http://192.168.69.2:30008
```

### LoadBalancer

This is only really used on cloud providers.

If you are not running on a cloud provider, it will act like [Node Port](#nodeport)

## Scheduler

### Manual Scheduler

If you do not have any scheduling installed on your cluster, you are able to set up scheduling your self.

This is known as the Manual Scheduler.

To schedule pods manually, you will need to know the name of the node.

Below is an example manifest that schedules the pod to the node `node02`

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  nodeName: node02
  containers:
    - name: nginx
      image: nginx
```

When there is a scheduler enabled on a cluster, this field is automatically set once the pod has been scheduled.

Due to how scheduling works, you are only able to apply this on creation, and cant change the node placement of a pod via an update.

You have 2 options

1. Delete the pod, update the file and do it again
2. Use the API

#### Updating scheduling using the api

We are able to write a `Binding` manifest like the below, convert it to json and then post it to the `kube-api`

Endpoint: `POST` : `/api/v1/namespaces/{namespace}/pods/{name}/binding`

```yaml
apiVersion: v1
kind: Binding
metadata:
  name: nginx
target:
  apiVersion: v1
  kind: Node
  name: node02
```

We then need to convert this to JSON, ideally use an online web converter, but you can also use `yq` cli

```shell
➜ yq . binding.yaml
{
  "apiVersion": "v1",
  "kind": "Binding",
  "metadata": {
    "name": "nginx"
  },
  "target": {
    "apiVersion": "v1",
    "kind": "Node",
    "name": "node02"
  }
}
```

We then need to flatten this, so it's like the below

```json
{"apiVersion":"v1","kind":"Binding","metadata":{"name":"nginx"},"target":{"apiVersion":"v1","kind":"Node","name":"node02"}}
```

We are then able to post this to the endpoint.

As you can see from the manifest file, we don't have any target pods, this is because it's applied to the pod via the API

```shell
curl --header "Content-Type:application/json" --request POST --data '{"apiVersion": "v1","kind": "Binding","metadata": {"name": "nginx"},"target": {"apiVersion": "v1","kind": "Node","name": "node02"}}' https://$SERVER/api/v1/namespaces/$NAMESPACE/pods/$PODNAME/binding/
```

Taking apart the URL gives us the below

```text
https://$SERVER/api/v1/namespaces/$NAMESPACE/pods/$PODNAME/binding/
```

* `$SERVER` : IP/ URL of the Kube API server
* `$NAMESPACE` : Namespace the pod exists in
* `$PODNAME` : Name of the pod we want to apply the binding to

More details can be found [on the documentation for the Binding API](https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/binding-v1/)

## Labels and Selectors

Labels and Selectors are an imperative part of Kubernetes. They pave the way for just about everything that _connects_ to anything else

In the below Example, we have added `Labels` to a Pod

!!! note "`metadata.labels` are just for humans"
    Adding labels under `metadata.labels` are purely for the operator (usually a human), in order for kubernetes to use them they
    need to go under:

    * `spec.selector.matchLabels`
    * `template.metadata.labels`

    And they have to match 1:1

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: simple-web
  labels:
    app: simple
    function: front-end
spec:
  containers:
    - name: simple-web
      image: nginx
      ports:
        - containerPort: 8080
```

We are then able to get this pod using the below `kubectl`

```shell
kubectl get pods --selector app=simple
```

Below shows what we were talking about in the Info box, about how to target `objects` using labels

We need to use  `spec.selector.matchLabels` and `spec.template.metadata.labels`

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: simple-webapp
  labels:
    app: App1
    function: front-end
spec:
  selector:
    matchLabels:
      app: App1
  template:
    metadata:
      labels:
        app: App1
        function: Front-end
    spec:
      containers:
        - name: simple-webapp
          image: nginx
```

## Annotations

Another field that exists on most manifest files are `Annotations`, which live under `metadata`

These are user and Kubernetes added filed that can be used by other systems as well as operators to track down information about
something.

Examples of their use are below:

* Team Responsible
* Build Version
* Deployment tool
* Release Number
* [GKE Workload Identity](https://documentation.breadnet.co.uk/kubernetes/gke/service-account-with-workload-id/)

## Taints and Toleration's

??? note "Attracting pods to nodes"
    Taints and tolerations stop pods being scheduled on a node, whereas [Node affinity](#node-affinity) is a property of Pods that attracts them to a set of nodes

Taints are the opposite -- they allow a node to repel a set of pods.

Tolerations are applied to pods. Tolerations allow the scheduler to schedule pods with matching taints.

Assume the following:

* `A bug` is a `pod`
* `A Person` is a `Node`
* `Bug Spray` is a `Taint`
* `Genetic Mutation` is a `Toleration`

The example is as:

* The bugs normally flock to humans to suck their blood
* We can spray Bug Spray on to human to stop the insects from being attracted to them
* After a while of humans wearing the bug spray, the insects have a genetic mutation, so they can **tolerate** the spray

If you take this example back to the real world:

* We apply a taint to the nodes so pods cant get scheduled on it
* If we want a pod to be able to schedule on to that node, we give the pod a toleration

An example would be we have a node that has a GPU attached to it, and we only want pods that need a GPU to be scheduled to it

We would apply the taint `gpu` to it. Now any pod that tries to get scheduled to this node will _bounce_ off it

### Apply a taint

There are 3 different types of taints, [NoSchedule](#noschedule), [PreferNoSchedule](#prefernoschedule) and [NoExecute](#noexecute)

Below is the base for the taint command

```shell
kubectl taint nodes node-name key=value:taint-effect
```

The below example applies the [`NoSchedule`](#noschedule) to `node-01` for the taint `gpu=enabled`

```shell
kubectl taint nodes node-01 gpu=enabled:NoSchedule
```

### View taints on nodes

```shell
kubectl describe node <master> | grep taint
```

You will see something like:

```text
Taints:   node-roles.kubernetes.io/master:NoSchedule
```

### Removing a taint

You are able to remove a taint by appending `-` to the end of the taint command

Example of removing the `control-plane:NoSchedule` would be

```shell
kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-
```

As explained we have 3 types of taints we can apply, they are described below

### NoSchedule

Pods will not be scheduled to the node

Running pods continue to run

### PreferNoSchedule

Pods **are not** scheduled to the node if at all possible. It will do it's best to avoid it.

Running pods continue to run

### NoExecute

Pods are evicted from the node if already running and will not be scheduled on to the node ever (unless it has )

This taint affects pods that are already on the node, and evicts them.

### Example of Pod that has tolerations

_**Note:** You need to have the values quoted in `"`_

```yaml
apiVersion: v1
kind: Pod
metadata:
  namespace: myapp-pod
spec:
  containers:
    - name: nginx-container
      image: nginx
  tolerations:
    - key: "gpu"
      operator: "Equal"
      value: "enabled"
      effect: "NoSchedule"
```

!!! note "Interesting fact"
    Master nodes can still run workloads, they just have taints on them, so you can create workloads that tolerate them!
    ```text
    Taints:   node-roles.kubernetes.io/master:NoSchedule
    ```

## Node Selectors

Node selectors allow us to schedule pods on to nodes that have **already** been labeled

In our pod spec we would add the below

```yaml hl_lines="7 8"
kind: Pod
apiVersion: v1
metadata:
  name: Pod
  namespace: test
spec:
  nodeSelector:
    size: large
  containers:
    - name: bradley
      image: "bradley:cool"
```

### Limitations of Node Selectors

We don't get the creature comforts like:

* Either
* Anything but

This means if we have 3 nodes, ranging from Small, Medium and Large. We cant say "Use either Big or Large" and we can't say "Anything But small"

In Order to get around this, we can use [Node Affinity](#node-affinity)

## Node Affinity

Node affinity allows us to _assign_ pods to nodes by using their labels.

It gives us some additional niceties that [Node Selectors](#node-selectors) don't have.

Below is a comparison

=== "Node Affinity"

    ```yaml hl_lines="9-17"
    apiVersion: v1
    kind: Pod
    metadata:
      name: bradley
    spec:
      containers:
        - name: bradley
          image: bradley
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
              - matchExpressions:
                  - key: size
                    operator: in
                    values:
                      - Large
    ```

=== "Node Selector"

    ```yaml hl_lines="7 8"
    kind: Pod
    apiVersion: v1
    metadata:
      name: Pod
      namespace: test
    spec:
      nodeSelector:
        size: large
      containers:
        - name: bradley
          image: "bradley:cool"
    ```

Under the `spec` field, you have affinity, which looks like a sentence.

```
requiredDuringSchedulingIgnoredDuringExecution
```

### Affinity types

There are currently 2 types of Affinity types, and one that is perhaps coming soon:

* `requiredDuringSchedulingIgnoredDuringExecution`
* `preferredDuringSchedulingIgnoredDuringExecution`

#### requiredDuringSchedulingIgnoredDuringExecution

This means that the operators that follows are required or the pod does not get scheduled.

#### preferredDuringSchedulingIgnoredDuringExecution

This means that the operators that follow are more of a _nice to have_ and the pod will still get scheduled, but it will do it's best first.

This means that the config that follows is **required** during scheduling

### Operators

* In
* NotIn
* Exists
* DoesNotExist
* Gt [See #39256](https://github.com/kubernetes/website/issues/39256)
* Lt [See #39256](https://github.com/kubernetes/website/issues/39256)

#### In

The Operator `in`  allows you to pick from a list.

```yaml
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
              - matchExpressions:
                  - key: size
                    operator: in
                    values:
                      - Large
                      - Medium
```

#### NotIn

Allows us to pick from a list that excludes something, and prefferes the rest

```yaml
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
              - matchExpressions:
                  - key: size
                    operator: NotIn
                    values:
                      - Small
```

The above example will schedule the pod on any node, as long as it doesn't have the label `size=Small`

#### Exists

This operator just checks if the node has the labels attached to it. You don't need the values as they aren't being compared

```yaml
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
              - matchExpressions:
                  - key: size
                    operator: Exists
```

#### DoesNotExist

This operator just checks if the Label `Size` does not exist on the node

```yaml
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
              - matchExpressions:
                  - key: size
                    operator: DoesNotExist
```

#### Gt

[See #39256](https://github.com/kubernetes/website/issues/39256)

#### Lt

[See #39256](https://github.com/kubernetes/website/issues/39256)
