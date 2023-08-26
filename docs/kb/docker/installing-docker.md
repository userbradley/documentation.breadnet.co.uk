---
title: Installing docker
reviewdate: '2022-01-01'
---

<p id="bkmrk-step-1-%E2%80%94-installing-">Step 1 — Installing Docker<br>The Docker installation package available in the official Ubuntu repository may not be the latest version. To ensure we get the latest version, we’ll install Docker from the official Docker repository. To do that, we’ll add a new package source, add the GPG key from Docker to ensure the downloads are valid, and then install the package.</p>
<p id="bkmrk-first%2C-update-your-e">First, update your existing list of packages:</p>
<pre id="bkmrk-sudo-apt-update"><code class="language-">sudo apt update</code></pre>
<p id="bkmrk-next%2C-install-a-few-">Next, install a few prerequisite packages which let apt use packages over HTTPS:</p>
<pre id="bkmrk-sudo-apt-install-apt"><code class="language-">sudo apt install apt-transport-https ca-certificates curl software-properties-common</code></pre>
<p id="bkmrk-then-add-the-gpg-key">Then add the GPG key for the official Docker repository to your system:</p>
<pre id="bkmrk-curl--fssl-https%3A%2F%2Fd"><code class="language-">curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -</code></pre>
<p id="bkmrk-add-the-docker-repos">Add the Docker repository to APT sources:</p>
<pre id="bkmrk-sudo-add-apt-reposit"><code class="language-">sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"</code></pre>
<p id="bkmrk-next%2C-update-the-pac">Next, update the package database with the Docker packages from the newly added repo:</p>
<pre id="bkmrk-sudo-apt-update-0"><code class="language-">sudo apt update</code></pre>
<p id="bkmrk-make-sure-you-are-ab">Make sure you are about to install from the Docker repo instead of the default Ubuntu repo:</p>
<pre id="bkmrk-apt-cache-policy-doc"><code class="language-">apt-cache policy docker-ce</code></pre>
<p id="bkmrk-you%E2%80%99ll-see-output-li">You’ll see output like this, although the version number for Docker may be different:</p>
<pre id="bkmrk-docker-ce%3A-installed"><code class="language-YAML">docker-ce:
  Installed: (none)
  Candidate: 18.03.1~ce~3-0~ubuntu
  Version table:
     18.03.1~ce~3-0~ubuntu 500
        500 https://download.docker.com/linux/ubuntu bionic/stable amd64 Packages</code></pre>
<p id="bkmrk-notice-that-docker-c">Notice that docker-ce is not installed, but the candidate for installation is from the Docker repository for Ubuntu 18.04 (bionic).</p>
<p id="bkmrk-finally%2C-install-doc">Finally, install Docker:</p>
<pre id="bkmrk-sudo-apt-install-doc"><code class="language-shell">sudo apt install docker-ce</code></pre>
<p id="bkmrk-%C2%A0"> </p>
<p id="bkmrk-docker-should-now-be"><br>Docker should now be installed, the daemon started, and the process enabled to start on boot. Check that it’s running:</p>
<pre id="bkmrk-sudo-systemctl-statu"><code class="language-shell">sudo systemctl status docker</code></pre>