---
title: Google Architect - page 1
---

# Google Architect - page 1

<!--suppress ALL -->
<p id="bkmrk-gcp-has-200%2B-service">GCP has 200+ services</p>
<p id="bkmrk-the-exam-tests-your-">The exam tests your <strong>decision making<br></strong></p>
<ul id="bkmrk-which-services-do-yo">
<li>Which services do you chose in which situation?</li>
<li>How do you trade off between resilliance, performance and cost whilst not comprimising on security</li>
</ul>
<hr id="bkmrk-">
<p id="bkmrk-what-is-cloud-and-wh">What is cloud and why do we need it?</p>
<p id="bkmrk-before-the-cloud-a-c">Before the cloud a company would have to do 'Peak load provisioning' where you buy servers for the peak load</p>
<p id="bkmrk-before-cloud-the-cos">Before cloud the cost of purchasing infrastructure was high, and an upfront cost</p>
<p id="bkmrk-the-infrastrucutre-w">The infrastrucutre was under-utilized and you need a dedicated infrastrucutre team</p>
<p id="bkmrk-%C2%A0"> </p>
<p id="bkmrk-when-you-use-the-clo">When you use the cloud you 'Provision' and 'rent' resources from the provider. For this you rent them and then return them back to the 'pool' once used.<br>This is called Elasticity and 'On demand Provisioning' </p>
<p id="bkmrk-trading-capital-expe">Trading capital expense for Variables Expense.</p>
<p id="bkmrk-you-are-benifiting-f">You are benifiting from the 'Economic of Scale' where the cloud provider gets the best deals for you.</p>
<p id="bkmrk-you-no-longer-need-t">You no longer need to spend money running a datacentre.</p>
<p id="bkmrk-allows-you-to-go-glo">Allows you to go global in minutes. </p>
<hr id="bkmrk--0">
<p id="bkmrk-%C2%A0-0"> </p>
<p id="bkmrk-gcp-is-one-of-the-to">GCP is one of the top 3 cloud providers, the other are AWS and Azure</p>
<p id="bkmrk-gcp-provides-200%2B-se">GCP provides 200+ services, and has provided to be reliable and secure.</p>
<p id="bkmrk-is-it-the-%27cleanest%27">Is it the 'cleanest' cloud, as it's carbon neutral </p>
<hr id="bkmrk--1">
<p id="bkmrk-%C2%A0-1"> </p>
<p id="bkmrk-we-move-to-the-cloud">We move to the cloud due to on demand cloud provisioning. </p>
<p id="bkmrk-when-we-talk-about-c">When we talk about cloud applications, we talk about multiple GCP services. </p>
<hr id="bkmrk--2">
<p id="bkmrk-%C2%A0-2"> </p>
<p id="bkmrk-course-content%3A">Course content:</p>
<h4 id="bkmrk-regions-and-zones">Regions and Zones</h4>
<p id="bkmrk-imagine-your-applica">Imagine your application is deployed in the London Region.</p>
<p id="bkmrk-this-means-that-user">This means that users from other locations will have High Latency.</p>
<p id="bkmrk-if-the-dc-crashes%2C-y">If the DC crashes, your application goes down: Low Availability. </p>
<p id="bkmrk-if-the-entire-region">If the entire Region of London is unavailable, we will have the same architecture in a separate Region. </p>
<p id="bkmrk-this-is-what-we-want">This is what we want to do with the cloud deployment, to have them as close to the user as possible, deployment across multiple regions. </p>
<h5 id="bkmrk-%C2%A0-3">Understanding Regions and Zones in GCP</h5>
<p id="bkmrk-all-the-cloud-provid">All the cloud providers provide us with Regions. Google has 20 regions</p>
<p id="bkmrk-a-region-is-a-specif" class="callout info">A region is a specific geographical location to host your resources</p>
<p id="bkmrk-%C2%A0-4">Advantages:</p>
<ul id="bkmrk-high-availability-lo">
<li>High Availability</li>
<li>Low Latency</li>
<li>Global Footprint</li>
<li>Adherence to Government Regulations </li>
</ul>
<p id="bkmrk-how-do-we-deploy-ha-">How do we deploy HA in one geographical location?</p>
<p id="bkmrk-within-each-region-h">within each region has multiple zones</p>
<p id="bkmrk-each-region-has-3-%28o" class="callout info">Each region has 3 (or more) availability zones</p>
<p id="bkmrk-%C2%A0-5">Each zone has one or more 'Discreet clusters' </p>
<p id="bkmrk-each-zone-has-one-or">Each Zone has one or more Datacentre. these zones are all connected with low latency connections.</p>
<p id="bkmrk-%C2%A0-6"> </p>
<hr id="bkmrk--3">
<h4 id="bkmrk-google-compute-engin">Google Compute engine</h4>
<p id="bkmrk-%C2%A0-7"> </p>
<h5 id="bkmrk-features">Features</h5>
<p id="bkmrk-when-you-want-to-dep">When you want to deploy applicaitons, you need servers. In order to deploy to the cloud you need to deploy to a Virtual machine</p>
<p id="bkmrk-in-order-to-provisio">In order to provision a machine, you need to use Google Compute engine</p>
<p id="bkmrk-gce-helps-you-to%3A">GCE helps you to:</p>
<ul id="bkmrk-create-and-manage-th">
<li>Create and manage the lifecycle of Virtual machines</li>
<li>Load balancing and autoscaling instances </li>
<li>Attach storage </li>
<li>Manage network connectivity</li>
</ul>
<h5 id="bkmrk-creating-an-instance">Creating an instance</h5>
<p id="bkmrk-there-are-a-lot-of-d">There are a lot of details you need to give</p>
<p id="bkmrk-you-need-to-%28and-hav">You need to (and have the option to) give:</p>
<ul id="bkmrk-name-labels-region-a">
<li>name</li>
<li>Labels</li>
<li>Region and Zone</li>
<li>OS</li>
<li>Firewall </li>
</ul>
<h5 id="bkmrk-understanding-machin">Understanding machine types</h5>
<p id="bkmrk-there-are-some-impor">There are some important choices we made:</p>
<ol id="bkmrk-hardware-os">
<li>Hardware</li>
<li>OS</li>
</ol>
<p id="bkmrk-when-we-talk-about-t">When we talk about the hardware, we need to understand the Machine type and Machine family</p>
<ul id="bkmrk-general-purpose%3A-e2%2C">
<li>General Purpose:
<ul>
<li>E2, N2, N2D, N1</li>
<li>Best price-performance ratio</li>
<li>running Web applicatoins and small-medium sized databases, dev enciroments</li>
</ul>
</li>
<li>Memory Optimized
<ul>
<li>Ultra high memory workloads </li>
<li>M2,M1</li>
<li>Large in memory Database</li>
</ul>
</li>
<li>Compute Optimized
<ul>
<li>Compute Intensive workloads</li>
<li>C2</li>
<li>Gaming applications</li>
</ul>
</li>
</ul>
<p id="bkmrk-first-choice-is-what">First choice is what machine family, then the machine type</p>
<p id="bkmrk-e2-standard-2">e2-standard-2</p>
<ul id="bkmrk-e2---machine-type-fa">
<li>e2 - Machine type family</li>
<li>Standard - Workload</li>
<li>2 - Number of CPU's</li>
</ul>
<table id="bkmrk-machine-name-vcpu%27s-" style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
<tr>
<td style="width: 14.2857%;">Machine name</td>
<td style="width: 14.2857%;">vCPU's</td>
<td style="width: 14.2857%;">Memory</td>
<td style="width: 14.2857%;">Maximum number of PD's</td>
<td style="width: 14.2857%;">Max total PD size (TB)</td>
<td style="width: 14.2857%;">Local SSD</td>
<td style="width: 14.2857%;">Egress bandwith (Gbps)</td>
</tr>
<tr>
<td style="width: 14.2857%;">e2-standard-2</td>
<td style="width: 14.2857%;">2</td>
<td style="width: 14.2857%;">8</td>
<td style="width: 14.2857%;">128</td>
<td style="width: 14.2857%;">257</td>
<td style="width: 14.2857%;">No</td>
<td style="width: 14.2857%;">
<p>4</p>
</td>
</tr>
<tr>
<td style="width: 14.2857%;">e2-standard-4</td>
<td style="width: 14.2857%;">4</td>
<td style="width: 14.2857%;">16</td>
<td style="width: 14.2857%;">128</td>
<td style="width: 14.2857%;">257</td>
<td style="width: 14.2857%;">No</td>
<td style="width: 14.2857%;">8</td>
</tr>
<tr>
<td style="width: 14.2857%;">e2-standard-8</td>
<td style="width: 14.2857%;">8</td>
<td style="width: 14.2857%;">32</td>
<td style="width: 14.2857%;">128</td>
<td style="width: 14.2857%;">257</td>
<td style="width: 14.2857%;">No</td>
<td style="width: 14.2857%;">16</td>
</tr>
<tr>
<td style="width: 14.2857%;">e2-standard-16</td>
<td style="width: 14.2857%;">16</td>
<td style="width: 14.2857%;">64</td>
<td style="width: 14.2857%;">128</td>
<td style="width: 14.2857%;">257</td>
<td style="width: 14.2857%;">No</td>
<td style="width: 14.2857%;">16</td>
</tr>
<tr>
<td style="width: 14.2857%;">e2-standard-32</td>
<td style="width: 14.2857%;">32</td>
<td style="width: 14.2857%;">128</td>
<td style="width: 14.2857%;">128</td>
<td style="width: 14.2857%;">257</td>
<td style="width: 14.2857%;">No</td>
<td style="width: 14.2857%;">16</td>
</tr>
</tbody>
</table>
<p id="bkmrk-%C2%A0-9" class="callout info">Memory, Disk and Networking capabilities increase with the vCPU's </p>
<p id="bkmrk-%C2%A0-10"> </p>
<p id="bkmrk-%C2%A0-11">Second question is what OS do we want to run - This is chosen with the Image</p>
<p id="bkmrk-we-can-pick-a-public">We can pick a public Image, which are maintained by Google or opensource third parties</p>
<p id="bkmrk-%C2%A0-8"> </p>
<h5 id="bkmrk-understanding-ip-add">Understanding IP addressing in GCP</h5>
<p id="bkmrk-external-ip-address-">External IP address are Internet addressable, can be reached over the internet</p>
<p id="bkmrk-internal-ip-address-">Internal IP address are internal to the corperate network, so a VM with the IP of 10.128.0.2 address isnt reachable from your network</p>
<p id="bkmrk-you-cant-have-2-inst">You cant have 2 instances with the same public IP</p>
<p id="bkmrk-you-have-have-2-sepa">You have have 2 separate corporate networks with the same internal network</p>
<p id="bkmrk-to-get-a-static-ip-a">To get a static IP address, we go to VPC networks &gt; External IP address <br>Here we chose what network tier as well as version to use</p>
<p id="bkmrk-things-to-note%3A">Things to note:</p>
<ul id="bkmrk-static-ip-can-be-swi">
<li>Static IP can be switched to another VM instance in the same project</li>
<li>Static IP remains attached even after a reboot</li>
</ul>
<p id="bkmrk-%C2%A0-12" class="callout warning">Static IP's are billed when you are not using it!</p>
<p id="bkmrk-%C2%A0-13"> </p>
<h5 id="bkmrk-templates">Templates</h5>
<p id="bkmrk-we-can-speed-up-the-">We can speed up the creation of instances by using a template</p>
<p id="bkmrk-it%27s-used-to-create-">It's used to create VM's as well as Managed instance groups </p>
<p id="bkmrk-we-can-define-the-ma">We can define the Machine Type, Image, labels and Start up script etc once then apply to many!</p>
<p id="bkmrk-once-the-template-is">Once the template is created, we cant update it. We need to copy it</p>
<p id="bkmrk-you-can-specify-an-i">You can specify an Image family which will pick the most recent non deprecated image. </p>
<p id="bkmrk-there-is-no-cost-ass">There is no cost associated with creating a template</p>
<h5 id="bkmrk-images">Images</h5>
<p id="bkmrk-installing-os-patche">Installing OS patches at boot can take a while to boot the instance</p>
<p id="bkmrk-create-an-image-with">Create an image with the patches pre-installed</p>
<p id="bkmrk-you-can-create-an-im">You can create an image from:</p>
<ul id="bkmrk-instance-persistant-">
<li>Instance</li>
<li>Persistant Disk</li>
<li>Snapshot</li>
<li>Image</li>
<li>File in gcs</li>
</ul>
<p id="bkmrk-can-be-shared-accros">Can be shared accross projects</p>
<p id="bkmrk-deprecate-old-images">Deprecate old images (And specify a replacement image)</p>
<p id="bkmrk-harden-an-image---cu">Harden an image - Customize images to your corperate standard </p>
<p id="bkmrk-startup-scripts-take">Startup scripts take time, where as using a snapshot makes it quicker. </p>
<h5 id="bkmrk-%C2%A0-14"> </h5>
<h5 id="bkmrk-gcp-web-console">GCP web console</h5>
<p id="bkmrk-when-people-talk-abo">When people talk about the 'Conosle' It's the web interface</p>
<p id="bkmrk-you-can-make-things-">You can make things as a favourite and they move to the top of the list. </p>
<p id="bkmrk-under-home-you-can-s">Under home you can see the GCP Dashboard, has the project info as well as GCP status</p>
<p id="bkmrk-%C2%A0-15"> </p>
<h5 id="bkmrk-compute-engine-scena">Compute Engine Scenarios</h5>
<table id="bkmrk-scenario-solution-pr" style="border-collapse: collapse; width: 100%; height: 319px;" border="1">
<tbody>
<tr style="height: 29px;">
<td style="width: 50%; height: 29px;">Scenario</td>
<td style="width: 50%; height: 29px;">Solution</td>
</tr>
<tr style="height: 84px;">
<td style="width: 50%; height: 84px;">Pre-reqs to create a VM</td>
<td style="width: 50%; height: 84px;">
<ol>
<li>Project</li>
<li>Billing account</li>
<li>Compute engine API Enabled</li>
</ol>
</td>
</tr>
<tr style="height: 148px;">
<td style="width: 50%; height: 148px;">Dedicated hardware for Compliance, Licensing and Management needs</td>
<td style="width: 50%; height: 148px;">
<ol>
<li>Sole tenant node group</li>
<li>Node Template
<ol>
<li>Name</li>
<li>Node type</li>
<li>Affinity Labels </li>
</ol>
</li>
<li>Create a VM</li>
<li>Under management go to sole tennancy</li>
</ol>
</td>
</tr>
<tr style="height: 29px;">
<td style="width: 50%; height: 29px;">Thousands of VM's and update them and manage them</td>
<td style="width: 50%; height: 29px;">VM Manager tool in GCP</td>
</tr>
<tr style="height: 29px;">
<td style="width: 50%; height: 29px;">Login to server to install software</td>
<td style="width: 50%; height: 29px;">SSH</td>
</tr>
<tr>
<td style="width: 50%;">Don't want to expose the VM to the internet</td>
<td style="width: 50%;">Configure Firewall Rules</td>
</tr>
</tbody>
</table>
<p id="bkmrk-when-you-utilise-a-r" class="callout info">When you utilise a resource in GCP, you need to enable the API</p>
<p id="bkmrk-%C2%A0-16"> </p>
<h4 id="bkmrk-%C2%A0-17">Instance groups and load balancing</h4>
<p id="bkmrk-%C2%A0-18"> </p>
<h5 id="bkmrk-instance-groups">Instance groups</h5>
<p id="bkmrk-instance-groups-are-">Instance groups are used to manage similar vm's and have one lifecycle as a unit</p>
<p id="bkmrk-there-are-2-types-of">There are 2 types of Instance groups:</p>
<ul id="bkmrk-managed-instance-gro">
<li>Managed instance groups
<ul>
<li>Identical VM's created using a template
<ul>
<li>Same image, same machine type same verion</li>
</ul>
</li>
<li>Health check
<ul>
<li>Check the server is responding</li>
</ul>
</li>
<li>Auto-scaling
<ul>
<li>Scale the resources up based on a metric</li>
</ul>
</li>
<li>Managed releases
<ul>
<li>can go from version to version with no downtime</li>
</ul>
</li>
</ul>
</li>
<li>Unmanaged instance groups
<ul>
<li>Have VM's with different configurations</li>
<li>This is used to group vms with different configurations</li>
<li>With the group you don't get any of the features of Autoscaling or Autohealing</li>
<li>NOT recommended unless you need different kinds of VM's</li>
</ul>
</li>
</ul>
<p id="bkmrk-location-can-be-eith">Location can be either Zonal or Regional </p>
<p id="bkmrk-regional-gives-you-h">Regional gives you HA</p>
<h5 id="bkmrk-mig">MIG</h5>
<p id="bkmrk-an-identical-set-of-">An identical set of VM's that are created with a template</p>
<ul id="bkmrk-maintain-a-number-of">
<li>Maintain a number of instances
<ul>
<li>If an instance crashes, MIG will replace it</li>
</ul>
</li>
<li>Detect an application failure using health checks</li>
<li>Increase instances based on load (Autoscaling)</li>
<li>Add a Load balancer to distribute the load</li>
<li>Create Instances in multiple zones (Regional MIG's)
<ul>
<li>Regional migs provide higher avalibliity compared to Zonal Migs</li>
</ul>
</li>
<li>Release new applications with no downtime
<ul>
<li>Rolling updates </li>
<li>Canary deployment (test new version of instance template and only push to a select few)</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-creating-a-mig">Creating a MIG</h5>
<ul id="bkmrk-you-need-an-instance">
<li>You need an instance template</li>
<li>Configuring autoscaling
<ul>
<li>Maximum number of instances</li>
<li>Minimum number of instances</li>
<li>Autoscaling metrics
<ul>
<li>CPU, LB utilisation, Stackdriver metrics</li>
<li>Cooldown period
<ul>
<li>How long to wait before looking at the autoscale metrics again before scaling</li>
</ul>
</li>
<li>Scale in control
<ul>
<li>You don't want a sudden drop in the number of instances,
<ul>
<li>Example: don't scale down by more than 10% or 3 instances in 5 minutes</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>Auto healing
<ul>
<li>Configure a health check with an initial delay
<ul>
<li>How long to wait from scaling the instance (Creating it) before you check the server's health</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
<p id="bkmrk-when-creating-a-mig%2C">When creating a MIG, you have 3 options:</p>
<ul id="bkmrk-stateless-supports%3A-">
<li>Stateless
<ul>
<li>Supports:
<ul>
<li>Autoscaling</li>
<li>Autohealing</li>
<li>Auto-updating</li>
<li>Multi-zone deployments</li>
<li>LB</li>
</ul>
</li>
</ul>
</li>
<li>Statefull
<ul>
<li>Disk and metadata perservation</li>
<li>autohealing and updating</li>
<li>Multi-zonal deployment</li>
<li>Load balancing</li>
</ul>
</li>
<li>Unmanaged instance group
<ul>
<li>LB</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-updating-managed-ins">Updating managed instance groups</h5>
<ul id="bkmrk-we-can-do-a-rolling-">
<li>We can do a rolling upgrade 
<ul>
<li>Gradual update</li>
<li>Specify the new template</li>
<li>You can also select a new template for a canary deployment
<ul>
<li>You set the instances to be swapped out once all is good they all switchout </li>
</ul>
</li>
<li>You can pick a set of instances to remove and switchout </li>
</ul>
</li>
<li>Specify how the update is done
<ul>
<li>When should the update happen?
<ul>
<li>Immediately </li>
<li>When the instance group is resized </li>
</ul>
</li>
<li>How should they be updated
<ul>
<li>Maximum surge: How many instances should be added at any point in time</li>
<li>Maximum unavailable: How many instances can be offline</li>
</ul>
</li>
<li>Rolling restart/replace: Gradual restart of all instances in the group
<ul>
<li>No change in template, but restart existing VM's </li>
</ul>
</li>
</ul>
</li>
</ul>
<p id="bkmrk-exam-question%3Aq%3A-how" class="callout info">Exam question:<br>Q: How to update but have the same number of instances in the group?<br>A: Maximum unavailable = 0</p>
<p id="bkmrk-exam-question%3Aq%3A-tru" class="callout info">Exam question:<br>Q: True or false: Unmanaged instance groups provide you with self-helaing and auto-scaling capabilities<br>A: false</p>
<p id="bkmrk-exam-question%3Aq%3A-can" class="callout info">Exam question:<br>Q: Can a MIG contain different machine types?<br>A: No <br>E: This would be an umanaged instance group </p>
<p id="bkmrk-exam-question%3Aq%3A-how-0" class="callout info">Exam question:<br>Q: How can you prevent frequest scaling up and down of vm instances in a MIG<br>A: Cool down period</p>
<p id="bkmrk-%C2%A0-20"> </p>
<h5 id="bkmrk-%C2%A0-21">Load Balancing</h5>
<ul id="bkmrk-a-cloud-lb-distribut">
<li>a Cloud LB distributes traffic between regions and instances</li>
<li>Fully distributed software managed service</li>
</ul>
<p id="bkmrk-%C2%A0-19"> </p>
<ul id="bkmrk-important-features%3A-">
<li>Important features:
<ul>
<li>Healthcheck
<ul>
<li>Allows you to recover from failures</li>
</ul>
</li>
<li>Autoscaling</li>
<li>Global load balancing with Anycast IP
<ul>
<li>can serve global traffic with this IP address</li>
</ul>
</li>
<li>Internal load balancing
<ul>
<li>Allows you to do vm to vm loadbalancing</li>
</ul>
</li>
</ul>
</li>
<li>Enables:
<ul>
<li>HA</li>
<li>Autoscaling
<ul>
<li>LB scales on requests</li>
<li>Instances scale based on requests</li>
<li>Resiliancy
<ul>
<li>Because of health check it can distribute traffic to healthy instances</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-terminology%3A">Terminology:</h5>
<ul id="bkmrk-backed---group-of-re">
<li>Backed - group of resources that can receive traffic</li>
<li>Front end - Specify an IP address, port and protocal. This is the IP address for your clients
<ul>
<li>for SSL, a cert must be assigned</li>
</ul>
</li>
<li>Host and path rules (For http(s) LB's) Defines the rules redirecting the traffic to different backends
<ul>
<li>Based on a path : breadnet.co.uk/blog vs breadnet.co.uk/download</li>
<li>Based on a Host: uk.breadnet.co.uk vs us.breadnet.co.uk</li>
<li>Based on HTTP Headers (Auth headers) and methods (POst, GET, etc)</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-%C2%A0-22"> </h5>
<h5 id="bkmrk-ssl%2Ftls-termination%2F">SSL/TLS Termination/ Offloading</h5>
<ul id="bkmrk-client-to-lb%3A-over-t">
<li>Client to LB: Over the internet
<ul>
<li>HTTPS is recommended</li>
</ul>
</li>
<li>LB to VM: Through internal network
<ul>
<li>HTTP is <em>ok </em>where as HTTPS is preffered</li>
</ul>
</li>
<li>SSL/TLS termination/ Offloading
<ul>
<li>Client to LB: HTTPS/TLS</li>
<li>LB to VM: HTTP/TCP </li>
</ul>
</li>
</ul>
<h5 id="bkmrk-%C2%A0-24">How to choose your LB</h5>
<p id="bkmrk-%C2%A0-23"> </p>
<p id="bkmrk-%C2%A0-25"> </p>
<p id="bkmrk-%C2%A0-26"> </p>
<p id="bkmrk--4"><img src="https://cloud.google.com/load-balancing/images/choose-lb.svg"></p>
<p id="bkmrk-this-is-important-to">This is important to know</p>
<p id="bkmrk-%C2%A0-27"> </p>
<p id="bkmrk-%C2%A0-28"> </p>
<table id="bkmrk-load-balancer-type-o" style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
<tr>
<td style="width: 25%;">Load Balancer</td>
<td style="width: 25%;">Type of traffic</td>
<td style="width: 25%;">Proxy or Pass-through</td>
<td style="width: 25%;">Destination ports</td>
</tr>
<tr>
<td style="width: 25%;">External HTTP(s)</td>
<td style="width: 25%;">Global, External, HTTP or HTTPS</td>
<td style="width: 25%;">Proxy</td>
<td style="width: 25%;">
<p>HTTP/80/8080</p>
<p>HTTPS/443</p>
</td>
</tr>
<tr>
<td style="width: 25%;">Internal HTTP(S)</td>
<td style="width: 25%;">Regional, Internal, HTTP or HTTPS</td>
<td style="width: 25%;">Proxy</td>
<td style="width: 25%;">
<p>HTTP/80/8080</p>
<p>HTTPS/443</p>
</td>
</tr>
<tr>
<td style="width: 25%;">SSL Proxy</td>
<td style="width: 25%;">Global, External, TCP <strong>without</strong> SSL offload </td>
<td style="width: 25%;">Proxy</td>
<td style="width: 25%;">Many</td>
</tr>
<tr>
<td style="width: 25%;">TCP Proxy</td>
<td style="width: 25%;">Global, External, TCP without SSL Offload</td>
<td style="width: 25%;">Proxy</td>
<td style="width: 25%;">Many</td>
</tr>
<tr>
<td style="width: 25%;">External Network UDP/TCP</td>
<td style="width: 25%;">Regional, External, TCP or UDP</td>
<td style="width: 25%;">Pass-through</td>
<td style="width: 25%;">Any</td>
</tr>
<tr>
<td style="width: 25%;">Internal TCP/UDP</td>
<td style="width: 25%;">Regional, Internal, TCP or UDP</td>
<td style="width: 25%;">Pass-through</td>
<td style="width: 25%;">Any</td>
</tr>
</tbody>
</table>
<p id="bkmrk-%C2%A0-29"> </p>
<h5 id="bkmrk-load-balancing-ac-cr">Load balancing ac cross MIGs in multiple regions</h5>
<ul id="bkmrk-regional-mig-can-dis">
<li>Regional MIG can distribute instances in different zones of a single region
<ul>
<li>Create multiple regional MIG's in different regions (In the same project)</li>
</ul>
</li>
<li>HTTP(S) load balancing can distribute load to multiple MIGS behind a single External IP address
<ul>
<li>User requests are redirected to the nearest Region </li>
</ul>
</li>
<li>Loadbalancing only sends traffic to healthy instances
<ul>
<li>If a health check fails the instnace is restarted
<ul>
<li>Ensure the healthcheck from the LB can reach the instance group (Firewall rules)</li>
</ul>
</li>
<li>All the backends within a region are unhealthy 
<ul>
<li>Traffic is distributed to healthy loads as always</li>
</ul>
</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-multiregional-micro-">Multiregional Micro-services </h5>
<ul id="bkmrk-global-routing%3A-rout">
<li>Global routing: Routes to the nearest instance group
<ul>
<li>Needs network premium teir
<ul>
<li>Forward rule and it's external rule are regional</li>
<li>All back ends need to be in the same region</li>
</ul>
</li>
</ul>
</li>
</ul>
<p id="bkmrk-exam-question%3Aq%3A-tru-0" class="callout info">Exam Question:<br>Q: True or false: HTTPs LB can balance load between MIGS in different regions<br>A: True</p>
<p id="bkmrk-exam-question%3Aq%3A-whi" class="callout info">Exam Question:<br>Q: Which of these networking tiers is recommended if you want to use global HTTPS LB<br>A: Premium </p>
<p id="bkmrk-exam-question%3Aq%3A-how-1" class="callout info">Exam Question:<br>Q: How many HTTPS LB's backends do you need to support 3 microservices each with 2 migs in 2 different regions<br>O:  1 (One backend service can route between multiple microservices)<br>O: 3 (One for each version of the Microservice)<br>O: 6 (One for each MIG)<br>A: 3: <br>E: There are 3 micro-services, so url/ms1 url/ms2 url/ms3 each pointing to a backend, as you can have multiple backend groups per service </p>
<div drawio-diagram="83" id="bkmrk--5"><img id="bkmrk--7" src="/assets/e1giSp8BGj8Wx2nH-drawing-1-1620509841.png"></div>
<p id="bkmrk-%C2%A0-30"> </p>
<h4 id="bkmrk-compute-engine-%26-loa">Compute engine &amp; Load balancing for Architects </h4>
<p id="bkmrk-%C2%A0-31"> </p>
<blockquote id="bkmrk-it%27s-not-sufficient-">
<p>It's not sufficient to get things working. We want more!</p>
</blockquote>
<ul id="bkmrk-build-resiliency-inc">
<li id="bkmrk-build-resiliency">Build resiliency</li>
<li>Increase availability </li>
<li>Increase scalability</li>
<li>Improve performance</li>
<li>Improve security</li>
<li>Lower costs</li>
</ul>
<p id="bkmrk-professional-archite">Professional architect:</p>
<ul id="bkmrk-need-to-know-the-ser">
<li>Need to know the services</li>
<li>Learn to build highly resillient, Highly avalible, scalable secure and perfomant with low cost</li>
</ul>
<p id="bkmrk-%C2%A0-32"> </p>
<h5 id="bkmrk-availability">Availability</h5>
<table id="bkmrk-percentage-downtime-" style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
<tr>
<td style="width: 33.3333%;">Percentage</td>
<td style="width: 33.3333%;">Downtime (Month)</td>
<td style="width: 33.3333%;">Comment</td>
</tr>
<tr>
<td style="width: 33.3333%;">99.95</td>
<td style="width: 33.3333%;">22 Minutes</td>
<td style="width: 33.3333%;"> </td>
</tr>
<tr>
<td style="width: 33.3333%;">99.99</td>
<td style="width: 33.3333%;">4:30 minutes</td>
<td style="width: 33.3333%;">Most online/ SaaS aims for 99.99</td>
</tr>
<tr>
<td style="width: 33.3333%;">99.999%</td>
<td style="width: 33.3333%;">:26</td>
<td style="width: 33.3333%;">This is a tough one</td>
</tr>
</tbody>
</table>
<p id="bkmrk-%C2%A0the-availability-is" class="callout warning"> The Availability is the <strong>whole application!</strong><br>This includes the the API, Database, Front end etc</p>
<h5 id="bkmrk-%C2%A0-33"> </h5>
<h5 id="bkmrk-high-availability-ar">High Availability architecture</h5>
<ul id="bkmrk-multiple-regional-mi">
<li>Multiple regional MIG's per Microservice</li>
<li>Distribute load using Global HTTPS Load Balancer</li>
<li>Configure health checks for MIG's  and LB</li>
<li>Enable Live Migration on the instnaces</li>
</ul>
<p id="bkmrk-%C2%A0-34"> </p>
<ul id="bkmrk-advantages%C2%A0-instance">
<li>Advantages 
<ul>
<li>Instances distributed accross regions
<ul>
<li>Even if a region is down, your application is avalible</li>
</ul>
</li>
<li>Global LB is HA</li>
<li>Health checks ensure Auto-healing</li>
</ul>
</li>
</ul>
<p id="bkmrk-%C2%A0-35"> </p>
<h5 id="bkmrk-compute-engine-featu">Compute engine Features: GPU</h5>
<ul id="bkmrk-how-do-you-accelerat">
<li>How do you accelerate maths intensiveness and graphic intensive workloads</li>
<li>Add GPU to your virtual machine
<ul>
<li>High performance for math intensive and graphic workloads</li>
<li>Higher cost</li>
<li>Use images with libraries installed
<ul>
<li>Otherwise GPU wont be used</li>
</ul>
</li>
<li>GPU restrictions:
<ul>
<li>Not supported on all machine types</li>
<li>On host Maintanance: Value must be terminate</li>
</ul>
</li>
</ul>
</li>
<li>Recommended <strong>availability policy</strong>:
<ul>
<li>Automatic restart - ON</li>
<li> </li>
</ul>
</li>
</ul>
<p id="bkmrk-%C2%A0-36"> </p>
<h5 id="bkmrk-%C2%A0-37">GCE Security &amp; Performance</h5>
<p id="bkmrk-security">Security</p>
<ul id="bkmrk-use-firewall-rules-t">
<li>Use firewall rules to restrict traffic</li>
<li>Use internal IP address where possible</li>
<li>Use Sole tennants where the regulatory needs</li>
<li>Use hardened images to launch your vm's</li>
</ul>
<p id="bkmrk-performance">Performance</p>
<ul id="bkmrk-chose-the-correct-ma">
<li>Chose the correct machine size</li>
<li>Use GPU and TPU to increase perfomrance
<ul>
<li>Use GPU to accelerate math and graphic intensive workloads</li>
<li>Use TPU's for massive matrix operations (Tensor processing unit for AI)</li>
</ul>
</li>
<li>Prefer creating hardened custom images opposed to installing software at startup </li>
</ul>
<h5 id="bkmrk-resiliency-for-gce-a">Resiliency for GCE and LB</h5>
<p id="bkmrk-resiliency---ability" class="callout info">Resiliency - Ability for a system to provide the needs it's expected to provide when one or more parts break</p>
<ul id="bkmrk-build-resillient-arc">
<li id="bkmrk-build-resillient-arc-0">Build resillient archiecture
<ul>
<li>run VM's behind an LB in a MIG</li>
</ul>
</li>
<li>Have the right data avalible
<ul>
<li>Use cloud monitoring (Stack driver)</li>
<li>Install logging agent to send logs to cloud logging</li>
</ul>
</li>
<li>Be prepared for the unexpected (And changes)
<ul>
<li>Enable Live migration and automatic restarts where Availible</li>
<li>Configure the correct health checks</li>
<li>Up to date image is copied to multiple regions</li>
</ul>
</li>
</ul>
<p id="bkmrk-%C2%A0-38"> </p>
<h5 id="bkmrk-cost-efficiency-for-">Cost efficiency for GCE and LB</h5>
<ul id="bkmrk-autoscaling-have-opt">
<li>Autoscaling
<ul>
<li>have optimal number of VM instances running</li>
</ul>
</li>
<li>Understand sustained use discounts</li>
<li>Make use of commuted use discounts</li>
</ul>
<h4 id="bkmrk-discounts">Discounts</h4>
<p id="bkmrk-%C2%A0-39"> </p>
<h5 id="bkmrk-sustained-use-discou">Sustained use discount</h5>
<p id="bkmrk-automatic-discounts-">Automatic discounts for running VM instances for significant portions of time</p>
<p id="bkmrk-%C2%A0-40"> </p>
<p id="bkmrk--6"><a href="/assets/46FRmJql62IK5eFK-image-1620574015296.png" target="_blank" rel="noopener"><img src="https://doesnotexist/images/gallery/2021-05/scaled-1680-/46FRmJql62IK5eFK-image-1620574015296.png" alt="image-1620574015296.png" width="347" height="301"></a></p>
<p id="bkmrk-example%3A">Example:</p>
<p id="bkmrk-if-you-use-n1-and-n2">If you use N1 and N2 machines for more than 25% of the month, you get a 20-50% discount on every incramental minute</p>
<p id="bkmrk-no-action-required-o">No action required on your part</p>
<p id="bkmrk-applicable-for-insta">Applicable for instances running GKE</p>
<p id="bkmrk-does-not-apply-for-e" class="callout warning">Does not apply for E2 and A2</p>
<p id="bkmrk-does-not-apply-when-" class="callout warning">Does not apply when using App Engine flexible and Dataflow</p>
<h5 id="bkmrk-%C2%A0-41"> </h5>
<h5 id="bkmrk-%C2%A0committed-use-disco"> Committed use discount</h5>
<ul id="bkmrk-for-workloads-with-p">
<li>For workloads with predictable resource needs</li>
<li>Commited for 1-3 years</li>
<li>up to 705 discount based on machine type and GPU's</li>
<li>Applicable for Instances created using GKE</li>
<li>
<p class="callout warning">Does not apply when using App Engine flexible and Dataflow</p>
</li>
</ul>
<p id="bkmrk-%C2%A0-42"> </p>
<h5 id="bkmrk-%C2%A0-43">Running fault tolerant non-critical workloads</h5>
<p id="bkmrk-preemptive-vms-are-a">Preemptive vms are a good choice. </p>
<ul id="bkmrk-short-lived-%28up-to-8">
<li>Short lived (up to 80% cheaper)
<ul>
<li>can be stopped by GCP at any time within 24 hours</li>
<li>you get 30 second warning before termination</li>
</ul>
</li>
<li>You should use them if
<ul>
<li>Your application is fault tolerant</li>
<li>You're very cost sensative</li>
<li>workload is not Immediate
<ul>
<li>Non-immediate batch processing jobs</li>
</ul>
</li>
</ul>
</li>
<li>RESTRICTIONS
<ul>
<li>Not always avalible</li>
<li>No SLA and cannot be migrated to regular VM's</li>
<li>No automatic restarts</li>
<li>Free tier credits do not apply</li>
</ul>
</li>
</ul>
<p id="bkmrk-to-save-state%2C-creat" class="callout info">To save state, create metadata with the key of shutdown-script and a script on the server to run</p>
<h5 id="bkmrk-billing-for-gcp">Billing for GCP</h5>
<ul id="bkmrk-you-are-billed-by-th">
<li>You are billed by the second (After a minimum of one minute) (If you start an instance you are billed for a minute </li>
<li>You are not billed when the instance is stopped
<ul>
<li>You are billed for any storage attached that isn't deleted</li>
</ul>
</li>
</ul>
<p id="bkmrk-you-should-set-up-bu" class="callout success">You should set up budget alerts</p>
<ul id="bkmrk-saving-money-chose-t">
<li>Saving money
<ul>
<li>Chose the right VM for the workload</li>
<li>Discounts
<ul>
<li>Sustained use discount</li>
<li>Commited use discount</li>
<li>Preemptive VM</li>
</ul>
</li>
</ul>
</li>
</ul>
<p id="bkmrk-%C2%A0-44"> </p>
<h4 id="bkmrk-%C2%A0-45">G cloud</h4>
<ul id="bkmrk-most-gcp-services-ca">
<li>Most GCp services can be interfaced with gcloud</li>
<li>You can create, delete update and read from the cli</li>
</ul>
<p id="bkmrk-there-are-some-servi">There are some services that have specific CLI tools</p>
<ul id="bkmrk-cloud-storage%3A-gsuti">
<li>Cloud storage: gsutil</li>
<li>Big query: BQ</li>
<li>Cloud Bigtable: CBT</li>
<li>Kubernetes: kubectl</li>
</ul>
<p id="bkmrk-for-75%25-of-the-resou">for 75% of the resources you can use gsutil</p>
<p id="bkmrk-you-can-use-%60gcloud-">You can use `gcloud init` to initilize the gcloud command like tool</p>
<p id="bkmrk-you-can-use-%60gcloud--0">you can use `gcloud config list` </p>
<h5 id="bkmrk-gcloud-command-struc">Gcloud command structure</h5>
<p id="bkmrk-the-command-is-split">The command is split in to</p>
<p id="bkmrk-gcloud-group-subgrou"><code>gcloud GROUP SUBGROUP ACTION</code></p>
<p id="bkmrk-%C2%A0-46">Where it goes:</p>
<ul id="bkmrk-group%3A-config-or-com">
<li>Group:
<ul>
<li>Config or compute or container ot dataflow
<ul>
<li>Which service are you playing with</li>
</ul>
</li>
</ul>
</li>
<li>Subgroup
<ul>
<li>Instances, images, instance-templates etc
<ul>
<li>Which sub group of the service do you want to play with</li>
</ul>
</li>
<li>Action
<ul>
<li>Create, list, destroy etc</li>
</ul>
</li>
</ul>
</li>
</ul>
<p id="bkmrk-example%3A-0">Example:</p>
<p id="bkmrk-gcloud-compute-insta"><code>gcloud compute instances list</code></p>
<p id="bkmrk-to-get-all-info-abou">To get all info about an instance you would use </p>
<p id="bkmrk-gcloud-compute-insta-0">gcloud compute instance describe</p>
<p id="bkmrk-%C2%A0-47"> </p>
<h5 id="bkmrk-gcloud%3A-things-to-re">GCLOUD: Things to remember</h5>
<ul id="bkmrk-gcloud-shell-is-back">
<li>gcloud shell is backed by a vm instance</li>
<li>5GB of persistent storage in $HOME</li>
<li>latest SDK's (Docker, gcloud etc)</li>
<li>Instances inavice under 20 minutes are terminated</li>
<li>after 120 days of inactivity even you $home is deleted</li>
<li>cloudshell can be used to SSH in to individual machines</li>
</ul>
<h4 id="bkmrk-managed-servcices">Managed Servcices</h4>
<ul id="bkmrk-running-in-the-cloud">
<li>Running in the cloud
<ul>
<li>You don't want to run in the cloud the same way you did before in a datacentre</li>
</ul>
</li>
<li>Terminology
<ul>
<li>Iaas</li>
<li>PaaS</li>
<li>FaaS</li>
<li>CaaS</li>
<li>Serverless</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-iaas-%26-paas">IaaS &amp; PaaS</h5>
<p id="bkmrk-iaas-is-only-using-t">IaaS is only using the VM's and setting everything up your self. </p>
<p id="bkmrk-you-are-responsible-">You are responsible for:</p>
<ul id="bkmrk-application-code-con">
<li>Application code</li>
<li>Configuring LB</li>
<li>Autoscaling</li>
<li>OS updates and patches</li>
<li>Avaliblity </li>
</ul>
<p id="bkmrk-paas-is-when-you-use">PaaS is when you use a platform from the cloud provider</p>
<p id="bkmrk-the-cloud-provider-i">The cloud provider is responsible for the deployment and managment</p>
<p id="bkmrk-all-you-need-to-do-i">All you need to do is focus on the application code</p>
<p id="bkmrk-example-is-app-engin">example is App Engine in GCP</p>
<h5 id="bkmrk-containers%2F-microser">Containers/ Microservices</h5>
<p id="bkmrk-instead-of-building-">Instead of building a large monolithic service, you build lots of small ones and build them in many languages</p>
<ul id="bkmrk-enterprise-is-headin">
<li>Enterprise is heading towards microservices
<ul>
<li>Build small focused microservices</li>
<li>Flexibility to innovate</li>
</ul>
</li>
<li>Deployments become more comples</li>
</ul>
<p id="bkmrk-this-is-where-contai">This is where containers come in to play</p>
<h5 id="bkmrk-docker">Docker</h5>
<p id="bkmrk-you-can-create-a-doc">You can create a docker image for each of your microservices</p>
<ul id="bkmrk-create-a-docker-imag">
<li>Create a docker image for the MS</li>
<li>Docker images have all your needs
<ul>
<li>application run time</li>
<li>application code and dependencies</li>
</ul>
</li>
<li>Ability to run anywhere
<ul>
<li>Local machine</li>
<li>Corporate data centre</li>
<li>cloud </li>
</ul>
</li>
<li>Advantages
<ul>
<li>Containers are lightweight 
<ul>
<li>Do not have a guest OS</li>
<li>Isolation 
<ul>
<li>If there is an issue with the container, it wont affect anything</li>
</ul>
</li>
</ul>
</li>
<li>Cloud agnostic/ neutral</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-container-orchestrat">Container Orchestration</h5>
<p id="bkmrk-there-are-a-number-o">There are a number of container orchestration solutoins</p>
<p id="bkmrk-when-using-it%2C-you-c">When using it, you create a yaml deployment telling the orchestrator how many deployments </p>
<ul id="bkmrk-typical-features-aut">
<li>Typical features<br>
<ul>
<li>Auto scaling</li>
<li>service discovery
<ul>
<li>Helps microservices to know where they are with no hard coding</li>
</ul>
</li>
<li>Load balancing
<ul>
<li>distribute load</li>
</ul>
</li>
<li>Self healing
<ul>
<li>Do healthchecks and replace failing instances</li>
</ul>
</li>
<li>Zero-downtime deployments
<ul>
<li>Release a deployment with no downtime</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-app-engine">App engine</h4>
<p id="bkmrk-app-engine-is-the-si">App engine is the simplest way to deploy your applications in to GCP</p>
<ul id="bkmrk-supports%3A-go%2C-java%2C-">
<li>Supports:
<ul>
<li>Go, Java, .NET, Node.js, PHP, Python, Ruby (Preconfigured run times)</li>
<li>connect to a variaty of google cloud storage products</li>
</ul>
</li>
<li>No Usage charges
<ul>
<li>Pay for resources provisioned</li>
</ul>
</li>
<li>Features:
<ul>
<li>Automatic load balancing and Auto Scaling</li>
<li>Managed platform updates and application health monitoring</li>
<li>Application verisioning</li>
<li>Traffic splitting </li>
</ul>
</li>
</ul>
<h5 id="bkmrk-compute-engine-vs-ap">Compute engine vs App Engine</h5>
<ul id="bkmrk-compute-engine%3A-iaas">
<li>Compute engine:
<ul>
<li>IAAS</li>
<li>More flexibility</li>
<li>More responsibility 
<ul>
<li>Choosing image</li>
<li>Installing software</li>
<li>Choosing hardware</li>
<li>Fine grained access/ permissions</li>
<li>Avaibility etc</li>
</ul>
</li>
</ul>
</li>
<li>App Engine
<ul>
<li>PaaS</li>
<li>Server-less</li>
<li>Lesser responsibility</li>
<li>Lower flexibility</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-app-engine-enviromen">App Engine Enviroments</h5>
<ul id="bkmrk-standard-application">
<li>Standard
<ul>
<li>applications run in language specific sandboxes</li>
<li>Complete isolation from OS, Disks and other apps</li>
<li>V1: Java, Python, PHP, Go (Old versions)
<ul>
<li>Only python and PHP
<ul>
<li>restricted network access</li>
<li>Only white-listed extensions and libraries </li>
</ul>
</li>
<li>No such restrictions</li>
</ul>
</li>
<li>V2: Java, Python, PHP, Jode.js, Ruby, Go
<ul>
<li>Full network access and no restrictions </li>
</ul>
</li>
</ul>
</li>
<li>Flexible
<ul>
<li>Applicaitons run within docker containers 
<ul>
<li>Make use of compute engine virtual machines</li>
<li>Supports ANY runtime</li>
<li>Provides access to background access and local disks</li>
</ul>
</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-app-engine%3A-applicat">App Engine: Application component hierarchy </h5>
<ul id="bkmrk-application%3A-one-app">
<li>Application: One app per project (Acts as the <em>container </em>for the deployment <strong>(Not</strong> a docker container)</li>
<li>Services: Multiple microservices or app components
<ul>
<li>Each <strong>service </strong>can have different settings</li>
<li>Was called modules</li>
</ul>
</li>
<li>Versions(s): Each version associated with code and configuration
<ul>
<li>Each version can run in one or more instances</li>
<li>Multiple versions can co-exist</li>
<li>Options to roll back and split traffic</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-comparing-app-engine">Comparing app engine standard vs flexible</h5>
<table id="bkmrk-feature-standard-fle" style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
<tr>
<td style="width: 33.3333%;">Feature</td>
<td style="width: 33.3333%;">Standard</td>
<td style="width: 33.3333%;">Flexible</td>
</tr>
<tr>
<td style="width: 33.3333%;">Pricing factors</td>
<td style="width: 33.3333%;">Instance hours</td>
<td style="width: 33.3333%;">vCPU, Memory &amp; PD</td>
</tr>
<tr>
<td style="width: 33.3333%;">Scaling</td>
<td style="width: 33.3333%;">Manual, basic, Automatic</td>
<td style="width: 33.3333%;">Manual, Automatic</td>
</tr>
<tr>
<td style="width: 33.3333%;">Scaling to zero</td>
<td style="width: 33.3333%;">Yes</td>
<td style="width: 33.3333%;">No</td>
</tr>
<tr>
<td style="width: 33.3333%;">Instance startup time</td>
<td style="width: 33.3333%;">seconds</td>
<td style="width: 33.3333%;">Minutes</td>
</tr>
<tr>
<td style="width: 33.3333%;">Rapid scaling</td>
<td style="width: 33.3333%;">Yes</td>
<td style="width: 33.3333%;">No</td>
</tr>
<tr>
<td style="width: 33.3333%;">Max. Request timeout</td>
<td style="width: 33.3333%;">1-10 minutes</td>
<td style="width: 33.3333%;">
<p>60 minutes</p>
<p> </p>
</td>
</tr>
<tr>
<td style="width: 33.3333%;">Local Disk</td>
<td style="width: 33.3333%;">Mostly (Except for v1) can write to /tmp</td>
<td style="width: 33.3333%;">Yes; ephemeral. New disk on startup</td>
</tr>
<tr>
<td style="width: 33.3333%;">SSH for debugigng</td>
<td style="width: 33.3333%;">No</td>
<td style="width: 33.3333%;">Yes</td>
</tr>
</tbody>
</table>
<p id="bkmrk-%C2%A0-48">From the looks of it, flexible seems more like a glorified GCE</p>
<h5 id="bkmrk-app-engine%3A-scaling-">App Engine: Scaling instances</h5>
<ul id="bkmrk-automatic---automati">
<li>Automatic - Automatically scale instances based on the load
<ul>
<li>Reccomended for continously running workloads
<ul>
<li>Autoscale based on
<ul>
<li>CPU</li>
<li>Target thresholf</li>
<li>Max concurrent requests</li>
</ul>
</li>
<li>Configure max and min instances</li>
</ul>
</li>
</ul>
</li>
<li>Basic - Instances are created when requested
<ul>
<li>Reccomended for Adhoc workloads
<ul>
<li>Instances shutdown if ther eis ZERO requets
<ul>
<li>tries to keep costs low</li>
<li>High latency </li>
</ul>
</li>
<li>Not suported by app engine flexible</li>
<li>Conficure max instances and idle timeout
<ul>
<li>Idle timeout is the time from the last request</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>Manual
<ul>
<li>configure the number of instances </li>
</ul>
</li>
</ul>
<h4 id="bkmrk-%C2%A0-49">GKE</h4>
<ul id="bkmrk-managed-kubernetes-s">
<li>Managed Kubernetes service</li>
<li>Minimize operatoins with auto-repair and auto-upgrade</li>
<li>Provides pod and cluster autoscaling</li>
<li>Runs on COS (Container optimized OS)</li>
</ul>
<p id="bkmrk-%C2%A0-50"> </p>
<h5 id="bkmrk-commands">Commands</h5>
<p id="bkmrk-to-connect-to-the-cl">To connect to the cluster and set your kubectl:</p>
<pre id="bkmrk-gcloud-container-clu"><code class="language-">gcloud container clusters get-credentials cost-optimized-cluster-1 --zone us-central1-c --project fourth-jigsaw-307721</code></pre>
<p id="bkmrk-%C2%A0-51"> </p>
<p id="bkmrk-then-you-can-use-kub">then you can use kubectl</p>
<p id="bkmrk-if-you-need-specific">If you need specific workloads to run, you can add a pool. This can be a GPU workload for example</p>
<h5 id="bkmrk-service-and-ingress">Service and Ingress</h5>
<p id="bkmrk-service-are-a-set-of">Service are a set of posds within  anetwork that can be used for load balancing and discovery</p>
<p id="bkmrk-ingress-are-a-collec">Ingress are a collection of rules for routing external http(s) traffic</p>
<h5 id="bkmrk-commands-0">commands</h5>
<p id="bkmrk-see-here">See <a href="https://bookstack.breadnet.co.uk/books/google-certs/page/kubectl-commands" target="_blank" rel="noopener">Here</a></p>
<h5 id="bkmrk-deployments">Deployments</h5>
<p id="bkmrk-you-can-deploy-in-ya">You can deploy in YAML which is the suggested approach as yaml is "declarative" so you tell it what you want to do</p>
<p id="bkmrk-when-you-do-this%2C-yo">when you do this, you can use a file</p>
<pre id="bkmrk-kubectl-apply--f-%3Cfi"><code class="language-">kubectl apply -f &lt;file.yml&gt;</code></pre>
<p id="bkmrk-this-still-very-much">This still very much needs to follow the Order of operations tho</p>
<h5 id="bkmrk-node-pools">Node pools</h5>
<p id="bkmrk-when-you-want-to-dep-0">when you want to deploy a service that for example needs access to a GPU, you can setup a new node pool</p>
<pre id="bkmrk-gcloud-container-nod"><code class="language-">gcloud container node-pools create &lt;pool name&gt; --cluster &lt;cluster name&gt;
gcloud container node-pools list --cluster &lt;cluster name&gt;</code></pre>
<p id="bkmrk-when-it-comes-to-usi">when it comes to using that node pool, in deployment.yml you will use:</p>
<pre id="bkmrk-nodeselector%3A-cloud."><code class="language-">nodeSelector: cloud.google.com/gke-nodepool: &lt;pool name&gt;</code></pre>
<h4 id="bkmrk-understanding-gke-cl">Understanding GKE cluster</h4>
<ul id="bkmrk-cluster%3A-group-of-co">
<li>Cluster: Group of compute engine instances
<ul>
<li>Master node: Manages the cluster</li>
<li>worker node: Runs the workloads</li>
</ul>
</li>
<li>Master Node: (Control plane)
<ul>
<li>API Server:
<ul>
<li>Handles all communicatoin for a K8's cluster</li>
</ul>
</li>
<li>Scheduler
<ul>
<li>Works out where to place things</li>
</ul>
</li>
<li>Control manager
<ul>
<li>Managed deployments and replica sets</li>
</ul>
</li>
<li>etcd
<ul>
<li>Distributed database storing the state of the cluster</li>
</ul>
</li>
</ul>
</li>
<li>Worker nodes
<ul>
<li>Runs your pods</li>
<li>Kubelet 
<ul>
<li>Manages communication with the master node</li>
</ul>
</li>
</ul>
</li>
</ul>
<table id="bkmrk-type-description-zon" style="border-collapse: collapse; width: 100%; height: 174px;" border="1">
<tbody>
<tr style="height: 29px;">
<td style="width: 16.4198%; height: 29px;">Type</td>
<td style="width: 83.5802%; height: 29px;">Description</td>
</tr>
<tr style="height: 29px;">
<td style="width: 16.4198%; height: 29px;" rowspan="2">Zonal cluster</td>
<td style="width: 83.5802%; height: 29px;">Single Zone - Single control plane. nodes run in same zone</td>
</tr>
<tr style="height: 29px;">
<td style="width: 83.5802%; height: 29px;">Multi-zonal - Single control plane but nodes running in multiple zones</td>
</tr>
<tr style="height: 29px;">
<td style="width: 16.4198%; height: 29px;">Regional cluster</td>
<td style="width: 83.5802%; height: 29px;">Replicas of the contol plane runs in multiple zones of a given region. Nodes also run in the same zone where control planes run</td>
</tr>
<tr style="height: 29px;">
<td style="width: 16.4198%; height: 29px;">Private cluster</td>
<td style="width: 83.5802%; height: 29px;">VPC-Native cluster. Nodes only have internal IP address</td>
</tr>
<tr style="height: 29px;">
<td style="width: 16.4198%; height: 29px;">Alpha Cluster</td>
<td style="width: 83.5802%; height: 29px;">Access to early features for API</td>
</tr>
</tbody>
</table>
<h5 id="bkmrk-%C2%A0-52">Pods, containers etc</h5>
<ul id="bkmrk-a-pod-is-the-smalles">
<li>A pod is the smallest depolyable unit </li>
<li>It contains one or more containers</li>
<li>Each pod is assigned one or more epeheral IP address</li>
</ul>
<p id="bkmrk-all-containers-in-a-">All containers in a pod share:</p>
<ul id="bkmrk-network-storage-ip-a">
<li>Network</li>
<li>Storage</li>
<li>IP Address</li>
<li>Ports</li>
<li>Volumes (Shared PD)</li>
</ul>
<p id="bkmrk-they-can-have-many-s">They can have many status:<br>Running, Pending, Succeeded, failed or unknown</p>
<h5 id="bkmrk-deployment-vs-replic">deployment vs replica set</h5>
<ul id="bkmrk-a-deployment%C2%A0is-crea">
<li>A <strong>deployment </strong>is created for each microservice
<ul>
<li>kubectl create deployment m1 --image:m1:v1</li>
<li>deployment represents a microservice (With all it's releases)</li>
<li>deployment manages new releases ensuring 0 downtime</li>
</ul>
</li>
<li>replica set ensures that a specific number of pods are running for a microservice</li>
</ul>
<p id="bkmrk-deployment-is-from-s">Deployment is from shifting from one release to a new release</p>
<p id="bkmrk-replica-set-ensures-">replica set ensures that always has the correct number of pods</p>
<h5 id="bkmrk-kubernetes---service">Kubernetes - service</h5>
<ul id="bkmrk-service-ensure-that-">
<li>Service
<ul>
<li>Ensure that the external users are not inpacted when:
<ul>
<li>Pod fails</li>
<li>New release happens</li>
</ul>
</li>
</ul>
</li>
<li>create a service
<ul>
<li>exposes pods to the outside world using a stable IP</li>
<li>Ensures the the external world does not get impacted</li>
</ul>
</li>
<li>Three types of service
<ul>
<li>cluster IP: Internal to the cluster</li>
<li>LoadBalanccer: Exposes the service via the cloud providers load balancer</li>
<li>NodePort : Exposes service on each nodes' IP address
<ul>
<li>Use case: You don't want to create an external load balancer for each microservice, so create an ingress component to balance the load)</li>
</ul>
</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-kubernets-ingress">Kubernets Ingress</h5>
<ul id="bkmrk-this-is-the-reccomen">
<li>This is the reccomened approach for providing access to services in a cluster
<ul>
<li>Provides load balancing and SSL</li>
<li>control traffic by defining rules </li>
<li>Reccomendeatoin: Node Port service to each microservice. expose using an ingress rule</li>
<li>Ingress allows you to use a single load balancer and control ingress in to multiple micro services</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-container-registry">Container registry</h4>
<ul id="bkmrk-once-you-have-create">
<li>Once you have created a docker image, you need to push it somewhere</li>
<li>There is one fully managed by google called Google Container registry (GCR.io)</li>
<li>(alternative) docker HUb</li>
<li>Can be integrated with CICD (Cloud build)</li>
<li>GCR also has the ability to scan your containers for vulnerabilities </li>
<li>Naming: <br>gcr.io/&lt;project-name&gt;/&lt;container name&gt;:&lt;tag&gt;</li>
</ul>
<h5 id="bkmrk-creating-docker-imag">Creating docker images</h5>
<ul id="bkmrk-docker-file-contains">
<li>Docker file contains what the container needs to do to be created</li>
</ul>
<pre id="bkmrk-from-alpine%3A8.16.1-a"><code class="language-">FROM alpine:8.16.1-alpine
WORKDIR /app
COPY . /app
RUN npm install
EXPOSE 5000
CMD node index.js
</code></pre>
<p id="bkmrk-docker-file-explinat">Docker file explination</p>
<ul id="bkmrk-from%3A-use-a-base-ima">
<li>FROM: use a base image</li>
<li>WORKDIR: where the commands are to take place</li>
<li>RUN: execute a command</li>
<li>EXPOSE: Expose a network port</li>
<li>COPY: copy a file from local to remote</li>
<li>CMD: when the container is used, what command should be run when the container starts</li>
</ul>
<p id="bkmrk-best-practices%3A%C2%A0">Best practices: </p>
<ul id="bkmrk-image-should-be-as-s">
<li>Image should be as small as possible</li>
<li>Use small images (Alpine)</li>
<li>Do not copy unescarry node modules</li>
<li>Move the things that change the least to the top
<ul>
<li>for each command, a layer is created</li>
</ul>
</li>
<li>To speed up the creation, use as little layers as possibe that changes</li>
</ul>
<h5 id="bkmrk-google-cloud-functio">Google Cloud functions</h5>
<ul id="bkmrk-imagine-you-want-to-">
<li>Imagine you want to execute some code when an event happens
<ul>
<li>A file is uploaded in cloud storage</li>
<li>An error log is written to Cloud Logging</li>
<li>A message arrives to pub/sub</li>
</ul>
</li>
<li>Enter Cloud Functions
<ul>
<li>Run code in response to events</li>
<li>Great thing with cloud functions is you don't need to worry about the scaling of the code</li>
</ul>
</li>
<li>
<p class="callout info">Time bound<br>Default: 1 Minute<br>Maximum: 9 Minutes</p>
<ul>
<li>You cant use cloud functions to run a big batch job</li>
</ul>
</li>
<li>each run is run in a seperate instance so there is nothing shred</li>
</ul>
<h5 id="bkmrk-cloud-functions%3A-con">cloud Functions: concepts</h5>
<ul id="bkmrk-event%3A-upload-an-obj">
<li>Event: Upload an object</li>
<li>Trigger: what function to trigger when an event happens
<ul>
<li>When an HTTP call is recieved, you can run a job</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-cloud-run-%26-cloudrun">cloud run &amp; cloudrun for anthos</h5>
<ul id="bkmrk-cloud-run%3A-%22from-con">
<li>Cloud run: "from container to production in seconds"</li>
<li>Fully managed, serverless platofrm
<ul>
<li>Zero infrastructure to deploy</li>
<li>Pay per use (for CPU, memory and requests as well as networking)</li>
</ul>
</li>
<li>fully integrated, end to end developer experience
<ul>
<li>No limitations in languages</li>
<li>easily portable as it's a container</li>
<li>End to end develper experience
<ul>
<li>cloud code - IDE</li>
<li>Cloud Build - cicd</li>
<li>Cloud monitoring - Monitoring tool</li>
<li>Cloud ligging interacoitns - tracing </li>
</ul>
</li>
</ul>
</li>
<li>Anthos - run K8's anywhere 
<ul>
<li>cloud, multi-cloud, anywhere</li>
</ul>
</li>
<li>Cloudrun for anthos
<ul>
<li>Deploy the workloads to anthos clusters running on prmeise or on google cloud</li>
</ul>
</li>
</ul>
<table id="bkmrk-description-command-" style="border-collapse: collapse; width: 100%; height: 152px;" border="1">
<tbody>
<tr style="height: 29px;">
<td style="width: 50%; height: 29px;">Description</td>
<td style="width: 50%; height: 29px;">Command</td>
</tr>
<tr style="height: 73px;">
<td style="width: 50%; height: 73px;">Deploy a new container</td>
<td style="width: 50%; height: 73px;">
<pre><code class="language-">gcloud run deploy &lt;service name&gt; --image &lt;container image url&gt; --revision-suffix v&lt;number&gt;</code></pre>
<p>first deployment creates a service and revision</p>
<p>Next deployment for the same service create new revisions</p>
</td>
</tr>
<tr style="height: 21px;">
<td style="width: 50%; height: 21px;">List available revision</td>
<td style="width: 50%; height: 21px;">
<pre><code class="language-">gcloud run revisions list</code></pre>
</td>
</tr>
<tr style="height: 29px;">
<td style="width: 50%; height: 29px;">Adjust traffic assigments</td>
<td style="width: 50%; height: 29px;">
<pre><code class="language-">gcloud run services update-traffic &lt;service name&gt; --to-revisions=v&lt;number&gt;=&lt;number percentage&gt;,v&lt;other verison&gt;=&lt;number percentage&gt;</code></pre>
</td>
</tr>
</tbody>
</table>
<h4 id="bkmrk-kms">KMS</h4>
<h5 id="bkmrk-encryption">Encryption</h5>
<ul id="bkmrk-data-at-rest%3A-stored">
<li>Data at rest: Stored in a device or a backup
<ul>
<li>data on a hard disk, in a database or in archives</li>
</ul>
</li>
<li>data in Motion
<ul>
<li>data that is moving over the network </li>
<li>2 types:
<ul>
<li>In and out of the cloud (from the internet)</li>
<li>within the cloud</li>
</ul>
</li>
</ul>
</li>
<li>Data in use: Active data in a non-persisted state
<ul>
<li>Example: Data in your ram</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-symmetric-key-encryp">Symmetric key encryption</h5>
<ul id="bkmrk-symmetric-key-encryp-0">
<li>Symmetric key encryption algorithms use the same key for encryption and decryption </li>
</ul>
<p id="bkmrk-key-factor-1%3A-choose" class="callout info">Key factor 1: choose the right encryption algorithm<br>Key factor 2: How do we secure the </p>
<h5 id="bkmrk-%C2%A0-53">Asymmetric key Encryption</h5>
<ul id="bkmrk-2-keys%3A-public-and-p">
<li>2 keys: Public and private</li>
<li>Also called Public Key Cyprography</li>
<li>Encrypt data with public key and decrypt with private key</li>
<li>Share the public key with everybody and keep the private key with you</li>
</ul>
<h5 id="bkmrk-cloud-kms">Cloud KMS</h5>
<ul id="bkmrk-create-and-manage-cr">
<li>Create and manage Cryptogrphic keys (Symmetric and Asymmetric)</li>
<li>Control their use in GCP applications and services</li>
<li>Provide an API to encrypt, decrypt or sign data</li>
<li>Use existing cryptographic keys created on-premise</li>
<li>Integrates with almost all GCP services that need data encrypted
<ul>
<li>google-managed - No configuration required</li>
<li>Customer managed- Use keys from KMS</li>
<li>Customer supplied - Provide your own keys</li>
</ul>
</li>
<li>Protection level
<ul>
<li>HSM
<ul>
<li>Hardware</li>
</ul>
</li>
<li>Software
<ul>
<li>Software</li>
</ul>
</li>
</ul>
</li>
<li>You can pick what key to use when crating a VM
<ul id="bkmrk-ensure-that-the-serv">
<li>Ensure that the service account has the correct IAM roles</li>
</ul>
</li>
</ul>
<p id="bkmrk-%C2%A0-54"> </p>
<h4 id="bkmrk-storage">Storage</h4>
<h5 id="bkmrk-types">Types</h5>
<ul id="bkmrk-block-storage-persis">
<li>Block storage
<ul>
<li>Persistent disk
<ul>
<li>Zonal: replicated in one zone</li>
<li>Regional: Data replicated in multiple zones</li>
</ul>
</li>
<li>Local SSD's : Local block storage
<ul>
<li>Scratch disk : Not all machine types support local ssd. </li>
</ul>
</li>
</ul>
</li>
<li>File Storage:
<ul>
<li>Filestore</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-block-storage">Block storage</h5>
<ul id="bkmrk-hard-drive-only-can-">
<li>Hard drive</li>
<li>Only can be attached to one server</li>
<li>Can  attach <strong>read only </strong>block devices to many instances</li>
<li>You can connect multiple block storage devices to each VM</li>
<li>Use:
<ul>
<li>DAS</li>
<li>SAN
<ul>
<li>High performance Databases</li>
</ul>
</li>
</ul>
</li>
<li>Local SSD
<ul>
<li>Physically attached to the host of the vm instance</li>
<li>Typically used to hold cache</li>
<li>Lifecycle is tied to the VM instance
<ul>
<li>Restart the instance and data is gone</li>
</ul>
</li>
<li>High IOPS</li>
<li>Key is google managed</li>
<li>Not all machine types support Local SSD</li>
<li>Supports SCSI and NVMe
<ul>
<li>Ensure that your image has support</li>
</ul>
</li>
<li>For better performance, get a bigger one. Higher IOPS, or more vCPU</li>
<li>Cannot detatch and attach to another instance </li>
</ul>
</li>
<li>Persistant disk
<ul>
<li>Network provisioned block sotrage</li>
<li>Increase whilst running</li>
<li>Performance increase with size</li>
<li>Can remove and attach from instances</li>
<li>Regional PD's are x2 more expensive than zonal PD's </li>
</ul>
</li>
</ul>
<table id="bkmrk-feature-persistent-d" style="border-collapse: collapse; width: 100%; height: 180px;" border="1">
<tbody>
<tr style="height: 29px;">
<td style="width: 33.3333%; height: 29px;">Feature</td>
<td style="width: 33.3333%; height: 29px;">Persistent Disks</td>
<td style="width: 33.3333%; height: 29px;">Local SSD's</td>
</tr>
<tr style="height: 29px;">
<td style="width: 33.3333%; height: 29px;">Attached to VM instance</td>
<td style="width: 33.3333%; height: 29px;">As a network drive</td>
<td style="width: 33.3333%; height: 29px;">Physically attached</td>
</tr>
<tr style="height: 35px;">
<td style="width: 33.3333%; height: 35px;">Lifecycle</td>
<td style="width: 33.3333%; height: 35px;">Seperate from VM instance</td>
<td style="width: 33.3333%; height: 35px;">
<p>Tied with VM Instance</p>
</td>
</tr>
<tr style="height: 29px;">
<td style="width: 33.3333%; height: 29px;">I/O speed</td>
<td style="width: 33.3333%; height: 29px;">Lower (Network latency) </td>
<td style="width: 33.3333%; height: 29px;">10-100x of PD's</td>
</tr>
<tr style="height: 29px;">
<td style="width: 33.3333%; height: 29px;">Spanshots</td>
<td style="width: 33.3333%; height: 29px;">Yes</td>
<td style="width: 33.3333%; height: 29px;">No</td>
</tr>
<tr style="height: 29px;">
<td style="width: 33.3333%; height: 29px;">Use case</td>
<td style="width: 33.3333%; height: 29px;">Permanent storage</td>
<td style="width: 33.3333%; height: 29px;">Ephemeral storage</td>
</tr>
</tbody>
</table>
<h5 id="bkmrk-persistent-disks---s">Persistent Disks - Standard </h5>
<table id="bkmrk-feature-standard-bal" style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
<tr>
<td style="width: 25%;">Feature</td>
<td style="width: 25%;">Standard</td>
<td style="width: 25%;">Balanced</td>
<td style="width: 25%;">SSD</td>
</tr>
<tr>
<td style="width: 25%;">Underlying Storage</td>
<td style="width: 25%;">HDD</td>
<td style="width: 25%;">SSD</td>
<td style="width: 25%;">SSD</td>
</tr>
<tr>
<td style="width: 25%;">Referred to as</td>
<td style="width: 25%;">pd-standard</td>
<td style="width: 25%;">pd-balanced</td>
<td style="width: 25%;">pd-ssd</td>
</tr>
<tr>
<td style="width: 25%;">Perfomance - Sequential IOPS (Big/data batch)</td>
<td style="width: 25%;">Good</td>
<td style="width: 25%;">Good</td>
<td style="width: 25%;">Very good</td>
</tr>
<tr>
<td style="width: 25%;">Performance - Random IOPS</td>
<td style="width: 25%;">Bad</td>
<td style="width: 25%;">Good</td>
<td style="width: 25%;">Very good</td>
</tr>
<tr>
<td style="width: 25%;">Cost</td>
<td style="width: 25%;">Cheapest</td>
<td style="width: 25%;">In between</td>
<td style="width: 25%;">Expensive</td>
</tr>
<tr>
<td style="width: 25%;">Use Cases</td>
<td style="width: 25%;">Big data (Cost efficinet)</td>
<td style="width: 25%;">Balance between cost and eprformance</td>
<td style="width: 25%;"> </td>
</tr>
</tbody>
</table>
<h5 id="bkmrk-persistent-disks---s-0">Persistent disks - Snapshots</h5>
<ul id="bkmrk-take-a-point-in-time">
<li>Take a Point in time snapshot of your PD's</li>
<li>Schedule snapshots
<ul>
<li>Also Auto-delete snapshots after x days</li>
</ul>
</li>
<li>Multi-regional</li>
<li>Share across regions and projects</li>
<li>Incremental</li>
<li>Keep similar data together
<ul>
<li>Keep only boot info on the boot disk</li>
</ul>
</li>
<li>Avoid taking the snapshots less than an hour apart</li>
<li>Creating snapshots from disk is faster than creating from images
<ul>
<li>But creating disks from image is faster than creating from snapshots</li>
<li>Snapshots are incrimental</li>
<li>If you are repeatidly creating disks from snapshots:
<ul>
<li>Create an image then create disks</li>
</ul>
</li>
</ul>
</li>
<li>Attaching
<ul>
<li><code>gcloud compute instances attach-disk &lt;instance-name&gt; --disk &lt;disk-name&gt;</code></li>
<li>list the block devices
<ul>
<li>lsblk</li>
</ul>
</li>
<li>make the file system</li>
<li>Format it</li>
<li>mount it</li>
<li>assign permissions</li>
</ul>
</li>
<li>Resizing
<ul>
<li><code>gcloud compute disks resize &lt;disk name&gt; --size &lt;size&gt;</code></li>
</ul>
</li>
</ul>
<h5 id="bkmrk-file-storage">File storage</h5>
<ul id="bkmrk-where-files-are-stor">
<li>Where files are stored</li>
<li>Media workflows</li>
<li>For users to have quick and secure access</li>
<li>Can be shared by several servers</li>
<li>NFSv3</li>
<li>Provisioned capacity
<ul>
<li>How large a filestore do you want</li>
</ul>
</li>
<li>High performance filestore
<ul>
<li>16gbps</li>
<li>480k IOPS</li>
<li>Supports SSD and HDD</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-object-storage">Object storage</h5>
<ul id="bkmrk-cloud-storage-types-">
<li>Cloud storage</li>
<li>Types
<ul>
<li>Standard
<ul>
<li>General storage</li>
</ul>
</li>
<li>Nearline
<ul>
<li>Less than once a month</li>
</ul>
</li>
<li>Coldline
<ul>
<li>Less than once a quater</li>
</ul>
</li>
<li>archive
<ul>
<li>Less than once a year</li>
</ul>
</li>
</ul>
</li>
<li>Treat the entire object as one block, if you want to update it, you have to push the whole image (for xample)</li>
<li>Rest API to access the items
<ul>
<li>Provides a CLI
<ul>
<li>Not cloud</li>
<li>gsutil</li>
</ul>
</li>
</ul>
</li>
<li>When moving data the the cloud the best solution is to first move it to gcs then the product</li>
<li>bucket names should contain <strong>only </strong>lower case, number letter hyphens and underscores</li>
<li>3-63 charachters</li>
<li>should not contain google or start with goog</li>
<li>Unlimited objects in a bucket </li>
<li>Each object is identified with a unique key</li>
<li>Maximum object size is 5TB</li>
<li>Object versioning
<ul>
<li>It's enabled at bucket level</li>
<li>If you delete the live object, it becomes a non-current version</li>
<li>each version is identified by an object key and a generation number</li>
</ul>
</li>
<li>Object lifecycle managment
<ul>
<li>How to save costs
<ul>
<li>You will use object managemnt lifecucle</li>
</ul>
</li>
<li>Use conditions
<ul>
<li>Age</li>
<li>CreatedBefore</li>
<li>IsLive</li>
<li>MatcehsStorageClass</li>
<li>NumberOfNewerVersion</li>
</ul>
</li>
<li>Based on these ctiteria:
<ul>
<li>Move the objects </li>
<li>Delete the object</li>
<li>All Automated</li>
</ul>
</li>
</ul>
</li>
<li>Encrypting cloud storage
<ul>
<li>Cloud storage encrypts data on the server side <strong>by default </strong>
</li>
<li>Cloud storage will encrypt the data</li>
<li>2 types
<ul>
<li>Server side
<ul>
<li>Depending on GCS to encrypt it</li>
<li>Google Managed</li>
<li>Customer managed key
<ul>
<li>Ensure that the user has the correct IAM permissions</li>
</ul>
</li>
</ul>
</li>
<li>Client side
<ul>
<li>Encrypting before sending </li>
<li>You need to send the correct key when you store the data</li>
<li>Ensure that data is encrypted at rest</li>
<li>Add in the API headers</li>
<li> </li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>Metadata
<ul>
<li>Items have metadata attached to them</li>
<li>Fixed key metadata
<ul>
<li>These are the google provided ones we cant change
<ul>
<li>Cach-control - If the object is served to a user how long can they cache it for</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>Compliance
<ul>
<li>Configure data retention period</li>
<li>You can lock/ unlock a retention policy
<ul>
<li>By locking no one can edit the policy</li>
<li>Action is permanent. </li>
<li>You cant decrease it's retention period</li>
<li>Same thing can be done on bucket creation </li>
</ul>
</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-best-practives">Best practices</h5>
<ul id="bkmrk-avoid-sensative-name">
<li>Avoid sensitive names</li>
<li>Store in the closest region</li>
<li>Ramp up gradually the writes and reads per second</li>
<li>Do not use sequential names</li>
<li>Mount to a folder using cloud fuse</li>
</ul>
<p id="bkmrk-%C2%A0-55"> </p>
<h4 id="bkmrk-transferring-data-to">Transferring data to the cloud</h4>
<ul id="bkmrk-most-popular-solutio">
<li>Most popular solution is moving to GCS
<ul>
<li>Good for one time use</li>
<li>sub 1TB</li>
<li>On premise or another google storage  bucket</li>
</ul>
</li>
<li>Storage transfer service
<ul>
<li>Transfer from other cloud providers</li>
<li>Setup repeat schedules</li>
<li>reliable and fault tolerant</li>
<li>More than 1TB
<ul>
<li>options
<ul>
<li>GCS</li>
<li>S3</li>
<li>Azure</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>Transfer appliance
<ul>
<li>Physical Data appliance that is shipped to your Datacentre</li>
</ul>
</li>
</ul>
<p id="bkmrk-%C2%A0-56"> </p>
<p id="bkmrk-%C2%A0-57"> </p>
<h4 id="bkmrk-machine-image">Machine image</h4>
<ul id="bkmrk-machine-image-is-dif">
<li>Machine image is different from an image</li>
<li>Multiple disks can be attached with a VM</li>
<li>A machine image contains everything you need to create an instance</li>
<li>Basically a 1:1 copy of the whole thing.</li>
</ul>
<table id="bkmrk-scenarios-machine-im" style="border-collapse: collapse; width: 100%; height: 222px;" border="1">
<tbody>
<tr style="height: 45px;">
<td style="width: 20%; height: 45px;">Scenarios</td>
<td style="width: 20%; height: 45px;">Machine image</td>
<td style="width: 20%; height: 45px;">Persistent disk snapshot</td>
<td style="width: 20%; height: 45px;">Custom image</td>
<td style="width: 20%; height: 45px;">Instance template</td>
</tr>
<tr style="height: 29px;">
<td style="width: 20%; height: 29px;">Single disk abckup</td>
<td style="width: 20%; height: 29px;">Yes</td>
<td style="width: 20%; height: 29px;">Yes</td>
<td style="width: 20%; height: 29px;">Yes</td>
<td style="width: 20%; height: 29px;">NO</td>
</tr>
<tr style="height: 45px;">
<td style="width: 20%; height: 45px;">Multiple disk backup</td>
<td style="width: 20%; height: 45px;">Yes</td>
<td style="width: 20%; height: 45px;">No</td>
<td style="width: 20%; height: 45px;">No</td>
<td style="width: 20%; height: 45px;">No</td>
</tr>
<tr style="height: 29px;">
<td style="width: 20%; height: 29px;">Differential backup</td>
<td style="width: 20%; height: 29px;">Yes</td>
<td style="width: 20%; height: 29px;">Yes</td>
<td style="width: 20%; height: 29px;">No</td>
<td style="width: 20%; height: 29px;">No</td>
</tr>
<tr style="height: 45px;">
<td style="width: 20%; height: 45px;">Instance cloning and replication</td>
<td style="width: 20%; height: 45px;">Yes</td>
<td style="width: 20%; height: 45px;">No</td>
<td style="width: 20%; height: 45px;">Yes</td>
<td style="width: 20%; height: 45px;">Yes</td>
</tr>
<tr style="height: 29px;">
<td style="width: 20%; height: 29px;">VM Instance configuration</td>
<td style="width: 20%; height: 29px;">Yes</td>
<td style="width: 20%; height: 29px;">No</td>
<td style="width: 20%; height: 29px;">No</td>
<td style="width: 20%; height: 29px;"> </td>
</tr>
</tbody>
</table>
<p id="bkmrk-%C2%A0-58"> </p>
<h5 id="bkmrk-storage---scenarios-">Storage - Scenarios - Persistent Disks</h5>
<table id="bkmrk-scenario-solution-im" style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
<tr>
<td style="width: 50%;">Scenario</td>
<td style="width: 50%;">Solution</td>
</tr>
<tr>
<td style="width: 50%;">Improve the performance</td>
<td style="width: 50%;">Increase the size of the PD or add VCPU</td>
</tr>
<tr>
<td style="width: 50%;">Increase durability of PD</td>
<td style="width: 50%;">Regional PD</td>
</tr>
<tr>
<td style="width: 50%;">Hourly backup</td>
<td style="width: 50%;">Schedule hourly snapshots</td>
</tr>
<tr>
<td style="width: 50%;">delete old snapshots from schedule</td>
<td style="width: 50%;">Configure it as pert of your snapshot scheduling​</td>
</tr>
</tbody>
</table>
<h5 id="bkmrk-review---global%2C-reg">Review - Global, regional and zonal</h5>
<ul id="bkmrk-global-images-snapsh">
<li>Global
<ul>
<li>Images</li>
<li>Snapshots</li>
<li>Image snapshots</li>
</ul>
</li>
<li>Regional
<ul>
<li>Regional MIG</li>
<li>Regional MIG</li>
</ul>
</li>
<li>Zonal
<ul>
<li>Zonal MIG</li>
<li>Instances</li>
<li>Persistent disk
<ul>
<li>You can attach directly to an instnace</li>
</ul>
</li>
</ul>
</li>
</ul>
<p id="bkmrk-%C2%A0-59"> </p>
<p id="bkmrk-%C2%A0-60"> </p>
<p id="bkmrk-%C2%A0-61"> </p>

