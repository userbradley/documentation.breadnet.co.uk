---
title: Networking and LB
reviewdate: '2022-01-01'
---


You get an internal network, and an external. You cant have 2 resources with the same IP address
However you can have separate resources with the same IP address if they are internal

You need at least one IP address per VM, internal or External

To get a static IP you can assign a static IP to the VM, but you will want to use a Load balancer

You are then able to reserve an IP address and then move it between multiple VM's

The IP address stays attached even once you stop the instance.

You are billed for a resource when you are even not using one
