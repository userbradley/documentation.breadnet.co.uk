---
title: GCP Security, page 1
---

# GCP Security, page 1

<h2 id="bkmrk-google-cloud-profess" class="align-center">Google cloud Professional Security Engineer</h2>
<p id="bkmrk-"><br></p>
<p id="bkmrk-the-exam-itself%2C-is-">The exam itself, is a multiple choice 2 hour test.&nbsp;</p>
<hr id="bkmrk--0">
<p id="bkmrk-%C2%A0"><br></p>
<p id="bkmrk--1"></p>
<h4 id="bkmrk-regions-and-zones">Regions and Zones</h4>
<p id="bkmrk-when-we-architect-ou">When we architect our application we need to deploy our application closes to our users, as well as spanning multiple zones.</p>
<p id="bkmrk-google-cloud-is-spli">Google cloud is split into&nbsp;<strong>Regions&nbsp;</strong>and&nbsp;<strong>Zones</strong></p>
<ul id="bkmrk-region-a-geographica">
<li class="null">Region
<ul>
<li class="null">A geographical location that the DC sits in</li>
<li class="null">Example being europe-west2</li>
</ul>
</li>
<li>Zone
<ul>
<li>A specific Data Centre in the Region</li>
<li>Example being: europe-west2-c</li>
</ul>
</li>
</ul>
<p id="bkmrk-some-applications-%28l">Some applications (Like the ones I am working on currently) - We are not allowed to store Date outside the border of the United Kingdom.&nbsp;</p>
<p id="bkmrk-whilst-google-don%27t-">Whilst Google don't release information about their exact locations, we are able to make a good guess it's in Slough&nbsp;</p>
<p id="bkmrk-these-data-centers-a">These data centers are connected via High speed connections (Fibre cables)&nbsp;</p>
<hr id="bkmrk--11">
<p id="bkmrk-%C2%A0-0"><br></p>
<h4 id="bkmrk-gcp-services">GCP Services</h4>
<ul id="bkmrk-encryption-allows-go">
<li class="null">Encryption
<ul>
<li class="null">Allows Google Managed keys</li>
<li class="null">Allows uploading your own keys</li>
</ul>
</li>
<li class="null">VPC
<ul>
<li class="null">Secure private cloud</li>
<li class="null">VPC Peering
<ul>
<li class="null">Peers VPC's between projects and accounts</li>
<li class="null">Routes traffic</li>
</ul>
</li>
<li class="null">VPC Sharing
<ul>
<li class="null">Allows projects to put resources on a shared VPC</li>
</ul>
</li>
</ul>
</li>
<li class="null">Hybrid Connectivity
<ul>
<li class="null">Secure private connection between your premise and the cloud</li>
</ul>
</li>
<li class="null">Data Loss&nbsp;
<ul>
<li class="null">Detect sensitive Data and scrub it</li>
</ul>
</li>
<li class="null">Security Command Centre
<ul>
<li class="null">Allows us to view all security issues</li>
</ul>
</li>
<li>Binary Authorization
<ul>
<li>Allows only certain docker images to run</li>
</ul>
</li>
<li>Web Security Scanner
<ul>
<li>Scans internal web apps for security vulnerabilities&nbsp;</li>
</ul>
</li>
<li>IAM &amp; Admin
<ul>
<li>IAM<br>
<ul>
<li>Identity and Access Management</li>
<li>Who can do what, when and with what</li>
</ul>
</li>
</ul>
</li>
</ul>
<p id="bkmrk-%C2%A0-1"><br></p>
<h4 id="bkmrk-security-at-google-a">Security at Google and how it helps</h4>
<ul id="bkmrk-what-google-does-to-">
<li class="null">What google does to secure your app/ data</li>
<li class="null">How google does all these</li>
<li class="null">Security Mechanisms at different layers</li>
<li class="null">Shared Responsibility model</li>
<li class="null">Tools provided by GCP</li>
<li class="null">Regulatory Compliance</li>
</ul>
<h5 id="bkmrk-why-trust-google">Why trust google</h5>
<ul id="bkmrk-they-have-over-7-bil">
<li class="null">They have over 7 billion users</li>
<li class="null">Security is a main concern for them</li>
<li class="null">Your applicaiton is deployed in the same infrastructure as Google.com and google workspaces applications</li>
<li class="null">They have dedicated engineers 24/7 working for security</li>
</ul>
<h5 id="bkmrk-how-google-secure%C2%A0th">How google Secure&nbsp;<strong>their&nbsp;</strong>infrastructure</h5>
<ul id="bkmrk-hardware-layer-less-">
<li>Hardware layer
<ul>
<li>Less than 1% of Google employees have access to the Data Centre</li>
<li>Google builds all their own hardware
<ul>
<li>Routers, switches, etc</li>
</ul>
</li>
</ul>
</li>
<li>IAM
<ul>
<li>Identity and access management</li>
<li>Allows users to do some stuff and blocks them to do others</li>
</ul>
</li>
<li>User Management
<ul>
<li>Google Account authentication
<ul>
<li>SMAL support</li>
</ul>
</li>
<li>Enforce user rules
<ul>
<li>2fa</li>
<li>Minimum password</li>
</ul>
</li>
</ul>
</li>
<li>Storage data
<ul>
<li>Encrypts all your data&nbsp;</li>
<li>Keys:
<ul>
<li>Google managed by <strong>default</strong></li>
<li>Customer Supplied&nbsp;</li>
<li>Customer Managed&nbsp;</li>
</ul>
</li>
</ul>
</li>
<li>IAP
<ul>
<li>Identity Aware Proxy</li>
<li>Secures Applications via google login</li>
<li>Built in DDOS prevention</li>
</ul>
</li>
<li>DLP
<ul>
<li>Inspects Data</li>
<li>Can be configured to Find and Redact</li>
<li>Transform data</li>
<li>Can be used to re-identify it</li>
</ul>
</li>
<li>VPC<br>
<ul>
<li>Firewall rules</li>
<li>Cloud Armour</li>
<li>Ingress/ Egress rules</li>
</ul>
</li>
<li>Operations
<ul>
<li>Logging</li>
<li>Monitoring</li>
<li>Tracing</li>
<li>Profiling</li>
</ul>
</li>
<li>Regulatory Compliance
<ul>
<li>Encryption, hardware, VPC firewall is technical aspect of security</li>
<li>Compliance is another important factor
<ul>
<li>Google cloud follows these standards</li>
</ul>
</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-shared-responsibilit">Shared Responsibility Model</h5>
<p id="bkmrk-google-is-responsibl">Google is responsible for securing some aspects of your deployment, like the underlying hardware/ infra, whereas you need to ensure that your application is patched (At a bare minimum)&nbsp;</p>
<p id="bkmrk--12"><img src="/assets/data-incident-response-figure-1.png"></p>
<p id="bkmrk-%C2%A0-2">The above chart shows who play more roles around where, and by whom</p>
<p id="bkmrk-we-can-see-that-for-">We can see that for <strong>On-prem,&nbsp;</strong>it's entirely your problem</p>
<p id="bkmrk-where-as-when-we-go-">Whereas when we go to Software As A Service (SaaS) -&nbsp; All the underlying infrastructure, usage, deployment etc. is the providers' problem.&nbsp;</p>
<h3 id="bkmrk-%C2%A0-3">Cloud Identity</h3>
<p id="bkmrk-there-are-5-%27cloud-i">There are 5 <em>'Cloud Identities':</em></p>
<ol id="bkmrk-google-account-servi">
<li class="null">Google Account</li>
<li class="null">Service Account</li>
<li class="null">Google Workspace&nbsp;</li>
<li class="null">Cloud Identity Domain</li>
<li class="null">Google Groups</li>
</ol>
<p id="bkmrk-the-above-are-then-a">The above are then able to interact with Google Cloud Platform (GCP)</p>
<p id="bkmrk-in-every-single-iden">In every single identity, they are&nbsp;<em>similar&nbsp;</em>to Email address'&nbsp;</p>
<p id="bkmrk-cloud-identity-is-a-">Cloud Identity is a Managed service that manages users.&nbsp;</p>
<p id="bkmrk-%C2%A0-4"><br></p>
<h4 id="bkmrk-cloud-identity---goo">Cloud Identity - Google Workspace</h4>
<p id="bkmrk-this-is-the-renames-">This is the renames product previously called G-Suit</p>
<ul id="bkmrk-similar-to-office-36">
<li class="null">Similar to Office 365
<ul>
<li class="null">Slides</li>
<li class="null">Sheets</li>
<li class="null">Docs</li>
<li class="null">Etc</li>
</ul>
</li>
<li>You can get a verified domain
<ul>
<li>Domain like breadnet.co.uk - Verify ownership</li>
</ul>
</li>
<li>You get complete user management for all the users under the domain</li>
<li>Free 15 days trial, then $6 per user per month</li>
<li>Access via admin.google.com</li>
<li>If you already have Google Workspace, then it automatically verifies your Google cloud domain</li>
</ul>
<p id="bkmrk-%C2%A0-5"><br></p>
<p id="bkmrk-sections-have-been-s"><em>Sections have been skipped on Udemy as knowledge is pre-existing</em></p>
<h3 id="bkmrk-admin-console">Admin Console</h3>
<p id="bkmrk-the-below-section-is">The below section is about the Google cloud admin console</p>
<h4 id="bkmrk-resource-hierarchy%C2%A0">Resource Hierarchy&nbsp;</h4>
<p id="bkmrk-at-the-top%C2%A0">At the top you have the Organization<br>Below the ORG you can have folders<br>Below folders, you have projects</p>
<p id="bkmrk-%C2%A0-6"><br></p>
<p id="bkmrk-at-each-level-you-ar">At each level you are able to set IAM and policies</p>
<ul id="bkmrk-you-can-nest-folders">
<li>You can nest folders up to 10 (<strong>ten</strong>) levels deep.</li>
<li>A parent folder cannot contain more than 300 folders. This refers to direct child folders only. Those child folders can, in turn, contain additional folders or projects.</li>
<li>Folder display names must be unique within the same level of the hierarchy.</li>
</ul>
<p id="bkmrk--13"><a href="/assets/PSJKUlFwm2Zluoes-image-1651955845728.png" target="_blank" rel="noopener"><img src="/assets/PSJKUlFwm2Zluoes-image-1651955845728.png" alt="image-1651955845728.png"></a></p>
<hr id="bkmrk--14">
<h4 id="bkmrk-%C2%A0-7"><br></h4>
<h4 id="bkmrk-organization-policie">Organization Policies&nbsp;</h4>
<p id="bkmrk-%C2%A0-8">For argument’s sake, we will look at how to enable/ disable 3 policies:</p>
<ol id="bkmrk-disable-service-acco">
<li class="null">Disable Service Account Creation</li>
<li class="null">Enforce Uniform bucket level access</li>
<li class="null">Skip Default network creation</li>
</ol>
<h5 id="bkmrk-how-to">How to Enable</h5>
<pre id="bkmrk-iam-%3E-organization-p"><code class="language-">IAM &gt; Organization Policies &gt; Disable Service account creation&nbsp;</code></pre>
<p id="bkmrk-%C2%A0-9">Here we are able to define what level the policy applies at.&nbsp;</p>
<h5 id="bkmrk-how-to-disable-on-a-">How to disable on a project when it's inheriting</h5>
<p id="bkmrk-if-you-need-to-remov">If you need to remove something that is inherited, you select Customize &gt; Enforcement &gt; Off</p>
<p id="bkmrk-%C2%A0-10"><br></p>
<h3 id="bkmrk--15">IAM</h3>
<h4 id="bkmrk-intro">Intro</h4>
<ul id="bkmrk-iam-stands-for-ident">
<li class="null">IAM stands for Identity and Access management</li>
<li class="null">Defines: Who can do what and on which
<ul>
<li class="null">Who:
<ul>
<li class="null">Identity</li>
<li class="null">Member</li>
<li class="null">Email</li>
</ul>
</li>
<li>What
<ul>
<li>Roles
<ul>
<li>Collections of permissions</li>
</ul>
</li>
</ul>
</li>
<li>Which
<ul>
<li>Resources:
<ul>
<li>Compute Engine</li>
<li>app engine</li>
<li>Bigquery</li>
<li>etc</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
<p id="bkmrk-%C2%A0-11">&nbsp;</p>
<h4 id="bkmrk-roles">Roles</h4>
<p id="bkmrk-there-are-3-types-of">There are 3 types of roles in Google Cloud Platform</p>
<p id="bkmrk-roles-are-defined-as">Roles are defined as a&nbsp;<em>Collection of Permissions</em></p>
<ul id="bkmrk-%C2%A0primitive-these-are">
<li class="null">&nbsp;Primitive
<ul>
<li class="null">These are super simple roles, and should usually be avoided as good as possible&nbsp;
<ul>
<li class="null">Owner
<ul>
<li class="null">Editor</li>
<li class="null">Viewer</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>Pre-defined
<ul>
<li>These roles are roles on a single service
<ul>
<li>Examples:
<ul>
<li>Compute admin</li>
<li>Network Viewer</li>
<li>BQ Job User</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>Custom roles
<ul>
<li>These are roles you make for your org or project based on specifics from predefined roles,</li>
<li>They usually follow the layout like</li>
<li>service.resource-type.verb<br></li>
</ul>
</li>
</ul>
<p id="bkmrk--2"><br></p>
<p id="bkmrk-%C2%A0-12"><br></p>
