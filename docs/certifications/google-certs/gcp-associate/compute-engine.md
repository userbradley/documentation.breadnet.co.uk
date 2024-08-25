---
title: Compute Engine
reviewdate: '2022-01-01'
---

#### HA

Live migration and availability policy

Your running instance is migrated to another host in the same zone

Does not change any attributes

Supports Local SSD's 

NOT supported for GPU;s

It's configured under Availability policy 

Default is to migrate 

You can also configure terminate and automatic restart. 

#### Custom machine types

You are able to create your own machine types and instance settings

You are billed per vcpu and memory provisioned 

#### GPU

You are able to add a GPU to your machines

They are good for AI/ML use

Should have GPU libraries 

Higher cost

Not supported on all machine types

Cant do live migration on GPU machines. Should be terminated instance. 

#### Important nat things to remember.

VMs are created underProjects 

Machine types and availability differ from region to region

You can only change a machine type after the instance has stopped 

VM's can be filtered on the page

They are Zonal so only run in a specific zone

Images are global and can be added to other projects if needs be

Templates are global unless you use zonal resources 

Automated Basic Monitoring
