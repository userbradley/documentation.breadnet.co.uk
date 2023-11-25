---
title: Google cloud architect - page 3
---

# Google cloud architect - page 3

### Additional Services

#### Cloud Scheduler

*   Cloud Scheduler
    *   Fully managed cloud enterprise scheduling tool
    *   Batch, data jobs, cloud infra operations
    *   Integrates with:
        *   App engine, pub/sub, cloud logging, http endpoint
        *   Automatic endpoint
    *   Use case:
        *   Schedule a message on PubSub
    *   **Needs an app-engine app in the project**
        *   App Engine Cron Service
            *   Runs on top of this

#### Cloud DNS

*   DNS
    *   You can setup DNS management via GCP
    *   Public
        *   Web accessible sites
    *   Private
        *   Only accessible from a VPC or subnet

#### Pricing calculator

*   Pricing calculator
    *   How to estimate it?
    *   use the Google cloud pricing calculator
    *   Estimates for 40+ services
    *   These are just estimates

#### Anthos

*   Anthos
    *   Run your K8 cluster and on premise
    *   Multi-cluster management
    *   Consistent managed k8's
    *   Central config management
        *   Central git repo where it's managed from
        *   Logically grouping
            *   Environs
    *   Provides a service mesh
        *   Istio
        *   A/B testing
        *   Canary rollouts

#### Machine Learning

*   ML
*   Prebuilt ML
    *   No in house ML
*   Easy to use
*   Cloud AutoML
    *   Build custom ML models with developers having limited ML Expertise
*   AI Platform
    *   Help Data scientists build custom models (tensorflow) 
*   Data Management
    *   Big query ML
        *   can actually build models directly

#### Apigee

*   ApIgee
    *   Rest API
    *   Managing a REST API isn't easy
        *   Implimenting multiple versins of your API isnt easy
    *   Design secure and publish your API
    *   manage the complete lifecycle
    *   Provides AI powered monitoring
    *   Enable caching with cloudCDN
    *   Allows developers to access a simple development poeral

### Google Cloud architecture framework

#### Operational Excellence

*   Operational Exellence
    *   Monitor the business objectives
        *   SLA
        *   SLO
        *   KPI
    *   Test DR
    *   Increase software releases and veolcity
*   Business health
    *   Latency
    *   Traffic
    *   Errors
    *   Saturation
*   Logging
    *   Ensure efficient amount of logs
*   DR
    *   RTO
        *   Recovery time objective 
    *   RPO
        *   Recovery point objective
    *   Regularly test this plan
    *   Schedule a persistent disk snapshot and copy across regions
    *   Use cloudDNS

#### Security, Privacy and compliance

*   Plan security controls and privacy
*   Strategies
    *   implement least privilege
    *   Build a layered approach
    *   Automate deployment of sensitive tasks
*   Manage auth
    *   Follow IAM best practices
        *   Understand when to use a service account 
    *   Use organization policy service
        *   Allowing what can and cant be done in the account
*   Enable node-autoupgrade for GKE
*   Use GKE sandbox when running untrusted code
*   Secure the network
    *   Use a carefully desigend VPC
    *   Isolate workloads in to each VPC per project
    *   Can control ingress with Ingress and egress rules
    *   Use Network intelligence centre 
*   Use Object versioning 
*   Use DLP for sanitizing data 
*   Audit with Infrastructure logs

#### Reliability

*   Reliability
    *   Measrable goals
    *   Architect for HA, scale and automatic change managment
    *   Stratergies
        *   KPI, SLA, SLO
        *   Small changes
        *   Rollback 
        *   Instriment systems for observability
        *   Document and automate emergency responses
*   Degrade services gracefully
    *   Serve a static page when a site is down
*   Predict peak traffic events
    *   Scale and plan
*   Build flexible 
    *   Ensure all changes can be rolled back
*   Slow progressive rollouts
*   Build efficient alerting
*   Reducing mean time to detect (MTTD)

#### Performance and cost optimization

*   Use autoscaling and data processing
*   Try serverless options
*   Distribute load with a global LB
*   Identify apps to tune
    *   Cloud tracing
    *   cloud debugging 
    *   cloud profiler 
*   Analyze costs
    *   Export billing data to BQ
        *   Use google Data studio
        *   Use preemptible vms for non-critical fault tolerant vms 

[![image-1621117434743.png](/assets/48hjeTKxj568yycW-image-1621117434743.png)](/assets/48hjeTKxj568yycW-image-1621117434743.png)
