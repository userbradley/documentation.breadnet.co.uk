---
title: Aqua - Page 2
outdated: true
---

# Aqua - Page 2

<h2 id="bkmrk-module-7">Module 7</h2>
<ul id="bkmrk-services-comprises-o">
<li>Services
<ul>
<li>Comprises of the following
<ul>
<li>Enforcment mode:
<ul>
<li>How aqua handles the policy </li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>Firewall 
<ul>
<li>Logical groups if workloads</li>
<li>Defined by scope of service</li>
<li>main purpose is to apply one or more firewall policies
<ul>
<li>Policies contain rules</li>
</ul>
</li>
<li>Can add rules in 2 ways
<ul>
<li>Add firewall rules though the UI</li>
<li>View during running then lock down</li>
</ul>
</li>
</ul>
</li>
</ul>
<h2 id="bkmrk-module-8%3A-secrets">Module 8: Secrets</h2>
<ul id="bkmrk-how-to-integrate-wit">
<li>How to integrate with existing key store</li>
<li>How to inject it in to the workload</li>
</ul>
<p id="bkmrk-%C2%A0"> </p>
<ul id="bkmrk-central-management%C2%A0-">
<li>Central management </li>
<li>Automatically injects in to running container</li>
<li>Secrets are encrypted in transit</li>
</ul>
<p id="bkmrk-secrets-need-to-be-a">Secrets need to be added as an env variable, image needs tags</p>
<pre id="bkmrk-spec%3A-containers%3A---"><code class="language-">spec:
      containers:
      - env:
        - name: bradley
          value: '{aqua.bradley}'</code></pre>
<p id="bkmrk-%C2%A0-0"> </p>
<h2 id="bkmrk-module-9%3A-serverless">Module 9: Serverless</h2>
<p id="bkmrk-gcp-is-supported-whe"><span style="background-color: #ffff00;">GCP is supported when scanning before run</span></p>
<p id="bkmrk-only-aws-supports-ru">Only AWS supports runtime protection</p>
<p id="bkmrk-how-it-potects%3A">How it protects:</p>
<ul id="bkmrk-secures-serverless-f">
<li>Secures serverless functions at run time</li>
<li>Runtime assurance
<ul>
<li>Nano-enforcer allows Aqua to carry out runtime protection</li>
<li>Does not work for GCP</li>
</ul>
</li>
<li> </li>
</ul>
<h2 id="bkmrk-%C2%A0-1">Module 11: Aqua-api and aquacltl</h2>
<ul id="bkmrk-aquactl-can-be-used-">
<li>Aquactl can be used to inject nano-enforcers as well as</li>
<li>Download Manifests </li>
</ul>
<h2 id="bkmrk-module-12%3A-aqua-for-">Module 12: Aqua for dev</h2>
<ul id="bkmrk-before-building%2C-und">
<li>Before building, understand the use case</li>
</ul>
<p id="bkmrk-%C2%A0-2"> </p>
<ul id="bkmrk-evaluation%3A-make-use">
<li>Evaluation:</li>
<li>Make use of opensource tools</li>
<li>Can you use the API</li>
</ul>
<p id="bkmrk-validation">Validation</p>
<ul id="bkmrk-check-audit%2Fci-check">
<li>Check audit/ci</li>
<li>check running containers</li>
<li>Check risk explorer to get high level overviews </li>
</ul>
<h2 id="bkmrk-module-13%3A-aqua-for-">Module 13: Aqua for Admin</h2>
<h5 id="bkmrk-upgrading">Upgrading</h5>
<ul id="bkmrk-database-and-vm-enfo">
<li>Database and vm enforcers are required for the same version</li>
<li>backwards compatible :
<ul>
<li>Enforcers and vm enforcers up to 2 versions</li>
<li>Micro enforcers and kube enforcers: 1 Major version</li>
</ul>
</li>
<li> </li>
</ul>
<p id="bkmrk-%C2%A0-3"> </p>
<p id="bkmrk-%C2%A0-4"> </p>
<p id="bkmrk-%C2%A0-5"> </p>
<p id="bkmrk-%C2%A0-6"> </p>
<p id="bkmrk-%C2%A0-7"> </p>