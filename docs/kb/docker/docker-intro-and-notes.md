---
title: Docker: Intro and notes
outdated: true
---

# Docker: Intro and notes

<h4 id="bkmrk-what-are-containers%3F">What are containers?</h4>
<p id="bkmrk-%C2%A0completely-isolated"> completely isolated environment. They can have their own mounts, networks and applications. <br>Docker runs off of lxc containers and provides a high level management interface. <br>Docker containers share the kernal. They can run anything on top of it (even an os) but it will have the same kernel version. </p>
<h4 id="bkmrk-%C2%A0"> </h4>
<h4 id="bkmrk-why-do-you-need-it%3F">Why do you need it?</h4>
<p id="bkmrk-allows-for-running-s">Allows for running services that require different versions of prereqs. Allows for cross os compatibility. </p>
<p id="bkmrk-alot-of-companies-an">Alot of companies and programs have got their software published to <a href="https://bookstack.breadnet.co.uk/hub.docker.com/">docker hub</a> </p>
<h4 id="bkmrk-install-docker%3A">Install docker:</h4>
<pre id="bkmrk-%24-curl--fssl-https%3A%2F"><code class="language-highlight">$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sudo sh get-docker.sh</code></pre>
<pre id="bkmrk-sudo-usermod--ag-doc"><code class="language-highlight"> sudo usermod -aG docker your-user</code></pre>
<p id="bkmrk-done%21">Done!</p>
<p id="bkmrk-you-can-check-the-do">You can check the docker verson using <br><code>sudo docker version</code></p>
<p id="bkmrk-nhow-we-can-see-if-i">Nhow we can see if it works by running:</p>
<pre id="bkmrk-docker-pull-docker%2Fw"><code class="language-">docker pull docker/whalesay</code></pre>
<p id="bkmrk-which-pulls-a-docer-">Which pulls a docer image from the previous mentioned docker hub. called Whale say.</p>
<pre id="bkmrk-sudo-docker-run-dock"><code class="language-">sudo docker run docker/whalesay cowsay hello</code></pre>
<p id="bkmrk-which-looks-like-thi">which looks like this!</p>
<pre id="bkmrk-root%40dockethost%3A%7E%2Fdo"><code class="language-SQL">root@DocketHost:~/docker/graphhopper# sudo docker run docker/whalesay cowsay hello
 _______ 
&lt; hello &gt;
 ------- 
    \
     \
      \     
                    ##        .            
              ## ## ##       ==            
           ## ## ## ##      ===            
       /""""""""""""""""___/ ===        
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~   
       \______ o          __/            
        \    \        __/             
          \____\______/   
</code></pre>
<p id="bkmrk-now-we-know-docker-i">now we know docker is working</p>
<h4 id="bkmrk-%C2%A0-0"> </h4>
<h4 id="bkmrk-run-docker-container">Run docker containers</h4>
<p id="bkmrk-running-docker-run-%3C">Running <code>docker run &lt;name&gt;</code> runs a docker container.</p>
<p id="bkmrk-if-the-image-is-not-" class="callout info">If the image is not found, it will find and pull the docker but the next time, it will use the same image you're already pulled</p>
<p id="bkmrk-%C2%A0-1"> </p>
<p id="bkmrk-docker-ps-will-show-"><code>docker ps</code> will show you info about the docker container.</p>
<p id="bkmrk-to-see-all-container">To see all containers, use -a <code>docker ps -a</code></p>
<p id="bkmrk-stopping-a-container">Stopping a container</p>
<p id="bkmrk-docker-stop-%3Cname-or"><code>docker stop &lt;name or id&gt; </code></p>
<p id="bkmrk-to-remote-a-docker%2C-">to remote a docker, <code>docker rm &lt;name or id&gt;</code></p>
<p id="bkmrk-to-view-a-list-of-im">To view a list of images we have on the server, run <code>docker images</code> </p>
<p id="bkmrk-to-remove-images%2C-us">to remove images, use <code>docker rmi -f &lt;id&gt;</code></p>
<p id="bkmrk-to-run-a-command-on-">To run a command on a docker, run<code> docker exec &lt;name&gt; command</code></p>
<p id="bkmrk-%C2%A0-2"> </p>
<p id="bkmrk-running-a-docker-ima">Running a docker image in interactive mode is achived using <code>docker run -i container</code></p>
<p id="bkmrk-and-to-interact-with">and to interact with it, use <code>docker run -ti container</code></p>
<p id="bkmrk-%C2%A0-3"> </p>
<h4 id="bkmrk-data-persistance">Data persistance</h4>
<p id="bkmrk-in-order-to-ensure-t">In order to ensure that the data persists, you need to map an external folder to the docker container</p>
<pre id="bkmrk-docker-run--v-%2Fopt%2Fd"><code class="language-">docker run -V /opt/data:/var/lib/mysql mysql</code></pre>
<h4 id="bkmrk-create-docker-image">Create docker Image</h4>
<h4 id="bkmrk-networks-in-docker">Networks in docker</h4>
<p id="bkmrk-all-containers-get-a">All containers get an internal IP address that other containers can connect to. This is all good and well for internal applications but useless for external applicaitons. In order to access the port and network of the container, we must use the  -p command which maps the port to the container</p>
<p id="bkmrk-example%3A">Example:</p>
<p id="bkmrk-docker-run--p-80%3A500"><code>docker run -p 80:5000 kodekloud/simple-webapp</code></p>
<p id="bkmrk-this-maps-external-p">This maps external port 80 to internal port 5000<br>Seurprisingly you cant map to the same port the same time.</p>
<p id="bkmrk-%C2%A0-4"> </p>
<h4 id="bkmrk-docker-compose">Docker compose</h4>
<h4 id="bkmrk-%C2%A0-5"> </h4>
<h4 id="bkmrk-docker-concepts-in-d">Docker concepts in depth</h4>
<h4 id="bkmrk-%C2%A0-6"> </h4>
<h4 id="bkmrk-docker-for-windows%2F-">Docker for windows/ mac</h4>
<h4 id="bkmrk-%C2%A0-7"> </h4>
<h4 id="bkmrk-docker-swarm">Docker swarm</h4>
<h4 id="bkmrk-docker-vs-k8">Docker vs k8</h4>