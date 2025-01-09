---
title: GCP Costs
reviewdate: '2022-01-01'
---

When using the cloud you want to keep the costs as low as possible

#### Sustained use discounts

A sustained use discount is when you are using a machine for more than 25% of the month, you get 20-50% on every minute.

The discount increases the longer you use the machine.

No action required on your part.

Important restrictions!
Only applicable for GKE and Compute engine
Not applied on A2 and E2
Not applied to App Engine Flexible and Dataflow

####  Committed Use discounts

For predictable workloads

Committed to 1-3 years

Up to 70% discount dependent on machine type and GPU's

#### Pre-emptible vm's

Short-lived cheaper instances

Can be stopped by GCP at any time.

Maximum time you can run it is around 24 hours

You get a 30-second warning before

You use a pre-emptible VM if your application is fault tolerant

Workload is cost sensative

workload isn't immediate

No SLA

Cant be migrated to a regular VM

Free Tier credits don't apply

#### Billing

You are billed by the second after a minimum of one minute

You will want to create billing alerts under Billing > budget

You need to create a budget then an alert
