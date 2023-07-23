---
title: Google cloud architect - page 2
---

# Google cloud architect - page 2

<h4 id="bkmrk-iam">IAM</h4>
<!--suppress ALL -->










<ul id="bkmrk-resources-humans-non">
<li>Resources
<ul>
<li>Humans</li>
<li>Non-humans</li>
</ul>
</li>
<li>Identities can be:
<ul>
<li>Users</li>
<li>Groups</li>
<li>Application running in GCP</li>
<li>Application running in your Datacentre</li>
<li>Unauthenticated users</li>
</ul>
</li>
<li>Granular control
<ul>
<li>Limit a singular user
<ul>
<li>Perform actions</li>
<li>On a specific cloud resource</li>
<li>From a specific IP address</li>
<li>During a specific time</li>
</ul>
</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-iam%3A-example">IAM: Example</h5>
<ul id="bkmrk-want-to-provide-acce">
<li>Want to provide access for a colleague to specific cloud bucket
<ul>
<li>Important generic concepts
<ul>
<li>Member: My Colleague</li>
<li>Resources: Specific cloud storage bucket</li>
<li>Action: Upload/ Delete objects</li>
</ul>
</li>
<li>In google cloud IAM
<ul>
<li>Roles: Set of permissions
<ul>
<li>Roles do not know about members</li>
</ul>
</li>
<li>How do you assign permissions to a member:
<ul>
<li>Policy: You assign (Or bind) a role to a member</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>Choose a role with the right permissions</li>
<li>Create a Policy binding the members with the role</li>
</ul>
<h5 id="bkmrk-iam%3A-roles">IAM: Roles</h5>
<ul id="bkmrk-roles-are-permission">
<li>Roles are permissions
<ul>
<li>Perform some set of actions on some set of resources</li>
</ul>
</li>
<li>3 types
<ul>
<li>basic roles: (or primitive roles)
<ul>
<li>Viewers (roles.viewer) read only access</li>
<li>Editor (roles.editor) Viewer and edit action</li>
<li>Owner (roles.owner) Editor + manage roles and permissions + Billing</li>
<li>Not recommended: Don't use in prod</li>
</ul>
</li>
<li>Predefined rules - fine grained riles predefined and managed by google</li>
<li>Custom roles - when pre-defined roles are not sufficient </li>
</ul>
</li>
<li>If creating a role, ensure you give it a good ID</li>
<li>There are also role versions to use, so:
<ul>
<li>Alpha, beta, General availability, Disabled</li>
</ul>
</li>
<li>Most of the roles will give you:
<ul>
<li>resourcemanager.projects.get</li>
<li>resourcemanager.projects.list</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-iam---most-important">IAM - Most important concepts </h5>
<ul id="bkmrk-you-create-a-role-wh">
<li>You create a role which contains the permissions</li>
<li>You bind the role to a user with a policy</li>
</ul>
<h5 id="bkmrk-iam---service-accoun">IAM - Service accounts</h5>
<ul id="bkmrk-an-application-needs">
<li>An application needs to auth with something on the GCP platform</li>
<li>You <strong>do not want to </strong>use an actual account for this, so you use a service account</li>
<li>Identifiable via email:
<ul>
<li>Does not have a password</li>
<li>Has a private/public rsa key</li>
<li>cant login via browser or cookies</li>
</ul>
</li>
<li>Service account types
<ul>
<li>Default service account - Not reccomended to use</li>
<li>User managed - User created
<ul>
<li>Provides fine grained access control</li>
</ul>
</li>
</ul>
</li>
<li>Add roles to the service account if you're backing up to GCS</li>
<li>You cannot assign a service account to an on-prem application</li>
<li>This is called long lived 
<ol>
<li>Create service account with right permissions</li>
<li>Create service account user managed keu
<ol>
<li>gcloud iam service-accounts keys create</li>
</ol>
</li>
<li>Make the service account key accessable by your application
<ol>
<li>ENV variable should be: GOOGLE_APPLICATION_CREDENTIALS</li>
</ol>
</li>
<li>use google cloud client libraries - ADC (Application default credentials)</li>
</ol>
</li>
<li>Short lived:
<ul>
<li>Few hours of access</li>
<li>Credential types:
<ul>
<li>Oauth2</li>
<li>OpenID Connect ID tokens
<ul>
<li>Service to service authentication for short periods of time</li>
</ul>
</li>
<li>Self signed json web tokens</li>
</ul>
</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-iam-best-practices">IAM Best Practices</h5>
<ul id="bkmrk-principle-of-least-p">
<li>Principle of least privelage
<ul>
<li>Give the least possible privelage needed for a role</li>
</ul>
</li>
<li>Use service accoutns with Minimum privelages</li>
<li>Seperation of Duties
<ul>
<li>Involve at least 2 people
<ul>
<li>Have seperate traffic deployer and traffic migrator roles</li>
<li>Breaks up issues from one person not seeing something </li>
</ul>
</li>
</ul>
</li>
<li>Constant monitoring
<ul>
<li>Always view the logs and see who is accessing your service account</li>
<li>Ensure audit logs are archived </li>
</ul>
</li>
<li>Use groups when ever possible
<ul>
<li>Bind roles to groups</li>
<li>Just add a new user to the group</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-understanding-identi">Understanding Identity managment</h5>
<ul id="bkmrk-email-used-%3D-super-a">
<li>Email used = Super Admin</li>
<li>Google workspace
<ul>
<li>If you use workspace, you can link them and manage groups from there</li>
</ul>
</li>
<li>Not using Workspace
<ul>
<li>You can link your identity provider
<ul>
<li>Federate google cloud with your identity provier</li>
</ul>
</li>
</ul>
</li>
<li>Fererate
<ul>
<li>You want to auth with your external idP (Identity provider)</li>
<li>Example isActive directory</li>
<li>We can 'Federate' cloud identity </li>
</ul>
</li>
<li>Example:
<ul>
<li>Federate AD with GCDS then ADFS</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-corporate-directory-">Corporate directory federation</h5>
<ul id="bkmrk-federate-identity-pr">
<li>Federate identity provider with your external IDP</li>
<li>Enable SSO
<ul>
<li>Users go to google cloud</li>
<li>Redirected to external IDP</li>
<li>Users sign in</li>
<li>SAML assertion is send to GCP</li>
</ul>
</li>
<li> </li>
</ul>
<p id="bkmrk-%C2%A0"> </p>
<h5 id="bkmrk-iam-members%2F-identit">Iam Members/ Identites</h5>
<ul id="bkmrk-google-account-servi">
<li>Google account</li>
<li>Service account</li>
<li>Google group
<ul>
<li>Unique email adress</li>
<li>Manage permissions in one place</li>
</ul>
</li>
<li>Workspace Domain</li>
<li>Cloud Identity as a service (IDaaS)</li>
</ul>
<p id="bkmrk-%C2%A0-0"> </p>
<h5 id="bkmrk-acl---access-control">ACL - Access control list</h5>
<ul id="bkmrk-access-control-lists">
<li>Access Control Lists define who has access to your buckets and objects</li>
<li>How is this different from IAM?
<ul>
<li>IAM permissions apply to all objects in a bucket</li>
<li>ACL's can be used to customize specific access to different objects</li>
</ul>
</li>
<li>Users get access if they are allowed by either IAM or ACL</li>
<li>Use IAM for permissions to the whole bucket (Uniform access)</li>
<li>ACL for access to individual objects</li>
<li>Buckets have 2 levels:
<ul>
<li>Fine-grained
<ul>
<li>Per object access</li>
</ul>
</li>
<li>Uniform
<ul>
<li>NO object level ACL</li>
</ul>
</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-signed-url">Signed URL</h5>
<ul id="bkmrk-allow-users-to-acces">
<li>Allow users to access the objects for a short period of time</li>
<li>No login required</li>
<li>Create a signed URL with a service account with the desired permissions, then create a key for that URL, and assign it to the signed URL<br><code>gsutil signurl -d &lt;number&gt;m &lt;key&gt; gs://&lt;bucket&gt;/&lt;object path&gt;</code>
</li>
</ul>
<p id="bkmrk-%C2%A0-1"> </p>
<h4 id="bkmrk-web-servies">Web servies</h4>
<h5 id="bkmrk-expose-static-site-u">Expose static site using cloud storage</h5>
<ol id="bkmrk-create-a-bucket-with">
<li>Create a bucket with the same dns name as your site
<ol>
<li>Verify that you own it</li>
</ol>
</li>
<li>Copy files to the bucket</li>
<li>Set uniform access to the bucket
<ol>
<li>Set to `All Users`</li>
<li>grant view all objects</li>
</ol>
</li>
</ol>
<h4 id="bkmrk-databases">Databases</h4>
<h5 id="bkmrk-fundamentals">Fundamentals</h5>
<ul id="bkmrk-databases-provice-or">
<li>Databases provice organized and Persistent storage for your data</li>
<li>To choose between different databse types we would need to understand:
<ul>
<li>Availability</li>
<li>Durability</li>
<li>RTO</li>
<li>RPO</li>
<li>Consistency</li>
<li>transactions</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-availability-and-dur">Availability and Durability</h5>
<ul id="bkmrk-availibility%C2%A0-will-i">
<li>
<h5>Availability </h5>
<ul>
<li>Will I be able to access my data when I need it</li>
<li>Percentage of the time an application provides operations</li>
</ul>
</li>
<li>
<h5>Durability</h5>
<ul>
<li>Will my data be available in x years</li>
</ul>
</li>
<li>What does durability mean?
<ul id="bkmrk-not-losing-data">
<li>Not losing data</li>
</ul>
</li>
<li>How to increase it
<ul id="bkmrk-replicate-the-data%C2%A0-">
<li>Replicate the data </li>
<li>Ensure sonsistency </li>
</ul>
</li>
</ul>
<h5 id="bkmrk-rto-%26-rpo">RTO &amp; RPO</h5>
<ul id="bkmrk-rto-recovery-time-ob">
<li>RTO
<ul>
<li>Recovery time objective
<ul>
<li>Maximum acceptable downtime</li>
</ul>
</li>
</ul>
</li>
<li>RPO
<ul>
<li>Recovery point objective
<ul>
<li>Maximum acceptable period of data loss</li>
</ul>
</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-read-replicas">Read Replicas</h5>
<p id="bkmrk-if-you-have-an-appli">If you have an application that has high reads, you can create a read replica</p>
<p id="bkmrk-if-there-is-a-master">If there is a master failure you can promote one of the slaves to master</p>
<h5 id="bkmrk-consistency">Consistency</h5>
<ul id="bkmrk-strong-consistency-s">
<li>Strong consistency
<ul>
<li>Synchronized to all replicas
<ul>
<li>Transaction will slow down if you have alot of replicas</li>
</ul>
</li>
</ul>
</li>
<li>Eventual constancy
<ul>
<li>A little lag between replication</li>
<li>Used when scalability is more important than data integrity</li>
</ul>
</li>
<li>Read after write consisteny 
<ul>
<li>Inserts are immediately available in all replicas</li>
<li>Updates are doe via eventual consistency </li>
</ul>
</li>
</ul>
<h5 id="bkmrk-categories%C2%A0">Categories </h5>
<ul id="bkmrk-relational%C2%A0-oltp-onl">
<li>Relational 
<ul>
<li>OLTP
<ul>
<li>Online transaction processing</li>
</ul>
</li>
<li>OLAP
<ul>
<li>Online analytics processing</li>
</ul>
</li>
</ul>
</li>
<li>Document</li>
<li>Key value</li>
<li>Graph</li>
<li>In memory</li>
</ul>
<p id="bkmrk-%C2%A0-2"> </p>
<ul id="bkmrk-factors-do-you-want-">
<li>Factors
<ul>
<li>Do you want a fixed recovery?</li>
<li>Transaction properties (Atomicity and consistency)</li>
<li>Latency</li>
<li>Transactions p/s</li>
<li>Data stored</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-relational-databases">Relational Databases</h5>
<ul id="bkmrk-this-was-the-only-op">
<li>This was the only option a while back</li>
<li>Predefined schemas</li>
<li>Strong transactional capabilities </li>
</ul>
<h5 id="bkmrk-gcp-databases">GCP Databases</h5>
<ul id="bkmrk-oltp-applications-wh">
<li>OLTP
<ul>
<li>Applications where users make lots of small transactions (updates etc)</li>
<li>Popular:
<ul>
<li>Mysql</li>
<li>Oracle </li>
<li>SQL server</li>
</ul>
</li>
<li>Recommended managed service:
<ul>
<li>CloudSQL</li>
<li>CloudSpanner
<ul>
<li>Unlimited scale and global scale</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>OLP
<ul>
<li>Running analytics
<ul>
<li>Datawarehouse</li>
</ul>
</li>
<li>BigQuery</li>
</ul>
</li>
</ul>
<p id="bkmrk-difference-between-o">Difference between OLTP and OLAP</p>
<ul id="bkmrk-oltp-databases-use-r">
<li>OLTP
<ul>
<li>Databases use rows</li>
<li>Each table row is stored together</li>
<li>Efficient for small transactions</li>
</ul>
</li>
<li>OLAP
<ul>
<li>Each table column in stored together</li>
<li>High Compression</li>
<li>Distribute data easily</li>
<li>Execute query across multiple nodes</li>
<li> </li>
</ul>
</li>
</ul>
<h5 id="bkmrk-nosql">NoSql</h5>
<ul id="bkmrk-new-approach-nosql-%3D">
<li>New approach</li>
<li>NoSQL = Not only SQL</li>
<li>Flexible schema
<ul>
<li>Lets the schema evolve with the data</li>
</ul>
</li>
<li>Horozontal schale to petabytes </li>
<li>Typical nosql has scability and high performance</li>
<li>Products
<ul>
<li>Cloud Firestore
<ul>
<li>Serverless</li>
<li>Document storage storage</li>
<li>ACID</li>
<li>Firestore has SDK's</li>
<li>Small to medium</li>
</ul>
</li>
<li>CloudBigtable
<ul>
<li>Scalable</li>
<li>Managed</li>
<li>recommended for data greater than 10tb to petabytes
<ul>
<li>Not reccomended for transactional </li>
<li>No support for multi-row transactions</li>
</ul>
</li>
<li>Reccomened for:
<ul>
<li>Large streams of data</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-in-memory-databases">In memory databases</h5>
<ul id="bkmrk-in-memory-stored-dat">
<li>In memory stored database</li>
<li>Retreival is faster</li>
<li>Service:
<ul>
<li>Memory Store</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-summary">Summary</h5>
<table id="bkmrk-database-type-gcp-se" style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
<tr>
<td style="width: 33.3333%;">Database type</td>
<td style="width: 33.3333%;">GCP Services</td>
<td style="width: 33.3333%;">Description</td>
</tr>
<tr>
<td style="width: 33.3333%;">Relational OLTP Databases</td>
<td style="width: 33.3333%;">Cloud SQL, Cloud Spanner</td>
<td style="width: 33.3333%;">
<p>Reansactional use cases needing pre-defined schema and a very strong transactinal capabilities.</p>
<p>CloudSQL : Mysql, postgres sql</p>
<p>CloudSpanner: Unlimited scale and 99.999% availability </p>
</td>
</tr>
<tr>
<td style="width: 33.3333%;">Relational OLAP Databases</td>
<td style="width: 33.3333%;">BigQuery</td>
<td style="width: 33.3333%;">Column storage with pre-defined schema. Datawarehouse and big data</td>
</tr>
<tr>
<td style="width: 33.3333%;">NoSQL</td>
<td style="width: 33.3333%;">Cloud firestore, Cloud Bigtable</td>
<td style="width: 33.3333%;">
<p>Apps needing quick evolving structure (Schema-less)</p>
<p>Cloud firestore: Serverless transactional document DB, 0.5tb</p>
<p>BigTable: Large database (10tb+) straming IOT and analytical workloads. Not serverless</p>
</td>
</tr>
<tr>
<td style="width: 33.3333%;">In memory databases/ cache</td>
<td style="width: 33.3333%;">Cloud Memory store</td>
<td style="width: 33.3333%;">Applications needing microsecond response</td>
</tr>
</tbody>
</table>
<p id="bkmrk-%C2%A0-3"> </p>
<h4 id="bkmrk-cloudsql">CloudSQL</h4>
<ul id="bkmrk-fully-managed-databa">
<li>fully managed Database</li>
<li>Supports MySQL, PostgreSQL and SQL Server</li>
<li>Regional Service</li>
<li>SSD or HDD</li>
<li>up to 416 RAM and 30TB</li>
<li>Use cloud SQL for Simple relational Cases
<ul>
<li>Migrate Local MySQL</li>
<li>Reduce maintenance costs</li>
<li>Use cloud Spanner instead of CloudSQL IF:
<ul>
<li>Huge amounts of data</li>
<li>Need infinite scaling</li>
<li>Global distribution</li>
<li>Higher availability </li>
<li> </li>
</ul>
</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-%C2%A0-4">To connect:</h5>
<pre id="bkmrk-gcloud-sql-connect-%3C"><code class="language-bash">gcloud sql connect &lt;instance name&gt; --user=root --quiet</code></pre>
<h5 id="bkmrk-features">Features</h5>
<ul id="bkmrk-automatic-encryption">
<li>Automatic encryption (Tables and backup)</li>
<li>Highavaliblity and failover
<ul>
<li>Create a standby with automatic failover
<ul>
<li>Pre-req: Automated backups and binary logging</li>
</ul>
</li>
</ul>
</li>
<li>Read replicas 
<ul>
<li>Cross zone, cross region</li>
</ul>
</li>
<li>Automatic storage increase</li>
<li>Point in time recovery
<ul>
<li>Pre-req: Enable binary loggong</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-best-practices">Best practices</h5>
<ul id="bkmrk-cloud-sql-proxy-secu">
<li>Cloud SQL PROXY
<ul>
<li>securly connect to the cloud SQL from your apps</li>
</ul>
</li>
<li>Understand Scalability
<ul>
<li>Enable HA configuration for HA</li>
</ul>
</li>
<li>Read replicas help you offload read workloads
<ul>
<li>Does not increase avalability</li>
</ul>
</li>
<li>Have a number of cloudSQL instances opposed to one large one</li>
<li>Cant distribute the writes</li>
<li>Backup
<ul>
<li>Backups are lightweight and provide point in time recovery</li>
<li>Cannot copy or do operations on the backups</li>
<li>Cannot backup a single database or table
<ul>
<li>have to backup the entire database</li>
</ul>
</li>
</ul>
</li>
<li>Export
<ul>
<li>Takes longer but more flexability</li>
<li>Export single database or table</li>
<li>Exporting large database impacts the performance</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-cloud-spaner">Cloud Spaner</h4>
<ul id="bkmrk-fully-managed%2C-missi">
<li>Fully managed, Mission Critica relational sql and globally distributed</li>
<li>Strong transactinal</li>
<li>Scales to PB</li>
<li>Scales horozontially </li>
<li>pay per node and per storage</li>
<li>Data export: Cloud console
<ul>
<li>Data flow</li>
<li>No glcoud</li>
</ul>
</li>
</ul>
<h3 id="bkmrk-no-sql">No SQL</h3>
<p id="bkmrk-%C2%A0-5"> </p>
<h4 id="bkmrk-cloud-datastore-and-">Cloud Datastore and Firestore</h4>
<ul id="bkmrk-datastore-highly-sca">
<li>Datastore
<ul>
<li>Highly scalable NoSQL Document Database</li>
<li>Recommended for up to a few TB</li>
<li>Structure: Kind &gt; Entity</li>
<li>flexible schema with transactions</li>
<li>Export only from gcloud
<ul>
<li>Export contains metadata file</li>
</ul>
</li>
<li>Being replaced with Firestore</li>
</ul>
</li>
<li>Firestore
<ul>
<li>Offline mode and data synch</li>
<li>Provides libraries</li>
<li>Offers datastore in native moce</li>
</ul>
</li>
<li>Both Serverless</li>
</ul>
<h5 id="bkmrk-storing-data-in-fire">Storing data in Firestore</h5>
<ul id="bkmrk-collection-one-or-mo">
<li>Collection
<ul>
<li>One or more document </li>
<li>Sort of like a table</li>
</ul>
</li>
<li>Document
<ul>
<li>Has an ID</li>
<li>Has fields and values</li>
<li>
<p><a href="/assets/2021-05/s3e11nJc8jbmRYtA-image-1621087752258.png" target="_blank" rel="noopener"><img src="/assets/s3e11nJc8jbmRYtA-image-1621087752258.png" alt="image-1621087752258.png"></a></p>
</li>
</ul>
</li>
<li>Indexes
<ul>
<li>Automatically created </li>
<li>Provides a simple ability to search</li>
<li>Ability to pick where you query </li>
<li>Cloud firestore automatically indexes fields you add</li>
</ul>
</li>
<li>Exporting
<ul>
<li>Entire database </li>
<li>Collections</li>
<li>Location:
<ul>
<li>GCS</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-cloud-datastore">Cloud Datastore</h4>
<ul id="bkmrk-datastore-is-a-docum">
<li>Datastore is a document store with flexible schema
<ul>
<li>Recommended for storing things like user profiles</li>
<li>Use case: Index for objects stored in cloud storage
<ul>
<li>You want to allow users to upload profile pictures</li>
<li>Enable quick searching by storing metadata</li>
</ul>
</li>
</ul>
</li>
<li>Design your keys and indexes carefully
<ul>
<li>Avoid monotonically increasing values as keys
<ul>
<li>Numbers, customer1... or timestamps</li>
</ul>
</li>
<li>Create only indexes that will be created in searches
<ul>
<li>For adhoc, you'll want to use bigquery</li>
</ul>
</li>
</ul>
</li>
<li>Prefer batch operations</li>
</ul>
<h4 id="bkmrk-cloud-bigtable">Cloud BigTable</h4>
<ul id="bkmrk-petabyte-scale%2C-wide">
<li>Petabyte scale, wide column
<ul>
<li>NoSQL (HBase API Compatible)</li>
<li>Designed for huge volumes of Analytical and Operational data</li>
<li>Handles millions of reads and writes</li>
<li>Single row transactions </li>
</ul>
</li>
<li>NOT Serverless</li>
<li>Cannot export using console or gcloud
<ul>
<li>Either use the .jar or</li>
<li>HBase</li>
</ul>
</li>
<li>Command line
<ul>
<li>cbt</li>
</ul>
</li>
</ul>
<p id="bkmrk-%C2%A0-6"> </p>
<p id="bkmrk-wide-column">Wide Column</p>
<p id="bkmrk-"><a href="/assets/7yHzJ5Hrs19Z0A5k-image-1621088484420.png" target="_blank" rel="noopener"><img src="/assets/7yHzJ5Hrs19Z0A5k-image-1621088484420.png" alt="image-1621088484420.png"></a></p>
<ul id="bkmrk-each-table-is-a-sort">
<li>Each table is a sorted key/ value map
<ul>
<li>Each row is indexed using a row key</li>
</ul>
</li>
<li>Structure supports high read and write low throughtput latency</li>
<li>Use cases:
<ul>
<li>IOT Streams, graph data, real time analytics</li>
<li>Transactional stock</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-designing-bigtable-t">Designing BigTable tables</h5>
<ul id="bkmrk-what-data-do-you-wan">
<li>What data do you want to store</li>
<li>What would your frequent used queries look like?</li>
<li>Design your key/value store
<ul>
<li>Each table only has one index</li>
<li>You can store multiple key segments, separated by a deliminator </li>
</ul>
</li>
<li>If you frequently search recent data
<ul>
<li>Start backwards so most recent data is first</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-best-practices-0">Best practices</h5>
<ul id="bkmrk-recommended-for-stre">
<li>Recommended for streaming IOT and Time Series</li>
<li>Automatically shards data in to multiple tablets</li>
<li>Tablets are distributed accross different nodes
<ul>
<li>Goals:
<ul>
<li>Same amount of data on each node</li>
<li>Distribute reads and writes equally  </li>
</ul>
</li>
</ul>
</li>
<li>Pre-test with heavy load
<ul>
<li>This is for allowing the nodes to balance them selves</li>
</ul>
</li>
<li>Supports HDD and SSD
<ul>
<li>SSD for latency sesative</li>
</ul>
</li>
<li>Increase reliability and durability
<ul>
<li>Create multiple replicated clusters </li>
<li>Can create a cloud bigtable cluster with many clusters accross regions
<ul>
<li>As well as cross zone</li>
</ul>
</li>
<li>Stored data indiepndantly </li>
<li>Store the data closer to the users</li>
<li>Configure an app policy with routing</li>
</ul>
</li>
</ul>
<h3 id="bkmrk-networking">Networking</h3>
<h4 id="bkmrk-vpc">VPC</h4>
<ul id="bkmrk-vpc-can-contain-many">
<li>VPC
<ul>
<li>Can contain many subnets</li>
<li>Regional</li>
</ul>
</li>
<li>Subnets
<ul>
<li>To close off things from public you use a subnet</li>
<li>You have 2 subnets
<ul>
<li>Private
<ul>
<li>Nothing here can be access from the internet</li>
</ul>
</li>
<li>Public</li>
</ul>
</li>
</ul>
</li>
<li>Creating a VPC
<ul>
<li>Option 1: Auto Mode
<ul>
<li>Subnets are created in each region</li>
<li>Default VPC created automatically</li>
</ul>
</li>
<li>Option 2: Custom mode VPC
<ul>
<li>No subnets are created</li>
<li>You have complete control over subnets and their IP ranges</li>
<li>Prod recommendation</li>
</ul>
</li>
</ul>
</li>
<li>Options when creating a subnet
<ul>
<li>Enables private IP access for communication with google network</li>
<li>Enable Flow logs to see inbound and outbound network traffic</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-creating-the-vpc">Creating the VPC</h4>
<ul id="bkmrk-creating-the-vpc-req">
<li>Creating the VPC
<ul>
<li>Required values
<ul>
<li>Name</li>
<li>Region</li>
<li>subnet</li>
</ul>
</li>
<li>Private google access
<ul>
<li>Should vm's in the subnet be able to access google resources with no public IP</li>
</ul>
</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-shared-vpc">Shared VPC</h5>
<ul id="bkmrk-shared-vpc-allowing-">
<li>Shared VPC
<ul>
<li>Allowing shared VPC's to connect to multiple service projects</li>
<li>Host project: Contains shared VPC Network</li>
<li>Service projects: Attaches to host projects</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-vpc-peering">VPC Peering</h5>
<ul id="bkmrk-vpc-peering-you-can-">
<li>VPC Peering
<ul>
<li>You can peer multipe VPC's together</li>
<li>All communication happens inside Google's network</li>
<li>Network Administration isn't changed</li>
</ul>
</li>
<li> </li>
</ul>
<h4 id="bkmrk-firewall-rules">Firewall rules</h4>
<ul id="bkmrk-firewall-rules-allow">
<li>Firewall rules
<ul>
<li>Allow access in and out</li>
<li>Stateful rules</li>
<li>If in is allowed then out is allowed</li>
<li>Each firewall rule has a priority
<ul>
<li>0: Highest</li>
<li>65535: Lowest</li>
</ul>
</li>
<li>
<h5>Default rule:</h5>
<ul>
<li>Egress allowed</li>
<li>Deny Ingress</li>
</ul>
</li>
</ul>
</li>
<li>Default VPC
<ul>
<li>the default VPC has 4 default rules with the priority 65534
<ul>
<li>Called fefault-allow-internal</li>
</ul>
</li>
</ul>
</li>
<li>Ingress rules:
<ul>
<li>Target: Defines the destination
<ul>
<li>Targeting it: Service account or tag</li>
</ul>
</li>
<li>Source: 
<ul>
<li>Defines where the traffic is coming from
<ul>
<li>Targeting it: Tags or Service accont</li>
</ul>
</li>
</ul>
</li>
<li>Each rule:
<ul>
<li>Priority</li>
<li>Action on match
<ul>
<li>Allow or deny</li>
</ul>
</li>
<li>Protocal</li>
<li>Enforcment status
<ul>
<li>Enable or Disable</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-best-practices-1">Best practices</h5>
<ul id="bkmrk-cloud-load-balancing">
<li>Cloud load balancing instances:
<ul>
<li><code>130.211.0.0/22</code></li>
<li><code>35.191.0.0/16</code></li>
<li>Remove 0.0.0.0/0 from source IP</li>
</ul>
</li>
</ul>
<h3 id="bkmrk-cloud-operations">Cloud Operations</h3>
<h4 id="bkmrk-operations">Operations</h4>
<ul id="bkmrk-cloud-operations-to-">
<li>Cloud Operations
<ul>
<li>To operate cloud effectivly yous hould know
<ul>
<li>Is my application healthy</li>
<li>Does my DB have enough space</li>
<li>Are my servers healthy</li>
</ul>
</li>
</ul>
</li>
<li>Cloud monitoring
<ul>
<li>Measurments </li>
<li>Graphing</li>
<li>Alerts
<ul>
<li>Channel
<ul>
<li>Condition</li>
<li>Notifications</li>
<li>Documentation</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>Workspace
<ul>
<li>In order for it to work you need a 'Workspace'</li>
<li>It can monitor AWS and GCP</li>
<li>Creation:
<ul>
<li>Create a workspace in a host project</li>
<li>Add AWS or GCP account</li>
</ul>
</li>
</ul>
</li>
<li>Default metrics
<ul>
<li>CPU</li>
<li>Dist traffic</li>
<li>Uptime</li>
<li>Network traffic</li>
</ul>
</li>
<li>For more details:
<ul>
<li>Add cloud monitoring agent
<ul>
<li>works on collectd</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-logging">Logging</h4>
<ul id="bkmrk-real-time-log-managm">
<li>Real time log managment and alaysis tool</li>
<li>Allows for storing, searching and analyzin</li>
<li>Excabyte scale, managed service</li>
<li>Ingest logs from anywhere</li>
<li>Key features:
<ul>
<li>Log explorer</li>
<li>Logs dashboard</li>
<li>Log metrics</li>
<li>Log router
<ul>
<li>Route the logs based on a condition</li>
</ul>
</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-collection">Collection</h5>
<ul id="bkmrk-collection-most-serv">
<li>Collection
<ul>
<li>Most services already spit logs to GCP logging aggregation service</li>
</ul>
</li>
<li>Ingest from GCE
<ul>
<li>Install logging agent</li>
</ul>
</li>
<li>Ingest from Onpremise
<ul>
<li>Use BindPlane</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-audit-and-security-l">Audit and security logs</h5>
<ul id="bkmrk-audit-and-securit-ac">
<li>Audit and securit
<ul>
<li>Access transprenct
<ul>
<li>Captures actions by the GCP team done on your content
<ul>
<li>Only supported for Gold+ levels</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>Cloud audit logs
<ul>
<li>answers who did what, when and where</li>
<li>Contains:
<ul>
<li>Admin activity</li>
<li>Data access</li>
<li>System event audit</li>
<li>Policy denied audit logs</li>
</ul>
</li>
</ul>
</li>
</ul>
<table id="bkmrk-feature-admin-activi" style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
<tr>
<td style="width: 20%;"><strong>Feature</strong></td>
<td style="width: 20%;"><strong>Admin Activity logs</strong></td>
<td style="width: 20%;"><strong>Data access Logs</strong></td>
<td style="width: 20%;"><strong>System event logs</strong></td>
<td style="width: 20%;"><strong>Policy denied logs</strong></td>
</tr>
<tr>
<td style="width: 20%;">Logs for</td>
<td style="width: 20%;">API calls or other actions that modify the configuration of resources</td>
<td style="width: 20%;">Reading configuration of resources</td>
<td style="width: 20%;">Google cloud administrative actions</td>
<td style="width: 20%;">When user or service accounts are denied actions</td>
</tr>
<tr>
<td style="width: 20%;">Default Enabled</td>
<td style="width: 20%;">Yes</td>
<td style="width: 20%;">No</td>
<td style="width: 20%;">Yes</td>
<td style="width: 20%;">Yes</td>
</tr>
<tr>
<td style="width: 20%;">VM Examples</td>
<td style="width: 20%;">VM creation, patching, change in IAM</td>
<td style="width: 20%;">Listing resources</td>
<td style="width: 20%;">On host maintanace</td>
<td style="width: 20%;">Security policy violation logs</td>
</tr>
<tr>
<td style="width: 20%;">Cloud storage</td>
<td style="width: 20%;">Modify bucket or object</td>
<td style="width: 20%;">Modify/ read bucket or object</td>
<td style="width: 20%;"> </td>
<td style="width: 20%;"> </td>
</tr>
<tr>
<td style="width: 20%;">Access Needed</td>
<td style="width: 20%;">Logging/ logs viewer or project/viewer</td>
<td style="width: 20%;">Logging/private logs viewer or project.owner</td>
<td style="width: 20%;">logging.logsviewer or project.viewer</td>
<td style="width: 20%;">logging.logs viewer or project.viewer</td>
</tr>
</tbody>
</table>
<p id="bkmrk-%C2%A0-7"> </p>
<h5 id="bkmrk-log-routing">Log routing</h5>
<ul id="bkmrk-log-routing-logs-fro">
<li>Log routing
<ul>
<li>Logs from various sources</li>
<li>Log router checks against configured rules</li>
</ul>
</li>
<li>Two types of log buckets
<ul>
<li>_Required, holds admin activity
<ul>
<li>Zero charge</li>
<li>Cannt change the retention period</li>
</ul>
</li>
<li>_default
<ul>
<li>All other logs</li>
<li>You are billed based on cloud logging </li>
<li>you can disable the default log</li>
</ul>
</li>
</ul>
</li>
<li>Export
<ul>
<li>You can export to a bucket</li>
<li>You can export to a bigquery dataset</li>
<li>You can export to pub/sub in base64</li>
<li>You need to create 'sinks'
<ul>
<li>This allows you to send logs out to somewhere else</li>
</ul>
</li>
</ul>
</li>
<li>Sinks and router
<ul>
<li>You cant edit the audit bucket and router sink</li>
<li>You can send logs to other locations
<ul>
<li>Big query</li>
<li>Cloud storage bucket</li>
<li>Pub/SUb</li>
<li>Splunk</li>
<li>Other project</li>
</ul>
</li>
</ul>
</li>
<li>Alerting
<ul>
<li>When something happens you need to create an alet</li>
<li>Setup alert channels</li>
<li>then setup policy</li>
<li>Setup a metric</li>
<li>Setup the steps to fix</li>
</ul>
</li>
<li>Uptime checks
<ul>
<li>You want to ensure that your applications run all the time</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-cloud-trace">Cloud Trace</h5>
<ul id="bkmrk-cloud-trace-supports">
<li>Cloud Trace
<ul>
<li>Supports google cloud services</li>
<li>Instriment applications </li>
</ul>
</li>
<li>Find out:
<ul>
<li>How long does a service take to ahndle</li>
<li>Average request latency</li>
</ul>
</li>
<li>Support for
<ul>
<li>Multiple languages</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-cloud-debugger">Cloud Debugger</h5>
<ul id="bkmrk-cloud-debugger-captu">
<li>Cloud debugger
<ul>
<li>Captures state of running applications</li>
<li>Inspect the sate of the application</li>
<li>Take snapshots of variables</li>
<li>No need to add additional logging statements</li>
<li>No need to redeploy</li>
<li>Very lightweight</li>
<li>Use in any environment (Even in prodiction)</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-cloud-profiler">Cloud Profiler</h5>
<ul id="bkmrk-cloud-profiler-low-o">
<li>Cloud Profiler
<ul>
<li>Low overhead profiler</li>
<li>gathers </li>
</ul>
</li>
<li>Major components:
<ul>
<li>Profiling agents</li>
<li>Profiler interface (Vizuliation)</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-error-reporting">Error Reporting</h5>
<ul id="bkmrk-how-do-you-identify-">
<li>How do you identify production problems</li>
<li>Real time exception montoring
<ul>
<li>Aggregate and displays errors reported from cloud services</li>
</ul>
</li>
<li>Centralize error management</li>
<li>Error reporting tool can be viewed from desktop </li>
<li>Aggregates them in to one place
<ul>
<li>Uses stack trace</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-stack-driver%2F-cloud-">Stack driver/ Cloud monitoring</h5>
<p id="bkmrk-%C2%A0-8"> </p>
<table id="bkmrk-stackdriver-service-" style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
<tr>
<td style="width: 50%;"><strong>Stackdriver Service</strong></td>
<td style="width: 50%;"><strong>New service name</strong></td>
</tr>
<tr>
<td style="width: 50%;">Stackdriver Monitoring</td>
<td style="width: 50%;">Cloud Monitoring</td>
</tr>
<tr>
<td style="width: 50%;">Stackdriver Logging</td>
<td style="width: 50%;">Cloud Monitoring</td>
</tr>
<tr>
<td style="width: 50%;">Stackdriver Error Reporting</td>
<td style="width: 50%;">Error Reporting</td>
</tr>
<tr>
<td style="width: 50%;">Stackdriver Trace</td>
<td style="width: 50%;">Cloud Trace</td>
</tr>
<tr>
<td style="width: 50%;">Stackdriver Profiler</td>
<td style="width: 50%;">Cloud profiler</td>
</tr>
</tbody>
</table>
<h5 id="bkmrk-cloud-operations-sce">Cloud Operations scenarios</h5>
<table id="bkmrk-scenario-solution-re" style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
<tr>
<td style="width: 50%;">Scenario</td>
<td style="width: 50%;">Solution</td>
</tr>
<tr>
<td style="width: 50%;">Record all operations on a bucket</td>
<td style="width: 50%;">Turn on data access audit logging</td>
</tr>
<tr>
<td style="width: 50%;">Trace requests accross multiple microservices</td>
<td style="width: 50%;">Cloud Trace</td>
</tr>
<tr>
<td style="width: 50%;">Identify prominent exceptions or errors for microservices</td>
<td style="width: 50%;">Error reporting</td>
</tr>
<tr>
<td style="width: 50%;">Debug problem in prodcution</td>
<td style="width: 50%;">Cloud Debugger</td>
</tr>
<tr>
<td style="width: 50%;">Look at logs for specific requesta</td>
<td style="width: 50%;">Cloud Logging</td>
</tr>
</tbody>
</table>
<h3 id="bkmrk-%C2%A0-9">Organizing GCP Cloud Resources</h3>
<h4 id="bkmrk-resource-hierarchy">Resource Hierarchy</h4>
<ul id="bkmrk-well-defined-hierarc">
<li>Well defined hierarchy
<ul>
<li>Organization &gt; Folder &gt; Project &gt; Resources</li>
</ul>
</li>
<li>Resources are created in Projects</li>
<li>A folder can contain multiple projects</li>
<li>An organization can contain multiple folders</li>
</ul>
<p id="bkmrk--0"><a href="/assets/nWVeT4OzIa1ANMPb-image-1621095512411.png" target="_blank" rel="noopener"><img src="/assets/nWVeT4OzIa1ANMPb-image-1621095512411.png" alt="image-1621095512411.png"></a></p>
<h4 id="bkmrk-recommendations-for-">Recommendations for Enterprises</h4>
<ul id="bkmrk-create-separate-proj">
<li>Create separate projects for different environments
<ul>
<li>Complete isolation</li>
</ul>
</li>
<li>Separate folder for each environment
<ul>
<li>Isolate environments from one department</li>
<li>Create a shared folder for shared resources</li>
</ul>
</li>
<li>One project per application per environment
<ul>
<li>App1 and app2</li>
<li>dev and prod</li>
<li>Projects:
<ul>
<li>A1-DEV</li>
<li>A1-PROD</li>
<li>A2-DEV</li>
<li>A2-PROD</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-billing-accounts">Billing accounts</h4>
<ul id="bkmrk-billing-account-is-m">
<li>Billing account is mandatory</li>
<li>Every project has one billing account</li>
<li>You can have multiple billing accounts in one organization</li>
<li>Create billing accounts representing your organization </li>
<li>two types of accounts
<ul>
<li>Self serve: Billed directly</li>
<li>Invoiced: Invoice is created and sent to accounts </li>
</ul>
</li>
</ul>
<h4 id="bkmrk-managing-billing">Managing billing</h4>
<h5 id="bkmrk-budget">Budget</h5>
<ul id="bkmrk-should-set-up-an-ale">
<li>Should set up an alert</li>
<li>Default threshold is at 50, 90 and 100%</li>
<li>Can send ti:
<ul>
<li>Email</li>
<li>Pub/sub</li>
</ul>
</li>
<li>Billing data can be exported to:
<ul>
<li>Big query</li>
<li>File export (Now depricated) </li>
</ul>
</li>
</ul>
<h4 id="bkmrk-organization-policy-">Organization Policy Service</h4>
<ul id="bkmrk-centralized-constrai">
<li>Centralized constraints on all resources
<ul>
<li>Configure an organization policy</li>
<li>Needs organization policy role</li>
</ul>
</li>
<li>IAM focues on WHO</li>
<li>Organizatin policy focuses on WHAT</li>
</ul>
<p id="bkmrk-%C2%A0-10"> </p>
<h3 id="bkmrk-linux-stuff">Linux stuff</h3>
<h4 id="bkmrk-ssh-to-vm">SSH to VM</h4>
<ul id="bkmrk-compute-engine-uses-">
<li>Compute engine uses Key based auth</li>
<li>two options:
<ul>
<li>Metadata managed:
<ul>
<li>Manually create and configure individual ssh keys</li>
<li>OS Login: Manage ssh without managing individual ssh keys
<ul>
<li>Your Linux account is automatically linked to your cloud identity</li>
<li>Go to metadata and set:
<ul>
<li>enable-oslogin to true</li>
</ul>
</li>
<li>Users need to have roles:<br>
<ul>
<li>Roled/compute.osLogin</li>
<li>roles/compute.osAdminLogin</li>
</ul>
</li>
<li>Windows: Password</li>
<li>Linux: Keybased</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-execute-a-shutdown-s">Execute a shutdown script</h4>
<ul id="bkmrk-can-be-used-on-pre-e">
<li>Can be used on pre-emptible and non-preemptible VM's</li>
<li>Runs as:
<ul>
<li>Root on linux</li>
<li>System on windows</li>
</ul>
</li>
<li>Stored as metadata
<ul>
<li>key: shutdown-script</li>
<li>value: Script</li>
<li>--metadata-from-file shutdown-script=script.sh from cli</li>
<li>Can store the scripts in cloud storage</li>
</ul>
</li>
<li>Run on best effort:
<ul>
<li>Not if you do a reset</li>
<li>Wont run if exceeding grace period</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-troubleshoot-vm-star">Troubleshoot VM startup</h4>
<ul id="bkmrk-are-there-quota-erro">
<li>Are there quota errors?</li>
<li>Boot disk full?</li>
<li>Serial port 
<ul>
<li>Each vm has 4 serial ports</li>
<li>Serial port output: OS, Bios, Other system level entites</li>
<li>can access it from cloud console, compute engine api and gcloud cli</li>
<li>Can send this to cloud logging</li>
<li>metadata:
<ul>
<li>serial-port-logging-enabled = true</li>
</ul>
</li>
<li>command
<ul>
<li>gcloud compute instances get-serial-port-output</li>
</ul>
</li>
</ul>
</li>
<li>Valid file system
<ul>
<li>attach that disk to another vm and see if you can access files</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-moving-instances-bet">Moving instances between zones and regions</h4>
<ul id="bkmrk-can-be-moved-between">
<li>Can be moved between zones in the same region
<ul>
<li>gcloud compute instances move &lt;name&gt; --zone &lt;zone active&gt; --destination-zone &lt;destination&gt;</li>
<li>Cant move a MIG</li>
<li>Cant do with local SSD</li>
<li>Not terminated instances</li>
<li>Not across regions</li>
</ul>
</li>
<li>Manual approach
<ul>
<li>Snapshot PD's</li>
<li>create copy of PD's in new region</li>
<li> Pub/Sub</li>
</ul>
</li>
</ul>
<ul id="bkmrk-%C2%A0-11">
<li> </li>
</ul>
<h3 id="bkmrk-pub%2Fsub">Pub/Sub</h3>
<h4 id="bkmrk-synchronous-communic">Synchronous communication</h4>
<ul id="bkmrk-example%3A-application">
<li>Example:
<ul>
<li>Application on your web server make synchronous calls to the logging service</li>
<li>What if the logging service goes down?</li>
</ul>
</li>
<li>Solution:
<ul>
<li>Create a topic and put the logs on it</li>
<li>logging service picks them up when it's ready</li>
<li>Advantages:
<ul>
<li>Decouple apps </li>
<li>Availability: Publisher remains up</li>
<li>Scalability </li>
<li>Durability: Message isn't lost if the service is down</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-pub%2Fsub-0">Pub/Sub</h4>
<ul id="bkmrk-reliable-scalable-fu">
<li>Reliable scalable fully managed</li>
<li>Backbone for HA and scalable solutions
<ul>
<li>Autoscales</li>
<li>Low cost</li>
</ul>
</li>
<li>Use cases:
<ul>
<li>Event ingestion and delivery streaming</li>
</ul>
</li>
<li>Support push and pull message delivery </li>
</ul>
<h5 id="bkmrk-how-it-works">How it works</h5>
<ul id="bkmrk-publisher---sender-o">
<li>Publisher - Sender of a message
<ul>
<li style="list-style-type: none;">
<ul>
<li>Publisher sends a message by making a https request to pubsub.googlepais.com</li>
</ul>
</li>
</ul>
</li>
<li>Subscriber - Reciever of the message
<ul>
<li>Pull 
<ul>
<li>Subscriber makes the https call</li>
</ul>
</li>
<li>Push
<ul>
<li>Messages are sent to subscribers
<ul>
<li>Subscribers provide a web hook endpoint at the time of regestration</li>
<li>When a message is recieved on the topic, a https post message is sent to the webhooks endpoint</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>very flexible:
<ul>
<li>Publishers and subscribers, one to many, many to one, many to many</li>
</ul>
</li>
</ul>
<p id="bkmrk-%C2%A0-12"> </p>
<h4 id="bkmrk-getting-ready-with-t">Getting ready with topic and subscriptions</h4>
<ol id="bkmrk-topic-is-created-sub">
<li>Topic is created</li>
<li>Subscribers are created
<ol>
<li>Subscribers regisert to the topic</li>
<li>Each subscriber represents a discrete pull of messages
<ol>
<li>Multiple clients pull the same subscriptions </li>
<li>Multiple clients create a subscription</li>
</ol>
</li>
</ol>
</li>
</ol>
<h5 id="bkmrk-sending">Sending</h5>
<ul id="bkmrk-publisher-sends-a-me">
<li>Publisher sends a message</li>
<li>Message individually delivered to each and every subscription</li>
<li>Subscribers receive messages
<ul>
<li>Push</li>
<li>Pull</li>
</ul>
</li>
<li>Subscriber acknowledges </li>
<li>Messages are removed from subscriptions</li>
<li>Snapshot:
<ul>
<li>Point in time snapshot of that subscription</li>
<li> </li>
</ul>
</li>
</ul>
<h4 id="bkmrk-best-practices-2">Best practices</h4>
<ul id="bkmrk-use-cases%3A-convert-s">
<li>Use cases:
<ul>
<li>Convert synchronous messages to asynchronous 
<ul>
<li>Useful when consumers cant keep up with producer</li>
</ul>
</li>
<li>Opensources:
<ul>
<li>RabbitMQ</li>
<li>Apache Kafka</li>
</ul>
</li>
<li>Apply transformations to IOT stream</li>
<li>Processing:
<ul>
<li>In order</li>
<li>Exactly one</li>
<li>option --enable-message-ordering</li>
<li>Add dataflow in to flow to enable messade dedupe (Exactly once processing)</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-dataflow">Dataflow</h4>
<ul id="bkmrk-data-etl-kinda%3F-stre">
<li>Data ETL kinda?</li>
<li>Streaming batch usaceses
<ul>
<li>Real time fraud preventionn</li>
<li>Sensor data processing</li>
<li>Log data processing</li>
</ul>
</li>
<li>Prebuilt templates</li>
</ul>
<h3 id="bkmrk-hybrid-cloud">Hybrid Cloud</h3>
<h5 id="bkmrk-cloud-vpn">Cloud VPN</h5>
<ul id="bkmrk-cloud-vpn-traffic-fl">
<li>Cloud VPN
<ul>
<li>Traffic flows over the internet</li>
<li>Traffic encrypted using IKE (Internet key exchange)</li>
</ul>
</li>
<li>2 types:
<ul>
<li>HA VPN
<ul>
<li>SLA of 99.99</li>
<li>2 external IP's</li>
<li>BGP</li>
</ul>
</li>
<li>Classic VPN
<ul>
<li>SLA of 99.9</li>
<li>Static Routing</li>
<li>Dynamic BGP</li>
</ul>
</li>
</ul>
</li>
<li>Go for VPN if:
<ul>
<li>Low cost</li>
<li>Lower throughput</li>
<li>Network to encrypt it</li>
<li>Just started experimenting with connectivity </li>
</ul>
</li>
</ul>
<h5 id="bkmrk-ha-vpn">HA VPN</h5>
<ul id="bkmrk-ha-vpn-high-avalibli">
<li>HA VPN
<ul>
<li>High Avaliblity</li>
<li>Regional</li>
<li>Needs a cloud HA VPN Gateway</li>
<li>2 interfaces</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-classic-vpn">Classic VPN</h5>
<ul id="bkmrk-classic-vpn-no-ha-ne">
<li>Classic VPN
<ul>
<li>No HA</li>
<li>Needs a google compute engine vpn gateway</li>
</ul>
</li>
</ul>
<p id="bkmrk-vpn-gateway---region">VPN Gateway - Regional resource</p>
<p id="bkmrk-cloud-router-enables">Cloud router enables dynamic routing: Enables automatic route update</p>
<h4 id="bkmrk-cloud-interconnect%C2%A0">Cloud Interconnect </h4>
<ul id="bkmrk-cloud-interconnect-h">
<li>Cloud interconnect
<ul>
<li>High speed </li>
<li>Low latency</li>
<li>Not encrypted</li>
</ul>
</li>
<li>Dedicated interconnect
<ul>
<li>High bandwith </li>
<li>Minimum of 10gbps</li>
<li>Options are:
<ul>
<li>10gbps</li>
<li>100gbps</li>
<li>8x10gbps</li>
<li>2x100gbps</li>
</ul>
</li>
<li>Can take 2-3 weeks</li>
</ul>
</li>
<li>Partner Interconnect
<ul>
<li>ideal if you need a lower bandwith connection </li>
<li>50mbps to 10gbps</li>
<li>Data exchanged over private network
<ul>
<li>Communicate using VPC network </li>
<li>Reduces egress costs
<ul>
<li>Internet is not used</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-hybrid-connectivity">Hybrid Connectivity</h4>
<ul id="bkmrk-hybrid-connectivity-">
<li>Hybrid connectivity
<ul>
<li>Use different IP ranges</li>
<li>Backup?
<ul>
<li>Cloud interconnect, also establish a VPN</li>
</ul>
</li>
</ul>
</li>
<li>Direct peering
<ul>
<li>You peer to google</li>
<li>Not a GCP Service</li>
<li>Not reccomended
<ul>
<li>Should use a GCP Service</li>
</ul>
</li>
<li>BGP routing from the datacentre </li>
</ul>
</li>
</ul>
<h3 id="bkmrk-%C2%A0-13">Data warehouse</h3>
<h4 id="bkmrk-big-query">Big query</h4>
<ul id="bkmrk-big-query-excabyte-s">
<li>Big Query
<ul>
<li>Excabyte scale modern data warehouse</li>
<li>Relational database (SQL Schema, cinsistency)
<ul>
<li>Uses SQL like commands</li>
</ul>
</li>
<li>Organized in to Datasets</li>
<li>Traditional (Storage + compute) + Modern (Realtime + serverless)</li>
<li>when talking about data-warehousing:
<ul>
<li>Importing and exporting is important
<ul>
<li>Variety of formats:
<ul>
<li>CSV, Json, Avro, Parquet, OCR, Datastore backup</li>
</ul>
</li>
<li>Export to GCS (Long term storage)</li>
<li>Visulize (Data studio)</li>
<li>Storing long term:
<ul>
<li>Compress it
<ul>
<li>CSV/ Json</li>
<li>Avro</li>
</ul>
</li>
</ul>
</li>
<li>Automatically expire data
<ul>
<li>Configurable Table expiratoin</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>External sources
<ul>
<li>Use external sources in Bigquery:
<ul>
<li>Cloud SQL</li>
<li>BigTable</li>
<li>Google drive</li>
</ul>
</li>
</ul>
</li>
<li>Partitinoing
<ul>
<li>We are able to partition the table by date, or some value</li>
<li>When we do a query, only some segments are scanned</li>
</ul>
</li>
<li>Cluster:
<ul>
<li>Group related data
<ul>
<li>Example: By category</li>
</ul>
</li>
</ul>
</li>
<li>Overview:
<ul>
<li>Partitioning: Table is divided in to segments</li>
<li>Clustering: Grouping related data by category</li>
</ul>
</li>
<li>Payment:
<ul>
<li>Pay for storage</li>
<li>Data used in the query</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-%C2%A0-14">Importing Data in to BigQuery</h5>
<ul id="bkmrk-importing-in-to-bq-b">
<li>Importing in to BQ
<ul>
<li>Batch
<ul>
<li>Free</li>
<li>Import after processing by Cloud Dataflow and cloud Dataproc
<ul>
<li>Dataproc:
<ul>
<li>Managed Hadoop</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>Stream
<ul>
<li>Expensive</li>
<li>Pub/sub</li>
<li>Streaming Inserts</li>
</ul>
</li>
<li>BQ data transfer service
<ul>
<li>Import from External:
<ul>
<li>Saas</li>
<li>S3</li>
<li>Other Datawarehouses</li>
</ul>
</li>
</ul>
</li>
<li>Federation</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-streaming-data">Streaming Data</h5>
<ul id="bkmrk-streaming-data-not-f">
<li>Streaming Data
<ul>
<li>Not free</li>
<li>Lots of limitations
<ul>
<li>No InsertID
<ul>
<li>Can stream up to 1gb per second per project</li>
</ul>
</li>
<li>InsertID
<ul>
<li>Us and EU: 500000 per second</li>
<li>Per table: 100000</li>
<li>Maximum bytes per secon: 100</li>
</ul>
</li>
</ul>
</li>
<li>If streaming millions, use BigTable</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-%C2%A0-15">Best Practices</h5>
<ul id="bkmrk-estimate%3A-bq---dry-r">
<li>Estimate:
<ul>
<li>bq --dry-run</li>
</ul>
</li>
<li>Cost:
<ul>
<li>Expire data</li>
<li>Load data in Bulk</li>
</ul>
</li>
<li>Long term storage:
<ul>
<li>When not edited for 90 days, cost goes down</li>
</ul>
</li>
<li>Fast for complex queries</li>
<li>Not optimized for narrow range queries</li>
<li>Stream your audit logs from BigQuery to Bigquery
<ul>
<li>View in Datastudio</li>
</ul>
</li>
</ul>
<p id="bkmrk-%C2%A0-16"> </p>
<h3 id="bkmrk-caching">Caching</h3>
<h4 id="bkmrk-memroystore">MemroyStore</h4>
<ul id="bkmrk-memory-store-fully-m">
<li>Memory Store
<ul>
<li>Fully managed
<ul>
<li>Failover patching etc
<ul>
<li>HA</li>
<li>Monitoring setup using cloud monitoring</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>Supports Redis and Memcached
<ul>
<li>memcached 
<ul>
<li>Refrence data, database query caching</li>
<li>Session store</li>
</ul>
</li>
<li>Redis
<ul>
<li>Persistence</li>
</ul>
</li>
</ul>
</li>
<li>Can be accessed from:
<ul>
<li>Most of the compute services</li>
<li> </li>
</ul>
</li>
</ul>
<h4 id="bkmrk-appengine-caching%C2%A0">AppEngine Caching </h4>
<ul id="bkmrk-appengine-caching-me">
<li>Appengine caching memcached
<ul>
<li>Shared Memcached (free)</li>
<li>Dedicated:
<ul>
<li>Expensive: billed by the GB hour</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-cdn">CDN</h4>
<ul id="bkmrk-cdn-best-practices-a">
<li>CDN Best practices
<ul>
<li>Always cache static content</li>
<li>Be careful with caching dynamic conent</li>
<li>Use custom cache keys to improve cache hit ratio
<ul>
<li>Any combination of host
<ul>
<li>protocal</li>
<li>host</li>
<li>query string</li>
</ul>
</li>
</ul>
</li>
<li>Versioned URL
<ul>
<li>setting a version like ?v=1 and then new verison is v=2 so you get a cache miss</li>
</ul>
</li>
</ul>
</li>
</ul>
<h3 id="bkmrk-devops">Devops</h3>
<h4 id="bkmrk-cicd">CICD</h4>
<ul id="bkmrk-cicd-static-code-ana">
<li>CICD
<ul>
<li>Static code analysis
<ul>
<li>Lint, Sonar</li>
<li>Source code security</li>
</ul>
</li>
<li>Runtime checks
<ul>
<li>Run vulnebility scanner</li>
</ul>
</li>
<li>Tests
<ul>
<li>Unit tests</li>
<li>Integration tests</li>
<li>System test</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-gcp-tools">GCP Tools</h4>
<ul id="bkmrk-tools-cloud-source-r">
<li>Tools
<ul>
<li>Cloud Source repositories</li>
<li>Container Registry</li>
<li>Build containers
<ul>
<li>Jenkins</li>
<li>Cloud Build</li>
<li>Spinnaker: Multi-cloud CD</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-iac">IaC</h4>
<ul id="bkmrk-iac-2-parts%3A-privisi">
<li>Iac
<ul>
<li>2 parts:
<ul>
<li>Privision the infra</li>
</ul>
</li>
<li>Config managment
<ul>
<li>Chef, Pupper, ansbile Salt</li>
</ul>
</li>
</ul>
</li>
<li>Cloud Deployment Manager
<ul>
<li>Prevents config drift</li>
<li>Avoid mistakes</li>
<li>Put the script in version control</li>
<li> </li>
</ul>
</li>
</ul>
<h4 id="bkmrk-deployment-manager">deployment Manager</h4>
<ul id="bkmrk-deployment-manager-t">
<li>Deployment manager
<ul>
<li>Template using 
<ul>
<li>Python
<ul>
<li>JinJa2 (Only for simple)</li>
</ul>
</li>
<li> </li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-sre">SRE</h4>
<ul id="bkmrk-sre-devops%2B%2B-at-goog">
<li>SRE
<ul>
<li>DevOps++ At google</li>
<li>SRE team focus on every aspect of an application
<ul>
<li>Managed by SLO (Service level objectives)
<ul>
<li>Convert business requirments in to measurable items</li>
<li>Minimize Faffage</li>
<li>Move fast by reducing cost</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>Best practices:
<ul>
<li>Handeling excess loads
<ul>
<li>Load Shedding
<ul>
<li>Reduce it at source</li>
<li>API LImits</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
<h3 id="bkmrk-release-management">Release Management</h3>
<ul id="bkmrk-release-managment%3A-g">
<li>Release managment:
<ul>
<li>Goals
<ul>
<li>Zero downtime</li>
<li>Only one version live at a time</li>
<li>Test with production traffic</li>
</ul>
</li>
</ul>
</li>
<li>Best practices:
<ul>
<li>Small frequent changes</li>
<li>Automate release managemnt</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-recreate">Recreate</h4>
<ul id="bkmrk-recreate-install-the">
<li>Recreate
<ul>
<li>Install the new version on the new instances</li>
<li>Most basic approach</li>
<li>Terminate V1 and roll out V2</li>
</ul>
</li>
<li>Advantage:
<ul>
<li>Cost effective and fast</li>
<li>Less compatibility issues</li>
</ul>
</li>
<li>Disadvantage:
<ul>
<li>Rollback is a redeploy</li>
<li>More downtime</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-canary-deployment">Canary Deployment</h4>
<ul id="bkmrk-canary-roll-out-to-a">
<li>Canary
<ul>
<li>Roll out to a subset of instances</li>
<li>Once metrics are okay</li>
<li>Roll out to more</li>
</ul>
</li>
<li>Characheristics
<ul>
<li>Fast</li>
<li>Zero downtime</li>
<li>No extra infra</li>
<li>Needs backwards compatibility</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-a%2Fb-testing">A/B Testing</h5>
<ul id="bkmrk-a%2Fb-set-up-a-small-n">
<li>A/B
<ul>
<li>Set up a small new feature and test with half the users</li>
<li>See if users like somethng</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-rolling-approach">Rolling Approach</h4>
<ul id="bkmrk-rolling%3A-roll-out-th">
<li>Rolling:
<ul>
<li>Roll out the version of the software to 5% at a time (For example)</li>
</ul>
</li>
<li>Charachterists:
<ul>
<li>Slow</li>
<li>Zero Downtime</li>
<li>Needs automation</li>
<li>No needed infrastrucute</li>
<li>Less impact in a failure</li>
</ul>
</li>
<li>Rolling with additional batch
<ul>
<li>zero reduction in the instances that are running the old version</li>
<li>you add in another instance whilst it runs</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-blue-green-deploymen">Blue Green Deployment</h4>
<ul id="bkmrk-blue-green-create-a-">
<li>Blue green
<ul>
<li>Create a parralel enviroment with the new version</li>
<li>Once all tests are done on V1, we switch to the new version</li>
<li>As far as the end users are concerned, only one release is live</li>
</ul>
</li>
<li>Characteristics
<ul>
<li>Zero downtime</li>
<li>Easy rollback</li>
<li>Needs additional Infra</li>
<li>Zero reduction in ability to serve</li>
<li>Backwards capacity</li>
</ul>
</li>
<li>Shadow testing:
<ul>
<li>Mirror the traffic to both the versions</li>
<li>Stubbing needs to be desigend as it may double process a payment (EG)</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-gke">GKE</h4>
<table id="bkmrk-option-detials-recre" style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
<tr>
<td style="width: 50%;">Option</td>
<td style="width: 50%;">Detials</td>
</tr>
<tr>
<td style="width: 50%;">Recreate</td>
<td style="width: 50%;">
<p>Set stratergy &gt; type on deployment to Recreate</p>
<p>Use kubectl set image deploymenr or update deployment yaml yo perform deployment</p>
</td>
</tr>
<tr>
<td style="width: 50%;">Rolling Update</td>
<td style="width: 50%;">
<p>Set Stratergy &gt; Type on deploymenr to rolling update</p>
<p>Sue kubectl set image deployment or udpate deploymenr yaml to deployment</p>
</td>
</tr>
<tr>
<td style="width: 50%;">Blue green deployment</td>
<td style="width: 50%;">
<p>Create new deploymenr</p>
<p>Control traffic using Ingress (or service)</p>
</td>
</tr>
<tr>
<td style="width: 50%;">Canary deployment</td>
<td style="width: 50%;">istio mesh</td>
</tr>
</tbody>
</table>
<h3 id="bkmrk-compliance-and-regul">Compliance and regulations</h3>
<h4 id="bkmrk-certifications">Certifications</h4>
<ul id="bkmrk-gcp-is-compliant-wit">
<li>GCP is compliant with several important certificatoins
<ul>
<li>ISO
<ul>
<li>27001 (security that helps manage informatino risks</li>
<li>27017 (Info and security controls that provision cloud services)</li>
<li>27701 Global privacy standard</li>
</ul>
</li>
<li>PCI DSS Payment card industry data security standards</li>
<li>SOC 1 - Book keeping</li>
<li>SOC 2 - Security of provider controls </li>
<li>COPPA : Childrens online privacy act</li>
<li>HIPAA : Health insurance for handeling health data
<ul>
<li>PHI : Patient health Informatin</li>
</ul>
</li>
<li>GDPR : Strengthen Data protection in europe</li>
<li>Customers are responsible for building their applications to that compliance</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-hipaa">HIPAA</h4>
<ul id="bkmrk-hipaa-gcp-is-complia">
<li>HIPAA
<ul>
<li>GCP is compliant</li>
<li>Customers are responsible</li>
<li>You can execute a Google cloud business associate agreement (BAA)</li>
<li>Do not use anything not covered by BAA</li>
</ul>
</li>
<li>Best practices:
<ul>
<li>Follow IAM</li>
<li>Enable Object versioning </li>
<li>Auditing is exported and to BQ</li>
<li>Disable caching for PHI</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-pci-dss">PCI DSS</h4>
<ul id="bkmrk-pci-dss-enhance-card">
<li>PCI DSS
<ul>
<li>Enhance card holder security security</li>
<li>Have seperate enviroment for processing cards
<ul>
<li>New <strong>account</strong>
</li>
</ul>
</li>
<li>Least privelages</li>
<li>Control inbound
<ul>
<li>HTTPS requests from customers</li>
<li>responses from third party payment processor</li>
<li>Office network - allowed for auditing</li>
</ul>
</li>
<li>Strictly control outbount
<ul>
<li>HTTPS requests to your payment processor
<ul>
<li>GKE and GCE are reccomended</li>
<li>App engine isnt allowing egress forewall rules</li>
</ul>
</li>
</ul>
</li>
<li>Harden your images</li>
<li>Only install software that is needed</li>
<li>Automate as much as you can</li>
<li>Configuration managment</li>
<li>Impliment Forseti security
<ul>
<li>Opensource tools that improve the security of GCP
<ul>
<li>Inventory </li>
<li>Scanner</li>
<li>Enforcer</li>
<li>explain</li>
</ul>
</li>
</ul>
</li>
<li>Enable VPC flow logs</li>
<li>Enable transparency logs</li>
<li>Enable firewall logs</li>
<li>use google DLP (Data loss prevention) when accessing data</li>
</ul>
</li>
</ul>
<h3 id="bkmrk-migration">Migration</h3>
<h4 id="bkmrk-planning">Planning</h4>
<ul id="bkmrk-plan-asses-the-workl">
<li>Plan
<ul>
<li>Asses the workloads
<ul>
<li>Take inventory</li>
<li>Experiment and make POC</li>
<li>Caclulate costs</li>
<li>Chose the workloads to move first</li>
</ul>
</li>
<li>Plan the foundation 
<ul>
<li>What type of network</li>
<li>How to connect</li>
<li>Security</li>
</ul>
</li>
</ul>
</li>
<li>Deploy
<ul>
<li>Move the data
<ul>
<li>gsutil</li>
<li>transfer appliance</li>
<li>Deploying:
<ul>
<li>Automation</li>
<li>Automate build and deploy</li>
<li>IaC</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>Optimize the environment
<ul>
<li>Ensure that there is logging</li>
<li>Ensure that managed services are being used</li>
<li>Optimize costs</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-approaches">Approaches</h4>
<ul id="bkmrk-appriaches%3A-lift-and">
<li>Appriaches:
<ul>
<li>Lift and Shift</li>
<li>Replatforming
<ul>
<li>Few adjustments to suit the cloud
<ul>
<li>Example: Bang it in a container</li>
</ul>
</li>
</ul>
</li>
<li>Repurchase
<ul>
<li>Move to a cloud native porduct</li>
</ul>
</li>
<li>Refactor
<ul>
<li>Serverless compute</li>
</ul>
</li>
<li>Retire
<ul>
<li>EOL</li>
</ul>
</li>
<li>Retain
<ul>
<li>Keep it on premise</li>
</ul>
</li>
</ul>
</li>
</ul>
<h3 id="bkmrk-responsibilities">Responsibilities</h3>
<h4 id="bkmrk-business-requirement">Business requirements</h4>
<ul id="bkmrk-business-requirments">
<li>Business requirments
<ul>
<li>Reduce Captial Expenditure
<ul>
<li>Just pay OpEx</li>
</ul>
</li>
<li>Licensing costs</li>
<li>Computing Costs</li>
<li>Storage costs</li>
<li>Network costs</li>
<li>Personal Costs (people)</li>
<li>Other costs
<ul>
<li>SLA miss</li>
<li>API</li>
</ul>
</li>
</ul>
</li>
<li>Reduce csots:
<ul>
<li>Managed services</li>
<li>Autoscaling</li>
<li>Preepmtible-vms</li>
</ul>
</li>
<li>Increase innovation
<ul>
<li>Devops</li>
<li>Microservices</li>
</ul>
</li>
<li>Reduce mean time to recovery</li>
<li>Improve regulation</li>
</ul>
<h4 id="bkmrk-technical-requirment">Technical Requirments</h4>
<ul id="bkmrk-technical-requirment-0">
<li>technical requirments
<ul>
<li>Functional
<ul>
<li>Use containers</li>
<li>Use hardened OS</li>
<li>Container orchestrations</li>
<li>Nosql for flexible schema</li>
<li>Store high volumes at low cost</li>
<li>Private network (Traffic not over the internet)</li>
</ul>
</li>
<li>Non-functional aspects
<ul>
<li>Avaibility</li>
<li>Scalability</li>
<li>Durability</li>
<li>Security</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-planning-for-ha">Planning for HA</h4>
<ul id="bkmrk-ha-geographical-dist">
<li>HA
<ul>
<li>Geographical distribution</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-planning-for-scalabi">Planning for Scalability</h4>
<ul id="bkmrk-scalability-vm%27s-in-">
<li>Scalability
<ul>
<li>VM's in a MIG
<ul>
<li>Autoscale</li>
<li>Many regions</li>
<li>Unmanaged
<ul>
<li>No autocaling</li>
</ul>
</li>
</ul>
</li>
<li>GKE
<ul>
<li>Pod and cluster autoscaling for GKE</li>
</ul>
</li>
<li>Be cautions with resources that cannot scale fast</li>
<li>Statefull applications are more difficult to scale</li>
</ul>
</li>
<li>PD:
<ul>
<li>Scale Vertically and Horozontally</li>
</ul>
</li>
<li>Database:
<ul>
<li>Pub/sub, BQ Cloud Datastore are serverless</li>
<li>Bigtable, spanner cloud sql, dataproc are not serverless</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-planning-for-securit">Planning for Security</h4>
<ul id="bkmrk-secuity-confidential">
<li>Secuity
<ul>
<li>Confidentiality</li>
<li>Data is encrypted at rest and transit
<ul>
<li>Ensure HTTPS in transit</li>
</ul>
</li>
<li>Integrity
<ul>
<li>Follow IAM best practice
<ul>
<li>Role based Access</li>
<li>Seperation of duties</li>
</ul>
</li>
<li>Hash verification
<ul>
<li>Increases data integrity</li>
</ul>
</li>
</ul>
</li>
<li>Avalibility
<ul>
<li>Firewall</li>
<li>Auto-failover</li>
<li>Redundancy </li>
</ul>
</li>
</ul>
</li>
<li>DDOS
<ul>
<li>Anti-spoofing is provided by GCP</li>
</ul>
</li>
<li>Google frontend
<ul>
<li>App engine sits behind google front end</li>
</ul>
</li>
<li>Firewalling
<ul>
<li>Reduce attack surface</li>
<li>Isolate internal traffic
<ul>
<li>Send as much as you can over internal traffic</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-cloud-armout">Cloud Armout</h4>
<ul id="bkmrk-cloud-armout-prevent">
<li>Cloud Armout
<ul>
<li>Prevents against denial of service</li>
<li>Prevents against:
<ul>
<li>OWASP
<ul>
<li>xss</li>
<li>sql injetctions</li>
</ul>
</li>
<li>Provices security policies</li>
</ul>
</li>
<li>Use cases:
<ul>
<li>Enable access for users with a specific IP address
<ul>
<li>Create an allow list</li>
</ul>
</li>
<li>Block users from an IP
<ul>
<li>Create a block list</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-digital-signatures">Digital Signatures</h4>
<ul id="bkmrk-digital-signatures-e">
<li>Digital signatures
<ul>
<li>Ensure the integrity of the data received</li>
<li>nonrepudiation</li>
<li>Workflow
<ul>
<li>Sender performs key operation to create data signature</li>
<li>Recipient used the public key to verify the digital signature</li>
<li>Can use CloudKMS
<ul>
<li>Provides api and commands to create digital signatures</li>
</ul>
</li>
</ul>
</li>
<li>Use cases:
<ul>
<li>Validating log files</li>
<li>Validating code builds</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-secret-manager">Secret Manager</h4>
<ul id="bkmrk-secret-manager-manag">
<li>Secret manager
<ul>
<li>Manage how your secret is encrypted</li>
<li>You can create a Key in KMS</li>
<li>You can access the key by using the API calling for the password.</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-stake-holders">Stake holders</h4>
<ul id="bkmrk-stakeholder-managmen">
<li>Stakeholder managment
<ul>
<li>Execs</li>
<li>Business owners</li>
<li>Archi team</li>
<li>Scrum master</li>
<li>Dev team</li>
<li>Testing team</li>
<li>Sec team</li>
<li>Compliance team</li>
</ul>
</li>
<li>Communiation
<ul>
<li>Early clear communication</li>
<li>Identify the stakeholders and communicate</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-change-management">Change Management</h4>
<ul id="bkmrk-change-managment-peo">
<li>change managment
<ul>
<li>People, process and technology (systems)</li>
<li>Understanding the change and what it means</li>
<li>Who can make it happen</li>
<li>Best cycle
<ul>
<li>Plan, do check, act</li>
<li>Do small changes and do multiple iterations</li>
</ul>
</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-business-continuity-">Business continuity planning</h4>
<ul id="bkmrk-bcp-how-to-keep-the-">
<li>BCP
<ul>
<li>How to keep the business running in case of a disaster</li>
<li>Focuses on IT operations alone</li>
<li>DR ENV
<ul>
<li>Cloud as a DR enviroment</li>
<li>Backup connection to the cloud</li>
</ul>
</li>
</ul>
</li>
</ul>
<p id="bkmrk-incident-management">Incident Management</p>
<ul id="bkmrk-incident-management-">
<li>Incident management
<ul>
<li>How best to avoid incidents</li>
<li>How best to react to it</li>
</ul>
</li>
<li>Post mortem:
<ul>
<li>Not who to blame, but a how to fix</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-data-managment">Data Managment</h4>
<ul id="bkmrk-data-management-how-">
<li>Data management
<ul>
<li>How the data comes in</li>
<li>Rate it comes in</li>
<li>What kind of Data?</li>
<li>How much data</li>
<li>How long is it stored for
<ul>
<li>Life cycle policies</li>
</ul>
</li>
<li> </li>
</ul>
</li>
</ul>
<p id="bkmrk-%C2%A0-17"> </p>