---
title: Google Compute Engine
reviewdate: '2026-12-20'
---



In datacenters, applications are deployed to Physical machines, whereas in the cloud we provision a virtual server.

We use Google compute engine which allows us to manage the lifecycle of VM's

Allows you to manage Load balancing and Auto scaling for them.

Allows you to also manage the network connectivity

For the example we will create instances and an LB

Creating a machine is simple, pick your region, size and if you want the simple firewall rules

The Instance names are built logically:

`e2-standard-2` is:

`e2`: Machine family

`standard`: type of workload

`2`: Number of CPU's

Memory disk and networking increase with vcpu increase

There are many images on GCP.

We have access to many public images
We are also able to make custom images
