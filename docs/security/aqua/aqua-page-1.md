---
title: Aqua - Page 1
reviewdate: '2026-12-20'
---

#### Introduction

Aqua has a market around the security of cloud deployments due to the lack of full stack control, down to restructuring  and refactoring.

Cluster Hygiene

Image Hygiene

Limit blast radius

Attack prevention

RBAC

CIS

MINIMAL OS

Vulnerability can

Approved base images

Run only on trusted images

Least privileges

Service mesh encryption and auth

Container Sandbox

Container Immutability

Anomaly detection and prevention.

The issue from the cloud shift is the lack of knowledge of what and where to secure.

You need to be asking how you can continuously be checking security and where things can be secured.

Different enviroments, same rules

* Risk mitigation, vulnerabilities  and integrity
* Deployment authorization, visibilty, inventory
* Operation admin and change control
* Secret management
* Network segmentation of microservices
* SOC and audit-ibility and incident response

How can aqua help?

* Cloud Native focus
* Opensource
* Built for enterprise scale
* Broad platform support
* Customer Partnership

* * *

#### Module 2: Cloud Native Security building blocks

* What are the cloud native building blocks
* How to secure the build

We want to be introducing the security at the build level, so building the security in to the deployment from the start.

Ensuring that the underlaying infrastructure is secure

Securing the workloads

##### The Challenges

* Securing builds
  * Known vulnerabilities
  * Malware
  * Configuration
  * Sensitive Data
  * Non-approved software
* Securing infrastructure
  * Security Configuration
* Vulnerabilities
* Missing Patches
* Access control
  * RBAC
  * Leas privileges possible
* Security Posture Management
  * Malicious Activity
  * Changes to the image running things that weren't meant to be accessed
  * Strange network activity
  * Intrusion Prevention
  * Segmentation
  * Containing the risk
  * Damage control
    * Limited exposure and the scope of the issue
* Drift prevention
  * Make sure that run time builds are enforced and that containers are Immutable
  * Event Auditing
* Securing the build
  * Scans all build artifacts for vulnerabilities, secrets bad config, malware and permissions
  * Prioritize issues based on application contextual risk
  * Detects hidden malware and prevents supply chain attacks
  * Flexible assurance policies to flag and block bad artifacts
* Application Assurance
  * Integrate Aqua in the build process
  * Applying assurance policies to stop builds of images that do not follow best practices
  * Integrates with all CICD
* Vulnerability lifecycle management
  * Determine the actions

##### Aqua vShield

(Requires additional license)

* Aqua vShield is a virtual patching mechanism

  * #### Detects and prevents exploits of known vulnerabilities

* Does not change image code or require and dev intervention
* Acts as a compensating control
  * Will temporarily apply a policy to that runtime, to prevent malicious code running

##### Dynamic Image Inspection (Aqua DTA)

License per scan

* Run containers in a sandbox env
* Identify container behavior at runtime
* Identify malicious behavior based on heuristics maintained by Aquas research team.
* You can do image profiling
* Image is marked as `Non-compliant`

The run is done after the container is built, depending on the outcome, you can set a runtime protection that prevents the container from running.

DTA will run the image for you, and observes what the image does (Runs on AQUAS infrastructure, no offline functionality, nor on client infrastructure)

#### Securing the infrastructure

* Asses and audit the security
* Single pane of glass view across clouds (Including orcale)
* Get remediation advice or set automated remediation for out of policy service configurations

#### K8, docker and CIS benchmarks

* Runs cheks aginst all 100\_ cis tests
* Provides scored report
* Schedule to run daily
* CIS certified
* Answers the question:
  * Is my infa secure

#### Kube-hunter: Integrated k8s penetration testing

* tests clusters against real world attacks
* Get risk assessment
* Runs both in passive or active mode, as an external unauthorized user, or with in a pod as an authorized user

#### Securing the workload

* Visualize and prioritize risks in the environment
* Wide array of purpose built enforcers
  * Provides granular visibility
* Drift prevention
* _'Workloads firewall'_ micro-segment apps where they run
  * Sounds similar to a service mesh
  * Don't plan on replacing the mesh rules, just boosting them

#### Enforcing Immutability

* Ensuring the workloads don't change
* Immutable workloads are easier to protect
* Any change in runtime are not legitamate
* If a change is detected, it's blocked

#### Behavior whitelisting

* Aqua uses activity profiling to learn workload behaviour during testing
* Whitelist only capabilities
  * Files
  * syscalls
  * network connections
  * Executable

#### Network Firewall

* Apply firewall rules for contextual application micro-segmentation
* Rules based on Service:
  * DNS
  * Identities
  * URL's
  * Ip address
  * Reputation
* Alert on or block

#### Risk Explorer

* Enforcer automatically records

#### Serverless security

* Seamless attach aqua nano enforcer to serverless functions
* Provides visibility and prevention capabilities

Performance optimized for Serverless:

* Minimal impact function on start time (2ms) and memory use (2mb)
* Language agnostic

#### Opensource tools

* [Trivy](https://github.com/aquasecurity/trivy)
  * Scanning
  * Manages vulnerability
  * Detects vulnerabilities in
* [Cloudsploit](https://cloudsploit.com/opensource)
  * Enforces cloud compliance
  * Supports aws azure gcp oracle and GitHub
  * Extensive plugin
  * Restful ASPI
* Kube-bench
  * Securely configure your k8 cluster
  * Auto-detects per node
  * Customisable though yaml
* Kube-hunter
  * test your k8 setup
  * Penetration testing that simulates dozens of attack vendors
* tracee
  * Runtime security
  * eBPF technology
  * Trace your system and applications at run time

### Module 3

#### Architecture

Aqua sec is made up of 3 items

* Server, UI, Console
* Database
* Gateways

The server and the gateways live close together

Database should be on a cloud database, customer managed

The database is the most important part

This can deal with up to 20k hosts on this solution

This can run on K8, docker

##### Database and Cybrecentre

* Don't compromise the database
* All the configuration is stored in the database
* Policies, user roles are stored here
* Needs to support postgesql (Cloud sql supports)

##### Aqua Cybercentre

* Can be used locally, but on a daily basis it's updated so needs to be pulled
* Runs on cloud
* Possible to run on an air-gapped infrastructure

##### Gateway

* All the aqua enforcers connect to the gateway
* Handles communications between the aqua server
* Must be a **minimum** of one
* Communicates over grpc (https)
* Handles all interactions
*  Can go through envoy proxies
  * Can load balance GRPC connections
  * When doing an update it terminates at envoy so no disruption
  * [Uses a headless service](https://kubernetes.io/docs/concepts/services-networking/service/#headless-services)

Tennant manager is for avoiding cross region data tranfers

#### Aqua Scanners

* Primary foundation of the aqua scanner is to scan the follwing objects:
  * Container images
  * Cloud Foundry
* 2 main roles:
  * Object scanning is supported by the cyber centre, who maintain data on vulnerabilities
  * Secondary function include registering the container image
* All calls are done via API's
* What it can scan:
  * Registries
    * Images that hace been pushed to public and private regs
  * Local host
    * Scan images that are created locally before being pushed
  * xRunning workload images
    * Images used previously as well as running workloads

As soon as you deploy the platform, there is a scanner that is deployed in the web server, but the second the scanner is installed then the internal one is disabled
You are also able to scan other files using the scanner, running as a binary.

##### Enforcers

* Provide run time security
* Enforce runtime
* Ensure only compliant images are schedules

Can be installed on both Linux and Windows

Micro enforcer:

* Installed within in the Image
* Can be embedded in the image that you want to protect
* Only supported on Linux

Kube Enforcer

* Runs as an admission controller and deployed as a pod on a single node in a cluster

Examples of security:

* Block image found to be non-compliant
* Unrestricted images
* OPA custom checks
* Additional License

##### Pod Enforcer

* Enforcer that dynamically injects a sidecar in to the k8 pod
* Enforces a few basic runtime policies like drift prevention
* More limited functionality
* Important:
  * Aqua pod enforcer is supported only on linux

##### VM Enforcers

* Provides enforcement for hosts
* Ensure:
  * Host assurance policies
  * Host runtime policies
  * Firewall policies
* Important notes:
  * Supported only on Linux
  * It's required that you deploy vm enforcer on each host
  * Vm enforcers require a separate license

##### Nano enforcer

* Nano enforcer is a dedicated bianty for AWS Lambda functions
* Runtimes policies provide runtime protection for AWS Lambda functions
* Things to note:
  * Aqua Node-enforcer is supported on Linux platforms only

#### Enforcers

* There are groups
* Enforcer group should only be used to group by:
  * Type
  * Scope
    * Profile
  * Can be used to filter traffic, what to capture data about and what to ignore

### Module 4: Installation and Configuration

##### Checking Release notes

* Check the release notes
* They are not following version releases properly
* They support backwards 2 major releases
  * If you're in 5.3, and want 6.0, it won't work very well
* Major releases are quarterly

#### Methods of deployment

* Helm
* Docker
* Manifests
* Openshift Operator
* Aquactl

#### The general deployment flow

1. Create namepsace
2. create registry
3. configure rbac
4. configure aqua secrets
5. create cm
6. configure htt\[s
7. are you using package bd
    1. Yes
        1. create db
        2. configure db
        3. deploy main package
    2. No
        1. Deploy with main components
8. Expose with envoy
9. Deploy aqua

Always pin it to a version

#### Scanner User

The scanner needs to be created as a user, you will need to create a user as it connects to the API

#### Image Assurance

Assurance = Before running

* Basics of image assurnace
* What image scanning is avalible
* What are image assurance policihes
* Use case of image assurance

Detects, asses and reports security in the images. Scanning can be done locally

##### Image assurance Activity

* Scanning images
* Evaluation of images
* Reporting info in the UI
* Risk Managment  

##### Scanning

* CICD
* Image
* Hosts

Image scanning as well as artifacts

##### Image scanning Details

* Can check if you've left a container with a key in it.
* Checks for Certificate files

##### Image Assurance Policy

* Default policy
  * Always present, cant be deleted
* Custom policy

##### Vulnerability Scoring

You can pick a slider or a set value for the severability on how bad you will allow to run in the container

## Module 6: Runtime policy

##### What are the policies

* * Container
* Host
* Function
* What makes up a policy

##### Policy components

* Application scope
  * Set of containers
  * Set of hosts
  * Set of clusters
* Status: Enabled or disabled
* Enforcment mode: How it handles the container and violations
* Controls
  * Security related policies

* Default Policy
  * Cant be deleted
  * Always present
  * If you want sometihng not to apply in a scope, you can use bypass control
* Custom Policy
  * Created by Aqua admins for specific scopes

These policies can be used to prevent containers from running

They are only applied when using an "Enforcer"

##### Compliance

* CIS
* HIPAA
* NIST
* PCI DSS

##### Commonly used container contorls

* Bypass scope
* Block volumes
* Drift prevention
* Block unregistered images
* Block non-compliant images
