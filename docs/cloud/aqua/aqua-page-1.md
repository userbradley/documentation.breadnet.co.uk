---
title: Aqua - Page 1
outdated: true
---

<h4 id="bkmrk-introduction">Introduction</h4>
<p id="bkmrk-aqua-has-a-market-ar">Aqua has a market around the security of cloud deployments due to the lack of full stack control, down to restructuring  and refactoring. </p>
<table id="bkmrk-cluster-hygiene-imag" style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
<tr>
<td style="width: 25%;">Cluster Hygiene</td>
<td style="width: 25%;">Image Hygiene</td>
<td style="width: 25%;">Limit blast radius</td>
<td style="width: 25%;">Attack prevention</td>
</tr>
<tr>
<td style="width: 25%;">
<p>RBAC</p>
<p>CIS</p>
<p>MINIMAL OS</p>
</td>
<td style="width: 25%;">
<p>Vulnerability can</p>
<p>Approved base images</p>
<p>Run only on trustes images</p>
</td>
<td style="width: 25%;">
<p>Least privileges</p>
<p>Service mesh encryption and auth</p>
<p>Container Sandboxing</p>
</td>
<td style="width: 25%;">
<p>Container Immutability</p>
<p>Anomaly detection and prevention. </p>
</td>
</tr>
</tbody>
</table>
<p id="bkmrk-the-issue-from-the-c">The issue from the cloud shift is the lack of knowledge of what and where to secure.</p>
<p id="bkmrk-you-need-to-be-askin">You need to be asking how you can continuously be checking security and where things can be secured. </p>
<p id="bkmrk-different-enviroment">Different enviroments, same rules</p>
<ul id="bkmrk-risk-mitigation%2C-vul">
<li>Risk mitigation, vulnerabilities  and integrity</li>
<li>Deployment authorization, visibilty, inventory </li>
<li>Operation admin and change control</li>
<li>Secret management</li>
<li>Network segmentation of microservices</li>
<li>SOC and audit-ibility and incident response</li>
</ul>
<p id="bkmrk-how-can-aqua-help%3F">How can aqua help?</p>
<ul id="bkmrk-cloud-native-focus-o">
<li>Cloud Native focus</li>
<li>Opensource</li>
<li>Built for enterprise scale</li>
<li>Broad platform support</li>
<li>Customer Partnership</li>
</ul>
<hr id="bkmrk-">
<h4 id="bkmrk-module-2%3A-cloud-nati">Module 2: Cloud Native Security building blocks</h4>
<ul id="bkmrk-what-are-the-cloud-n">
<li>What are the cloud native building blocks</li>
<li>How to secure the build</li>
</ul>
<p id="bkmrk-%C2%A0"> </p>
<p id="bkmrk-we-want-to-be-introd">We want to be introducing the security at the build level, so building the security in to the deployment from the start.</p>
<p id="bkmrk-ensuring-that-the-un">Ensuring that the underlaying infrastructure is secure</p>
<p id="bkmrk-securing-the-workloa">Securing the workloads</p>
<h5 id="bkmrk-the-challenges%3A">The Challenges:</h5>
<ul id="bkmrk-securing-builds-know">
<li>Securing builds
<ul>
<li>Known vulnerabilities</li>
<li>Malware</li>
<li>Configuration</li>
<li>Sensitive Data</li>
<li>Non-approved software</li>
</ul>
</li>
<li>Securing infrastructure 
<ul>
<li>Security Configuration</li>
<li>Vulnerabilities</li>
<li>Missing Patches</li>
<li>Access control
<ul>
<li>RBAC</li>
<li>Leas privileges possible </li>
</ul>
</li>
</ul>
</li>
<li>Security Posture Management 
<ul>
<li>Malicious Activity
<ul>
<li>Changes to the image running things that weren't meant to be accessed</li>
<li>Strange network activity </li>
</ul>
</li>
<li>Intrusion Prevention </li>
<li>Segmentation
<ul>
<li>Containing the risk</li>
<li>Damage control
<ul>
<li>Limited exposure and the scope of the issue</li>
</ul>
</li>
</ul>
</li>
<li>Drift prevention
<ul>
<li>Make sure that run time builds are enforced and that containers are Immutable </li>
</ul>
</li>
<li>Event Auditing</li>
</ul>
</li>
<li>Securing the build
<ul>
<li>Scans all build artifacts for vulnerabilities, secrets bad config, malware and permissions</li>
<li>Prioritize issues based on application contextual risk</li>
<li>Detects hidden malware and prevents supply chain attacks</li>
<li>Flexible assurance policies to flag and block bad artifacts</li>
</ul>
</li>
<li>Application Assurance
<ul id="bkmrk-integrate-aqua-in-th">
<li>Integrate Aqua in the build process</li>
<li>Applying assurance policies to stop builds of images that do not follow best practices</li>
<li>Integrates with all CICD</li>
</ul>
</li>
<li>Vulnerability lifecycle management
<ul id="bkmrk-determine-the-action">
<li>Determine the actions</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-aqua-vshield-%28requir">Aqua vShield <br><span style="background-color: #ffff00;">(Requires additional license)</span>
</h5>
<ul id="bkmrk-aqua-vshield-is-a-vi">
<li>Aqua vShield is a virtual patching mechanism 
<ul>
<li>
<h4>Detects and prevents exploits of known vulnerabilities </h4>
</li>
<li>Does not change image code or require and dev intervention</li>
<li>Acts as a compensating control </li>
<li>Will temporarily apply a policy to that runtime, to prevent malicious code running</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-dynamic-image-inspec">Dynamic Image Inspection (Aqua DTA)</h5>
<p id="bkmrk-license-per-scan"><span style="background-color: #ffff00;">License per scan</span></p>
<ul id="bkmrk-run-containers-in-a-">
<li>Run containers in a sandbox env</li>
<li>Identify container behavior at runtime</li>
<li>Identify malicious behavior based on heuristics maintained by Aquas research team. </li>
<li>You can do image profiling</li>
<li>Image is marked as <code>Non-compliant</code>
</li>
</ul>
<p id="bkmrk-the-run-is-done-afte">The run is done after the container is built, depending on the outcome, you can set a runtime protection that prevents the container from running. </p>
<p id="bkmrk-dta-will-run-the-ima">DTA will run the image for you, and observes what the image does <span style="background-color: #ffff00;">(Runs on AQUAS infrastructure, no offline functionality, nor on client infrastructure)</span></p>
<p id="bkmrk-%C2%A0-0"> </p>
<h4 id="bkmrk-securing-the-infrast">Securing the infrastructure </h4>
<ul id="bkmrk-asses-and-audit-the-">
<li>Asses and audit the security</li>
<li>Single pane of glass view across clouds (Including orcale)</li>
<li>Get remediation advice or set automated remediation for out of policy service configurations </li>
</ul>
<h4 id="bkmrk-k8%2C-docker-and-cis-b">K8, docker and CIS benchmarks</h4>
<ul id="bkmrk-runs-cheks-aginst-al">
<li>Runs cheks aginst all 100_ cis tests</li>
<li>Provides scored report</li>
<li>Schedule to run daily</li>
<li>CIS certified</li>
<li>Answers the question:
<ul>
<li>Is my infa secure</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-kube-hunter%3A-integra">Kube-hunter: Integrated k8s penetration testing</h4>
<ul id="bkmrk-tests-clusters-again">
<li>tests clusters against real world attacks</li>
<li>Get risk assessment</li>
<li>Runs both in passive or active mode, as an external unauthorized user, or with in a pod as a authorized user</li>
</ul>
<h4 id="bkmrk-securing-the-workloa-0">Securing the workload</h4>
<ul id="bkmrk-visualize-and-priori">
<li>Visualize and prioritize risks in the environment</li>
<li>Wide array of purpose built enforcers
<ul>
<li>Provides granular visibility</li>
</ul>
</li>
<li>Drift prevention</li>
<li>
<em>'Workloads firewall'</em> micro-segment apps where they run
<ul id="bkmrk-sounds-similar-to-a-">
<li>Sounds similar to a service mesh</li>
<li>Don't plan on replacing the mesh rules, just boosting them</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-enforcing-immutabili">Enforcing Immutability</h4>
<ul id="bkmrk-ensuring-the-workloa">
<li>Ensuring the workloads don't change</li>
<li>Immutable workloads are easier to protect</li>
<li>Any change in runtime are not legitamate</li>
<li>If a change is detected, it's blocked</li>
</ul>
<h4 id="bkmrk-behavior-whitelistin">Behavior whitelisting</h4>
<ul id="bkmrk-aqua-uses-activity-p">
<li>Aqua uses activity profiling to learn workload behaviour during testing</li>
<li>Whitelist only capabilities
<ul>
<li>Files</li>
<li>syscalls</li>
<li>network connections</li>
<li>Executable</li>
</ul>
</li>
</ul>
<h4 id="bkmrk-network-firewall">Network Firewall</h4>
<ul id="bkmrk-apply-firewall-rules">
<li>Apply firewall rules for contextual application micro-segmentation</li>
<li>Rules based on Service:
<ul>
<li>DNS</li>
<li>Identities</li>
<li>URL's</li>
<li>Ip address</li>
<li>Reputation</li>
</ul>
</li>
<li>Alert on or block</li>
</ul>
<h4 id="bkmrk-risk-explorer">Risk Explorer</h4>
<ul id="bkmrk-enforcer-automatical">
<li>Enforcer automatically records </li>
</ul>
<h4 id="bkmrk-serverless-security">Serverless security</h4>
<ul id="bkmrk-seamless-attach-aqua">
<li>Seamless attach aqua nano enforcer to serverless functions</li>
<li>Provides visibility and prevention capabilities</li>
</ul>
<p id="bkmrk-performance-optimize">Performance optimized for Serverless:</p>
<ul id="bkmrk-minimal-impact-funct">
<li>Minimal impact function on start time (2ms) and memory use (2mb)</li>
<li>Language agnostic </li>
</ul>
<h4 id="bkmrk-opensource-tools">Opensource tools</h4>
<ul id="bkmrk-trivy-scanning-manag">
<li>
<a href="https://github.com/aquasecurity/trivy">Trivy</a>
<ul>
<li>Scanning</li>
<li>Manages vulnerability </li>
<li>Detects vulnerabilities in </li>
</ul>
</li>
<li>
<a href="https://cloudsploit.com/opensource">Cloudsploit</a>
<ul>
<li>Enforces cloud compliance</li>
<li>Suports aws azure gcp oracle and github</li>
<li>Ectensive plugin</li>
<li>Restful ASPI</li>
</ul>
</li>
<li>Kube-bench
<ul>
<li>Securely configure your k8 cluster</li>
<li>Auto-detects per node</li>
<li>Customisable though yaml</li>
</ul>
</li>
<li>Kube-hunter
<ul>
<li>test your k8 setup</li>
<li>Penetration testing that simulates dozens of attack vendors</li>
</ul>
</li>
<li>tracee
<ul>
<li>Runtime security</li>
<li>eBPF technology</li>
<li>Trace your system and applications at run time</li>
</ul>
</li>
</ul>
<h3 id="bkmrk-module-3">Module 3</h3>
<p id="bkmrk-%C2%A0-1"> </p>
<h4 id="bkmrk-architecture%C2%A0">Architecture </h4>
<p id="bkmrk-aqua-sec-is-made-up-">Aqua sec is made up of 3 items</p>
<ul id="bkmrk-server%2C-ui%2C-console-">
<li>Server, UI, Console</li>
<li>Database</li>
<li>Gateways</li>
</ul>
<p id="bkmrk-the-server-and-the-g">The server and the gateways live close together</p>
<p id="bkmrk-database-should-be-o">Database should be on a cloud database, customer managed</p>
<p id="bkmrk-the-database-is-the-">The database is the most important part</p>
<p id="bkmrk-this-can-deal-with-u">This can deal with up to 20k hosts on this solution</p>
<p id="bkmrk-this-can-run-on-k8%2C-">This can run on K8, docker </p>
<h5 id="bkmrk-database-and-cybrece">Database and Cybrecentre</h5>
<ul id="bkmrk-don%27t-compromise-the">
<li>Don't compromise the database</li>
<li>All the configuration is stored in the database</li>
<li>Policies, user roles are stored here</li>
<li>Needs to support postgesql (Cloud sql supports)</li>
</ul>
<h5 id="bkmrk-aqua-cybercentre%C2%A0">Aqua Cybercentre </h5>
<ul id="bkmrk-can-be-used-locally%2C">
<li>Can be used locally, but on a daily basis it's updated so needs to be pulled</li>
<li>Runs on cloud</li>
<li>Possible to run on an air-gapped infrastructure</li>
<li> </li>
<li> </li>
</ul>
<h5 id="bkmrk-gateway">Gateway</h5>
<ul id="bkmrk-all-the-aqua-enforce">
<li>All the aqua enforcers connect to the gateway </li>
<li>Handles communications between the aqua server</li>
<li>Must be a <strong>minimum </strong>of one</li>
<li>Communicates over grpc (https)</li>
<li>Handles all interactions </li>
<li> Can go through envoy proxies
<ul>
<li>Can load balance GRPC connections </li>
<li>When doing an update it terminates at envoy so no disruption </li>
<li>
<a href="https://kubernetes.io/docs/concepts/services-networking/service/#headless-services">Uses a headless service</a> </li>
</ul>
</li>
</ul>
<p id="bkmrk-tennant-manager-is-f">Tennant manager is for avoiding cross region data tranfers</p>
<p id="bkmrk-%C2%A0-2"> </p>
<h4 id="bkmrk-aqua-scanners">Aqua Scanners</h4>
<ul id="bkmrk-primary-foundation-o">
<li>Primary foundation of the aqua scanner is to scan the follwing objects:
<ul>
<li>Container images</li>
<li>Cloud Foundry</li>
</ul>
</li>
<li>2 main roles:
<ul>
<li>Object scanning is supported by the cyber centre, who maintain data on vulnerabilities</li>
<li>Secondary function include registering the container image</li>
</ul>
</li>
<li>All calls are done via API's </li>
<li>What it can scan:
<ul>
<li>Registries 
<ul>
<li>Images that hace been pushed to public and private regs</li>
</ul>
</li>
<li>Local host
<ul>
<li>Scan images that are created locally before being pushed</li>
</ul>
</li>
<li>xRunning workload images
<ul>
<li>Images used previously as well as running workloads</li>
</ul>
</li>
</ul>
</li>
</ul>
<p id="bkmrk-as-soon-as-you-deplo">As soon as you deploy the platform, there is a scanner that is deployed in the web server, but the second the scanner is installed then the internal one is disabled<br>You are also able to scan other files using the scanner, running as a binary.</p>
<p id="bkmrk-%C2%A0-3"> </p>
<h5 id="bkmrk-enforcers">Enforcers</h5>
<ul id="bkmrk-provide-run-time-sec">
<li>Provide run time security</li>
<li>Enforce runtime</li>
<li>Ensure only compliant images are schedules</li>
</ul>
<p id="bkmrk-can-be-installed-on-">Can be installed on both Linux and Windows</p>
<p id="bkmrk-micro-enforcer%3A">Micro enforcer:</p>
<ul id="bkmrk-installed-within-in-">
<li>Installed within in the Image</li>
<li>Can be embedded in the image that you want to protect</li>
<li>Only supported on Linux</li>
</ul>
<p id="bkmrk-kube-enforcer">Kube Enforcer</p>
<ul id="bkmrk-runs-as-an-admission">
<li>Runs as an admission controller and deployed as a pod on a single node in a cluster</li>
</ul>
<p id="bkmrk-examples-of-security">Examples of security:</p>
<ul id="bkmrk-block-image-found-to">
<li>Block image found to be non-compliant</li>
<li>Unrestricted images</li>
<li>OPA custom checks</li>
<li>Additional License </li>
</ul>
<h5 id="bkmrk-%C2%A0-4">Pod Enforcer</h5>
<ul id="bkmrk-enforcer-that-dynami">
<li>Enforcer that dynamically injects a sidecar in to the k8 pod</li>
<li>Enforces a few basic runtime policies like drift prevention</li>
<li>More limited functionality</li>
<li>Important:
<ul>
<li>Aqua pod enforcer is supported only on linux</li>
</ul>
</li>
</ul>
<h5 id="bkmrk-vm-enforcers">VM Enforcers</h5>
<ul id="bkmrk-provides-enforcement">
<li>Provides enforcement for hosts</li>
<li>Ensure:
<ul>
<li>Host assurance policies</li>
<li>Host runtime policies</li>
<li>Firewall policies</li>
</ul>
</li>
<li>Important notes:
<ul>
<li>Supported only on Linux</li>
<li>It's required that you deploy vm enforcer on each host</li>
<li>
<span style="background-color: #ffff00;">Vm enforcers require a separate license</span> </li>
<li> </li>
</ul>
</li>
</ul>
<h5 id="bkmrk-nano-enforcer">Nano enforcer</h5>
<ul id="bkmrk-nano-enforcer-is-a-d">
<li>Nano enforcer is a dedicated bianty for AWS Lambda functions</li>
<li>Runtimes policies provide runtime protection for AWS Lambda functions</li>
<li>Things to note:
<ul>
<li>Aqua Node-enforcer is supported on Linux platforms only</li>
</ul>
</li>
</ul>
<p id="bkmrk-%C2%A0-5"> </p>
<h4 id="bkmrk-enforcers%3A">Enforcers:</h4>
<ul id="bkmrk-there-are-groups-enf">
<li>There are groups</li>
<li>Enforcer group should only be used to group by:
<ul>
<li>Type</li>
<li>Scope 
<ul>
<li>Profile</li>
</ul>
</li>
<li>Can be used to filter traffic, what to capture data about and what to ignore</li>
</ul>
</li>
</ul>
<h2 id="bkmrk-%C2%A0-6">Module 4: Installation and Configuration</h2>
<h5 id="bkmrk-1">Checking Release notes</h5>
<ul id="bkmrk-check-the-release-no">
<li>Check the release notes</li>
<li>They are not following version releases properly</li>
<li>They support backwards 2 major releases
<ul>
<li>If you're in 5.3, and want 6.0, it wont work very well</li>
</ul>
</li>
<li>Major releases are quarterly </li>
</ul>
<h4 id="bkmrk-methods-of-deploymen">Methods of deployment</h4>
<ul id="bkmrk-helm-docker-manifest">
<li>Helm</li>
<li>Docker</li>
<li>Manifests</li>
<li>Openshift Operator</li>
<li>Aquactl</li>
</ul>
<h4 id="bkmrk-the-general-deployme">The general deployment flow</h4>
<ol id="bkmrk-create-namepsace-cre">
<li>Create namepsace</li>
<li>create registry</li>
<li>configure rbac</li>
<li>configure aqua secrets</li>
<li>create cm</li>
<li>configure htt[s</li>
<li>are you using package bd
<ol>
<li>Yes
<ol>
<li>create db</li>
<li>configure db</li>
<li>deploy main package</li>
</ol>
</li>
<li>No
<ol>
<li>Deploy with main components</li>
</ol>
</li>
</ol>
</li>
<li>Expose with envoy</li>
<li>Deploy aqua </li>
</ol>
<p id="bkmrk-always-pin-it-to-a-v">Always pin it to a version</p>
<h4 id="bkmrk-%C2%A0-7">Scanner User</h4>
<p id="bkmrk-the-scanner-needs-to">The scanner needs to be created as a user, you will need to create a user as it connects to the API</p>
<p id="bkmrk-%C2%A0-8"> </p>
<h4 id="bkmrk-%C2%A0-9">Image Assurance</h4>
<p id="bkmrk-assurance-%3D-before-r">Assurance = Before running </p>
<ul id="bkmrk-basics-of-image-assu">
<li>Basics of image assurnace</li>
<li>What image scanning is avalible</li>
<li>What are image assurance policihes</li>
<li>Use case of image assurance</li>
<li> </li>
</ul>
<p id="bkmrk-detects%2C-asses-and-r">Detects, asses and reports security in the images. Scanning can be done locally </p>
<h5 id="bkmrk-image-assurance-acti">Image assurance Activity</h5>
<ul id="bkmrk-scanning-images-eval">
<li>Scanning images</li>
<li>Evaluation of images</li>
<li>Reporting info in the UI</li>
<li>Risk Managment  </li>
</ul>
<h5 id="bkmrk-scanning">Scanning</h5>
<ul id="bkmrk-cicd-image-hosts">
<li>CICD</li>
<li>Image</li>
<li>Hosts</li>
</ul>
<p id="bkmrk-image-scanning-as-we">Image scanning as well as artifacts </p>
<h5 id="bkmrk-image-scanning-detai">Image scanning Details</h5>
<ul id="bkmrk-can-check-if-you%27ve-">
<li>Can check if you've left a container with a key in it.</li>
<li>Checks for Certificate files</li>
</ul>
<p id="bkmrk-%C2%A0-10"> </p>
<h5 id="bkmrk-image-assurance-poli">Image Assurance Policy</h5>
<ul id="bkmrk-default-policy-alway">
<li>Default policy
<ul>
<li>Always present, cant be deleted</li>
</ul>
</li>
<li>Custom policy</li>
</ul>
<h5 id="bkmrk-%C2%A0-11">Vulnerability Scoring</h5>
<p id="bkmrk-you-can-pick-a-slide">You can pick a slider or a set value for the severability on how bad you will allow to run in the container</p>
<h2 id="bkmrk-%C2%A0-12"> </h2>
<h2 id="bkmrk-module-6%3A-runtime-po">Module 6: Runtime policy </h2>
<h5 id="bkmrk-what-are-the-policie">What are the policies</h5>
<ul id="bkmrk-container-host-funct">
<li style="list-style-type: none;">
<ul>
<li>Container</li>
<li>Host</li>
<li>Function</li>
</ul>
</li>
<li>What makes up a policy</li>
</ul>
<h5 id="bkmrk-policy-components">Policy components</h5>
<ul id="bkmrk-application-scope-se">
<li>Application scope
<ul>
<li>Set of containers</li>
<li>Set of hosts</li>
<li>Set of clusters</li>
</ul>
</li>
<li>Status: Enabled or disabled</li>
<li>Enforcment mode: How it handles the container and violations</li>
<li>Controls
<ul>
<li>Security related policies</li>
</ul>
</li>
</ul>
<p id="bkmrk-%C2%A0-13"> </p>
<ul id="bkmrk-default-policy-cant-">
<li>Default Policy
<ul>
<li>Cant be deleted</li>
<li>Always present</li>
<li>If you want sometihng not to apply in a scope, you can use bypass control</li>
</ul>
</li>
<li>Custom Policy
<ul>
<li>Created by Aqua admins for specific scopes</li>
</ul>
</li>
</ul>
<p id="bkmrk-these-policies-can-b">These policies can be used to prevent containers from running</p>
<p id="bkmrk-they-are-only-applie">They are only applied when using an "Enforcer" </p>
<p id="bkmrk-%C2%A0-14"> </p>
<h5 id="bkmrk-compliance">Compliance</h5>
<ul id="bkmrk-cis-hipaa-nist-pci-d">
<li>CIS</li>
<li>HIPAA</li>
<li>NIST</li>
<li>PCI DSS</li>
</ul>
<h5 id="bkmrk-commonly-used-contai">Commonly used container contorls</h5>
<ul id="bkmrk-bypass-scope-block-v">
<li>Bypass scope</li>
<li>Block volumes</li>
<li>Drift prevention</li>
<li>Block unregistered images</li>
<li>Block non-compliant images</li>
</ul>
<p id="bkmrk-%C2%A0-15"> </p>
<p id="bkmrk-%C2%A0-16"> </p>
<p id="bkmrk-%C2%A0-17"> </p>
<p id="bkmrk-%C2%A0-18"> </p>
<p id="bkmrk-%C2%A0-19"> </p>
<p id="bkmrk-%C2%A0-20"> </p>
<p id="bkmrk-%C2%A0-21"> </p>
<p id="bkmrk-%C2%A0-22"> </p>
<p id="bkmrk-%C2%A0-23"> </p>
<p id="bkmrk-%C2%A0-24"> </p>
<p id="bkmrk-%C2%A0-25"> </p>
<p id="bkmrk-%C2%A0-26"> </p>
<p id="bkmrk-%C2%A0-27"> </p>
<p id="bkmrk-%C2%A0-28"> </p>
<p id="bkmrk-%C2%A0-29"> </p>
<p id="bkmrk-%C2%A0-30"> </p>