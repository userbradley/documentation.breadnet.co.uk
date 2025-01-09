---
title: Aqua - Page 2
reviewdate: '2022-01-01'
---

Module 7
--------

* Services
    * Comprises the following
        * Enforcement mode:
            * How aqua handles the policy
* Firewall
    * Logical groups if workloads
* Defined by scope of service
* main purpose is to apply one or more firewall policies
    * Policies contain rules
* Can add rules in 2 ways
    * Add firewall rules though the UI
    * View during running then lock down

Module 8: Secrets
-----------------

* How to integrate with existing key store
* How to inject it in to the workload

* Central management
* Automatically injects in to running container
* Secrets are encrypted in transit

Secrets need to be added as an env variable, image needs tags

    spec:
          containers:
          - env:
            - name: bradley
              value: '{aqua.bradley}'

Module 9: Serverless
--------------------

GCP is supported when scanning before run

Only AWS supports runtime protection

How it protects:

* Secures serverless functions at run time
* Runtime assurance
    * Nano-enforcer allows Aqua to carry out runtime protection
    * Does not work for GCP

Module 11: Aqua-api and aquactl
--------------------------------

* Aquactl can be used to inject nano-enforcers as well as
* Download Manifests

Module 12: Aqua for dev
-----------------------

* Before building, understand the use case

* Evaluation:
* Make use of opensource tools
* Can you use the API

Validation

* Check audit/ci
* check running containers
* Check risk explorer to get high level overviews

Module 13: Aqua for Admin
-------------------------

##### Upgrading

* Database and vm enforcers are required for the same version
* backwards compatible :
    * Enforcers and vm enforcers up to 2 versions
    * Micro enforcers and kube enforcers: 1 Major version
