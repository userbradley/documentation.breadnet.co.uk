---
title: Google cloud architect - page 3
---

# Google cloud architect - page 3

<h3 id="bkmrk-additional-services">Additional Services</h3>
<h4 id="bkmrk-cloud-scheduler">Cloud Scheduler</h4>
<!--suppress ALL -->

<ul id="bkmrk-cloud-scheduler-full">
<li>Cloud Scheduler
<ul>
<li>Fully managed cloud enterprise scheduling tool</li>
<li>Batch, data jobs, cloud infra opertaions</li>
<li>Integrats with:
<ul>
<li>App engine, pub/sub, cloud logging, http endpoint</li>
<li>Automatic endpoint</li>
</ul>
</li>
<li>Use case:
<ul>
<li>Schedule a message on PubSub</li>
</ul>
</li>
<li>
<strong>Needs an app-engine app in the project</strong>
<ul>
<li>App Engine Cron Service
<ul>
<li>Runs on top of this</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-cloud-dns">Cloud DNS</h4>
<ul id="bkmrk-dns-you-can-setup-dn">
<li>DNS
<ul>
<li>You can setup DNS management via GCP</li>
<li>Public
<ul>
<li>Web accessable sites</li>
</ul>
</li>
<li>Private
<ul>
<li>Only accesible from a VPC or subnet</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-pricing-calculator">Pricing calculator</h4>
<ul id="bkmrk-pricing-calculator-h">
<li>Pricing calculator
<ul>
<li>How to estimate it?</li>
<li>use the google cloud pricing calculator</li>
<li>Estimates for 40+ services</li>
<li>These are just estimates</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-anthos">Anthos</h4>
<ul id="bkmrk-anthos-run-your-k8-c">
<li>Anthos
<ul>
<li>Run your K8 cluster and on premise</li>
<li>Multi-cluster management</li>
<li>Consistent managed k8's</li>
<li>Central config managment
<ul>
<li>Central git repo where it's managed from</li>
<li>Logically grouping
<ul>
<li>Environs</li>
</ul>
</li>
</ul>
</li>
<li>Provides a service mesh
<ul>
<li>Istio</li>
<li>A/B testing</li>
<li>Canary rollouts</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-machine-learning%C2%A0">Machine Learning </h4>
<ul id="bkmrk-ml-prebuilt-ml%C2%A0-no-i">
<li>ML</li>
<li>Prebuilt ML 
<ul>
<li>No in house ML</li>
<li>Easy to use</li>
</ul>
</li>
<li>Cloud AutoML
<ul>
<li>Build custom ML models with developers having limited ML Expertise</li>
</ul>
</li>
<li>AI Platform
<ul>
<li>Help Data scientists build custom models (tensorflow) </li>
</ul>
</li>
<li>Data Managment
<ul>
<li>Big query ML
<ul>
<li>can actually build models directly</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-apigee">Apigee</h4>
<ul id="bkmrk-apigee-rest-api-mana">
<li>ApIgee<br>
<ul>
<li>Rest API</li>
<li>Managing a REST API isn't easy
<ul>
<li>Implimenting multiple versins of your API isnt easy</li>
</ul>
</li>
<li>Design secure and publish your API</li>
<li>manage the complete lifecycle</li>
<li>Provides AI powered monitoring</li>
<li>Enable caching with cloudCDN</li>
<li>Allows developers to access a simple development poeral</li>
</ul>
</li>
</ul>
<h3 id="bkmrk-google-cloud-archite">Google Cloud architecture framework</h3>
<h4 id="bkmrk-operational-excellen">Operational Excellence</h4>
<ul id="bkmrk-operational-exellenc">
<li>Operational Exellence
<ul>
<li>Monitor the business objectives
<ul>
<li>SLA</li>
<li>SLO</li>
<li>KPI</li>
</ul>
</li>
<li>Test DR</li>
<li>Increase software releases and veolcity</li>
</ul>
</li>
<li>Business health
<ul>
<li>Latency</li>
<li>Traffic</li>
<li>Errors</li>
<li>Saturation</li>
</ul>
</li>
<li>Logging
<ul>
<li>Ensure efficient amount of logs</li>
</ul>
</li>
<li>DR
<ul>
<li>RTO
<ul>
<li>Recovery time objective </li>
</ul>
</li>
<li>RPO
<ul>
<li>Recovery point objective</li>
</ul>
</li>
<li>Regularly test this plan</li>
<li>Schedule a persistent disk snapshot and copy across regions</li>
<li>Use cloudDNS</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-security%2C-privacy-an">Security, Privacy and compliance</h4>
<ul id="bkmrk-plan-security-contro">
<li>Plan security controls and privacy</li>
<li>Strategies
<ul>
<li>implement least privilege</li>
<li>Build a layered approach</li>
<li>Automate deployment of sensitive tasks</li>
</ul>
</li>
<li>Manage auth
<ul>
<li>Follow IAM best practices
<ul>
<li>Understand when to use a service account </li>
</ul>
</li>
<li>Use organization policy service
<ul>
<li>Allowing what can and cant be done in the account</li>
</ul>
</li>
</ul>
</li>
<li>Enable node-autoupgrade for GKE</li>
<li>Use GKE sandbox when running untrusted code</li>
<li>Secure the network
<ul>
<li>Use a carefully desigend VPC</li>
<li>Isolate workloads in to each VPC per project</li>
<li>Can control ingress with Ingress and egress rules</li>
<li>Use Network intelligence centre </li>
</ul>
</li>
<li>Use Object versioning </li>
<li>Use DLP for sanitizing data </li>
<li>Audit with Infrastructure logs</li>
</ul>
<h4 id="bkmrk-reliability">Reliability</h4>
<ul id="bkmrk-reliability-measrabl">
<li>Reliability
<ul>
<li>Measrable goals</li>
<li>Architect for HA, scale and automatic change managment</li>
<li>Stratergies
<ul>
<li>KPI, SLA, SLO</li>
<li>Small changes</li>
<li>Rollback </li>
<li>Instriment systems for observability</li>
<li>Document and automate emergency responses</li>
</ul>
</li>
</ul>
</li>
<li>Degrade services gracefully
<ul>
<li>Serve a static page when a site is down</li>
</ul>
</li>
<li>Predict peak traffic events
<ul>
<li>Scale and plan</li>
</ul>
</li>
<li>Build flexible 
<ul>
<li>Ensure all changes can be rolled back</li>
<li>Slow progressive rollouts</li>
</ul>
</li>
<li>Build efficient alerting</li>
<li>Reducing mean time to detect (MTTD)</li>
</ul>
<h4 id="bkmrk-performance-and-cost">Performance and cost optimization</h4>
<ul id="bkmrk-use-autoscaling-and-">
<li>Use autoscaling and data processing</li>
<li>Try serverless options</li>
<li>Distribute load with a global LB</li>
<li>Identify apps to tune
<ul>
<li>Cloud tracing</li>
<li>cloud debugging </li>
<li>cloud profiler </li>
</ul>
</li>
<li>Analyze costs
<ul>
<li>Export billing data to BQ
<ul>
<li>Use google Data studio</li>
<li>Use preemptible vms for non-critical fault tolerant vms </li>
</ul>
</li>
</ul>
</li>
</ul>
<p id="bkmrk-"><a href="/assets/48hjeTKxj568yycW-image-1621117434743.png" target="_blank" rel="noopener"><img src="/assets/48hjeTKxj568yycW-image-1621117434743.png" alt="image-1621117434743.png"></a></p>
<h3 id="bkmrk-%C2%A0"> </h3>
<p id="bkmrk-%C2%A0-0"> </p>