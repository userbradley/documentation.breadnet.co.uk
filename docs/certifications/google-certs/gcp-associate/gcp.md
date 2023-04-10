---
title: GCP
reviewdate: '2022-01-01'
---

# GCP

<h4 id="bkmrk-https%3A%2F%2Fdocs.google." class="cloud-headline3" data-text="1. Setting up a cloud solution environment"><a href="https://docs.google.com/document/d/1u6pXBiGMYj7ZLBN21x6jap11rG6gWk7n210hNnUzrkI/edit">https://docs.google.com/document/d/1u6pXBiGMYj7ZLBN21x6jap11rG6gWk7n210hNnUzrkI/edit</a></h4>
<p id="bkmrk-https%3A%2F%2Fmedium.com%2F%40"><a href="https://medium.com/@sathishvj/writing-and-passing-the-google-cloud-associate-engineer-certification-a60c2f6d99c2">https://medium.com/@sathishvj/writing-and-passing-the-google-cloud-associate-engineer-certification-a60c2f6d99c2</a></p>
<p id="bkmrk-https%3A%2F%2Fgithub.com%2Fs">https://github.com/sathishvj/awesome-gcp-certifications</p>
<h3 id="bkmrk-1.-setting-up-a-clou" class="cloud-headline3" data-text="1. Setting up a cloud solution environment">1. Setting up a cloud solution environment</h3>
<p id="bkmrk-%C2%A0"> </p>
<p id="bkmrk-1.1-setting-up-cloud">1.1 Setting up cloud projects and accounts. Activities include:</p>
<div id="bkmrk-creating-projects-as">
<div>
<ul class="cloud-body-text">
<ul>
<li>Creating projects</li>
<li>Assigning users to predefined IAM roles within a project</li>
<li>Managing users in Cloud Identity (manually and automated)</li>
<li>Enabling APIs within projects</li>
<li>Provisioning one or more Stackdriver workspaces</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-1.2-managing-billing">1.2 Managing billing configuration. Activities include:</p>
<div id="bkmrk-creating-one-or-more">
<div>
<ul class="cloud-body-text">
<ul>
<li>Creating one or more billing accounts</li>
<li>Linking projects to a billing account</li>
<li>Establishing billing budgets and alerts</li>
<li>Setting up billing exports to estimate daily/monthly charges</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-1.3-installing-and-c">1.3 Installing and configuring the command line interface (CLI), specifically the Cloud SDK (e.g., setting the default project).</p>
<p id="bkmrk-%C2%A0-0"> </p>
<h3 id="bkmrk-2.-planning-and-conf" class="cloud-headline3 cloud-section-header" data-text="2. Planning and configuring a cloud solution">2. Planning and configuring a cloud solution</h3>
<p id="bkmrk-%C2%A0-1"> </p>
<p id="bkmrk-2.1-planning-and-est">2.1 Planning and estimating GCP product use using the Pricing Calculator</p>
<p id="bkmrk-2.2-planning-and-con">2.2 Planning and configuring compute resources. Considerations include:</p>
<div id="bkmrk-selecting-appropriat">
<div>
<ul class="cloud-body-text">
<ul>
<li>Selecting appropriate compute choices for a given workload (e.g., Compute Engine, Google Kubernetes Engine, App Engine, Cloud Run, Cloud Functions)</li>
<li>Using preemptible VMs and custom machine types as appropriate</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-2.3-planning-and-con">2.3 Planning and configuring data storage options. Considerations include:</p>
<div id="bkmrk-product-choice-%28e.g.">
<div>
<ul class="cloud-body-text">
<ul>
<li>Product choice (e.g., Cloud SQL, BigQuery, Cloud Spanner, Cloud Bigtable)</li>
<li>Choosing storage options (e.g., Standard, Nearline, Coldline, Archive)</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-2.4-planning-and-con">2.4 Planning and configuring network resources. Tasks include:</p>
<div id="bkmrk-differentiating-load">
<div>
<ul class="cloud-body-text">
<ul>
<li>Differentiating load balancing options</li>
<li>Identifying resource locations in a network for availability</li>
<li>Configuring Cloud DNS</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-%C2%A0-2"> </p>
<h3 id="bkmrk-3.-deploying-and-imp" class="cloud-headline3" data-text="3. Deploying and implementing a cloud solution">3. Deploying and implementing a cloud solution</h3>
<p id="bkmrk-3.1-deploying-and-im">3.1 Deploying and implementing Compute Engine resources. Tasks include:</p>
<div id="bkmrk-launching-a-compute-">
<div>
<ul class="cloud-body-text">
<ul>
<li>Launching a compute instance using Cloud Console and Cloud SDK (gcloud) (e.g., assign disks, availability policy, SSH keys)</li>
<li>Creating an autoscaled managed instance group using an instance template</li>
<li>Generating/uploading a custom SSH key for instances</li>
<li>Configuring a VM for Stackdriver monitoring and logging</li>
<li>Assessing compute quotas and requesting increases</li>
<li>Installing the Stackdriver Agent for monitoring and logging</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-3.2-deploying-and-im">3.2 Deploying and implementing Google Kubernetes Engine resources. Tasks include:</p>
<div id="bkmrk-deploying-a-google-k">
<div>
<ul class="cloud-body-text">
<ul>
<li>Deploying a Google Kubernetes Engine cluster</li>
<li>Deploying a container application to Google Kubernetes Engine using pods</li>
<li>Configuring Google Kubernetes Engine application monitoring and logging</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-3.3-deploying-and-im">3.3 Deploying and implementing App Engine, Cloud Run, and Cloud Functions resources. Tasks include, where applicable:</p>
<div id="bkmrk-deploying-an-applica">
<div>
<ul class="cloud-body-text">
<ul>
<li>Deploying an application, updating scaling configuration, versions, and traffic splitting</li>
<li>Deploying an application that receives Google Cloud events (e.g., Cloud Pub/Sub events, Cloud Storage object change notification events)</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-3.4-deploying-and-im">3.4 Deploying and implementing data solutions. Tasks include:</p>
<div id="bkmrk-initializing-data-sy">
<div>
<ul class="cloud-body-text">
<ul>
<li>Initializing data systems with products (e.g., Cloud SQL, Cloud Datastore, BigQuery, Cloud Spanner, Cloud Pub/Sub, Cloud Bigtable, Cloud Dataproc, Cloud Dataflow, Cloud Storage)</li>
<li>Loading data (e.g., command line upload, API transfer, import/export, load data from Cloud Storage, streaming data to Cloud Pub/Sub)</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-3.5-deploying-and-im">3.5 Deploying and implementing networking resources. Tasks include:</p>
<div id="bkmrk-creating-a-vpc-with-">
<div>
<ul class="cloud-body-text">
<ul>
<li>Creating a VPC with subnets (e.g., custom-mode VPC, shared VPC)</li>
<li>Launching a Compute Engine instance with custom network configuration (e.g., internal-only IP address, Google private access, static external and private IP address, network tags)</li>
<li>Creating ingress and egress firewall rules for a VPC (e.g., IP subnets, tags, service accounts)</li>
<li>Creating a VPN between a Google VPC and an external network using Cloud VPN</li>
<li>Creating a load balancer to distribute application network traffic to an application (e.g., Global HTTP(S) load balancer, Global SSL Proxy load balancer, Global TCP Proxy load balancer, regional network load balancer, regional internal load balancer)</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-3.6-deploying-a-solu">3.6 Deploying a solution using Cloud Marketplace. Tasks include:</p>
<div id="bkmrk-browsing-cloud-marke">
<div>
<ul class="cloud-body-text">
<ul>
<li>Browsing Cloud Marketplace catalog and viewing solution details</li>
<li>Deploying a Cloud Marketplace solution</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-3.7-deploying-applic">3.7 Deploying application infrastructure using Cloud Deployment Manager. Tasks include:</p>
<div id="bkmrk-developing-deploymen">
<div>
<ul class="cloud-body-text">
<ul>
<li>Developing Deployment Manager templates</li>
<li>Launching a Deployment Manager template</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-%C2%A0-3"> </p>
<h3 id="bkmrk-4.-ensuring-successf" class="cloud-headline3" data-text="4. Ensuring successful operation of a cloud solution">4. Ensuring successful operation of a cloud solution</h3>
<p id="bkmrk-%C2%A0-4"> </p>
<p id="bkmrk-4.1-managing-compute">4.1 Managing Compute Engine resources. Tasks include:</p>
<div id="bkmrk-managing-a-single-vm">
<div>
<ul class="cloud-body-text">
<ul>
<li>Managing a single VM instance (e.g., start, stop, edit configuration, or delete an instance)</li>
<li>SSH/RDP to the instance</li>
<li>Attaching a GPU to a new instance and installing CUDA libraries</li>
<li>Viewing current running VM inventory (instance IDs, details)</li>
<li>Working with snapshots (e.g., create a snapshot from a VM, view snapshots, delete a snapshot)</li>
<li>Working with images (e.g., create an image from a VM or a snapshot, view images, delete an image)</li>
<li>Working with instance groups (e.g., set autoscaling parameters, assign instance template, create an instance template, remove instance group)</li>
<li>Working with management interfaces (e.g., Cloud Console, Cloud Shell, GCloud SDK)</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-4.2-managing-google-">4.2 Managing Google Kubernetes Engine resources. Tasks include:</p>
<div id="bkmrk-viewing-current-runn">
<div>
<ul class="cloud-body-text">
<ul>
<li>Viewing current running cluster inventory (nodes, pods, services)</li>
<li>Browsing the container image repository and viewing container image details</li>
<li>Working with node pools (e.g., add, edit, or remove a node pool)</li>
<li>Working with pods (e.g., add, edit, or remove pods)</li>
<li>Working with services (e.g., add, edit, or remove a service)</li>
<li>Working with stateful applications (e.g. persistent volumes, stateful sets)</li>
<li>Working with management interfaces (e.g., Cloud Console, Cloud Shell, Cloud SDK)</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-4.3-managing-app-eng">4.3 Managing App Engine and Cloud Run resources. Tasks include:</p>
<div id="bkmrk-adjusting-applicatio">
<div>
<ul class="cloud-body-text">
<ul>
<li>Adjusting application traffic splitting parameters</li>
<li>Setting scaling parameters for autoscaling instances</li>
<li>Working with management interfaces (e.g., Cloud Console, Cloud Shell, Cloud SDK)</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-4.4-managing-storage">4.4 Managing storage and database solutions. Tasks include:</p>
<div id="bkmrk-moving-objects-betwe">
<div>
<ul class="cloud-body-text">
<ul>
<li>Moving objects between Cloud Storage buckets</li>
<li>Converting Cloud Storage buckets between storage classes</li>
<li>Setting object life cycle management policies for Cloud Storage buckets</li>
<li>Executing queries to retrieve data from data instances (e.g., Cloud SQL, BigQuery, Cloud Spanner, Cloud Datastore, Cloud Bigtable)</li>
<li>Estimating costs of a BigQuery query</li>
<li>Backing up and restoring data instances (e.g., Cloud SQL, Cloud Datastore)</li>
<li>Reviewing job status in Cloud Dataproc, Cloud Dataflow, or BigQuery</li>
<li>Working with management interfaces (e.g., Cloud Console, Cloud Shell, Cloud SDK)</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-4.5-managing-network">4.5 Managing networking resources. Tasks include:</p>
<div id="bkmrk-adding-a-subnet-to-a">
<div>
<ul class="cloud-body-text">
<ul>
<li>Adding a subnet to an existing VPC</li>
<li>Expanding a subnet to have more IP addresses</li>
<li>Reserving static external or internal IP addresses</li>
<li>Working with management interfaces (e.g., Cloud Console, Cloud Shell, Cloud SDK)</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-4.6-monitoring-and-l">4.6 Monitoring and logging. Tasks include:</p>
<div id="bkmrk-creating-stackdriver">
<div>
<ul class="cloud-body-text">
<ul>
<li>Creating Stackdriver alerts based on resource metrics</li>
<li>Creating Stackdriver custom metrics</li>
<li>Configuring log sinks to export logs to external systems (e.g., on-premises or BigQuery)</li>
<li>Viewing and filtering logs in Stackdriver</li>
<li>Viewing specific log message details in Stackdriver</li>
<li>Using cloud diagnostics to research an application issue (e.g., viewing Cloud Trace data, using Cloud Debug to view an application point-in-time)</li>
<li>Viewing Google Cloud Platform status</li>
<li>Working with management interfaces (e.g., Cloud Console, Cloud Shell, Cloud SDK)</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-%C2%A0-5"> </p>
<h3 id="bkmrk-5.-configuring-acces" class="cloud-headline3" data-text="5. Configuring access and security">5. Configuring access and security</h3>
<p id="bkmrk-%C2%A0-6"> </p>
<p id="bkmrk-5.1-managing-identit">5.1 Managing identity and access management (IAM). Tasks include:</p>
<div id="bkmrk-viewing-iam-role-ass">
<div>
<ul class="cloud-body-text">
<ul>
<li>Viewing IAM role assignments</li>
<li>Assigning IAM roles to accounts or Google Groups</li>
<li>Defining custom IAM roles</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-5.2-managing-service">5.2 Managing service accounts. Tasks include:</p>
<div id="bkmrk-managing-service-acc">
<div>
<ul class="cloud-body-text">
<ul>
<li>Managing service accounts with limited privileges</li>
<li>Assigning a service account to VM instances</li>
<li>Granting access to a service account in another project</li>
</ul>
</ul>
</div>
</div>
<p id="bkmrk-5.3-viewing-audit-lo">5.3 Viewing audit logs for project and managed services.</p>