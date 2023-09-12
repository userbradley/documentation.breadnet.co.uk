---
title: Jellyfin using S3 and Docker
reviewdate: '2022-01-01'
---

!!! warning "DO NOT USE"
    THIS IS ONLY MIGRATED TO KEEP LINKS ALIVE, AND SHOULD NEVER BE USED. IT'S INSECURE AND DOES NOT FOLLOW BEST PRACTICES.


<h4 id="bkmrk-prereqs%3A-i-am-not-a-">Prereqs:</h4>
<!--suppress ALL -->
<p id="bkmrk-i-am-not-a-security-"><br>I am not a security expert, I am a sysadmin. The security of your server is up to you. Do basic things like enable <a href="https://documentation.breadnet.co.uk/books/kb-articles/page/ssh-keys" target="_blank" rel="noopener">ssh keys</a> and lock down ingress ports with ufw or iptables. What ever angles your dangle.<br>I am not a docker expert. I am a sysadmin which means I can use google (I think? bleh) so if you see anything whack in this, feel free to email me (webmaster[at]breadnet[dot]co[dot]uk)</p>
<p id="bkmrk-%C2%A0"> </p>
<p id="bkmrk-comment%3A-3rd-may-202">Comment: 3rd may 2020: After running this for a few days it's come to my attention that for this to be viable and be able to transcode you will need a slightly more powerful host. Whilst this does feel like a kick in the nuts, its not. There are lots of technologies that still work here.</p>
<p id="bkmrk-%C2%A0-0"> </p>
<h5 id="bkmrk-you-will-need%3A">You will need:</h5>
<ol id="bkmrk-s3-compatible-bucket">
<li>S3 compatible bucket - I suggest wasabi but you can also use Min.io if you're in to FOSS (wasabi has a 30 day free 1tb trial)</li>
<li>Cloud vps somewhere with reasonable connection and sub 20ms ping to the bucket location. Not needed but is nice. Internet should be around 30mbps at min</li>
<li>Ability to read and copy and paste.</li>
</ol>
<h5 id="bkmrk-the-first-step">The first step</h5>
<p id="bkmrk-first-we-will-spin-u">First we will spin up a digital ocean droplet but you can use what ever VPS provider you want. </p>
<p id="bkmrk-once-the-vps-is-up-a">Once the VPs is up and you're logged in run the below to update the sources and crap. should not take too long.</p>
<pre id="bkmrk-sudo-apt-get-update-"><code class="language-shell">sudo apt-get update &amp;&amp; sudo apt-get upgrade</code></pre>
<p id="bkmrk-once-that%27s-done%2C-in">Once that's done, install rclone</p>
<pre id="bkmrk-sudo-apt-get-install"><code class="language-shell">sudo apt-get install rclone</code></pre>
<p id="bkmrk-now-we-need-to-confi">Now we need to configure the s3 bucket. I am using wasabi like I said to begin with, but some parts are universal to all s3 compatible storage options. </p>
<p id="bkmrk-%C2%A0-1"> </p>
<p id="bkmrk-login-to-wasabi-cons">Login to wasabi console at <a href="https://console.wasabi.com">https://console.wasabisys.com</a>  </p>
<p id="bkmrk-once-logged-in%2C-go-t">Once logged in, go to buckets and create bucket - name it what you want. call it Jeff for all I care :)</p>
<p id="bkmrk-now-that-your-bucket">Now that your bucket is created, we need to create a policy that will later be applied to a user. </p>
<p id="bkmrk-go-to-policies-on-th">Go to policies on the left hand nav bar and create new policy (top right)</p>
<p id="bkmrk-name-your-policy-som">Name your policy something like jeff-RO (where the appending characters reference the permissions, here it's Read Only)</p>
<p id="bkmrk-the-below-policy-is-">The below policy is full access to that bucket.</p>
<pre id="bkmrk-%7B-%22version%22%3A-%222012-1"><code class="language-YAML">{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "s3:GetBucketLocation",
        "s3:ListBucket",
        "s3:ListBucketMultipartUploads"
      ],
      "Resource": "arn:aws:s3:::jeff"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::jeff/*"
    }
  ]
}</code></pre>
<p id="bkmrk-below-is-full-rw-acc">Below is full rw access</p>
<pre id="bkmrk-%7B-%22version%22%3A-%222012-1-0"><code class="language-">{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListAllMyBuckets",
      "Resource": "arn:aws:s3:::*"
    },
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::jeff",
        "arn:aws:s3:::jeff/*"
      ]
    }
  ]
}</code></pre>
<p id="bkmrk-%C2%A0-2"> </p>
<p id="bkmrk-once-your-policy-is-">Once your policy is created you can now move on to creating the user.<br><br></p>
<p id="bkmrk-go-to-users-and-then">Go to users and then click 'create user' and follow though the prompts.</p>
<p id="bkmrk-click-api-access%3A">Click API access:</p>
<p id="bkmrk-"><img id="bkmrk--3" src="https://documentation.breadnet.co.uk/uploads/images/gallery/2020-04/scaled-1680-/eUOCt0FHrAKXglAR-image-1588290555247.png"></p>
<p id="bkmrk-%C2%A0-3"> </p>
<p id="bkmrk-now-follow-though-th">Now follow though the prompts till you get to the end. Don't click anything as it will then pop up with the keys. Click download. </p>
<p id="bkmrk-%C2%A0-4"> </p>
<p id="bkmrk-now-we-can-go-to-the">Now we can go to the vps we created (or pre-existed) and start with the docker setup and eventually rclone.</p>
<p id="bkmrk-install-dooker-with%3A">Install dooker with:<br><br></p>
<pre id="bkmrk-curl--fssl-https%3A%2F%2Fg"><code class="language-shell">curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo apt-get install docker-compose</code></pre>
<p id="bkmrk-once-that-is-install">Once that is installed pull the jellyfin docker image </p>
<pre id="bkmrk-docker-pull-jellyfin"><code class="language-shell">docker pull jellyfin/jellyfin</code></pre>
<p id="bkmrk-create-3-folders-in-">Create 3 folders in a jellyfin folder. I like mine to be like the below</p>
<p id="bkmrk-%28don't-worry-about-th">(don't worry about that file, that's next)</p>
<pre id="bkmrk-.-%E2%94%94%E2%94%80%E2%94%80-docker-%E2%94%94%E2%94%80%E2%94%80-jel"><code class="language-Powershell">.
└── docker
    └── jellyfin
        ├── docker-compose.yml
        └── files
            ├── cache
            ├── config
            └── media

6 directories, 1 file
</code></pre>
<p id="bkmrk-create-a-file-called">Create a file called docker-compose.yml and paste the below in to it:<br>(anything encased in &lt;&gt; should be changed to map to your folders)</p>
<pre id="bkmrk-version%3A-%223%22-service"><code class="language-YAML">version: "3"
services:
 jellyfin:
  image: jellyfin/jellyfin
  user: 1000:1000
  network_mode: "host"
  volumes:
    - &lt;/path/to/config&gt;:/config
    - &lt;/path/to/cache&gt;:/cache
    - &lt;/path/to/media&gt;:/media</code></pre>
<p id="bkmrk-now-we-need-to-sort-">Now we need to sort the rclone business out.</p>
<p id="bkmrk-for-this-i-suggest-u">For this I suggest using screen.</p>
<p id="bkmrk-it-can-be-opened-by-">It can be opened by typing screen in a shell session (over ssh to the server) </p>
<p id="bkmrk-if-it-opens%2C-close-i"><img id="bkmrk--4" src="https://documentation.breadnet.co.uk/uploads/images/gallery/2020-05/scaled-1680-/xqqlZDCLo7N0MB9f-image-1588291310783.png"><br>If it opens, close it with Ctrl + a + d (the a key followed by the d key)</p>
<p id="bkmrk-if-it-gives-you-shit">If it gives you shit about not having it installed run<br>sudo apt-get install screen -y</p>
<p id="bkmrk-now-we-need-to-setup">Now we need to setup rclone</p>
<pre id="bkmrk-cd-%7E%2F.config"><code class="language-shell">cd ~/.config</code></pre>
<pre id="bkmrk-mkdir-rclone"><code class="language-shell">mkdir rclone</code></pre>
<pre id="bkmrk-cd-rclone"><code class="language-shell">cd rclone</code></pre>
<pre id="bkmrk-nano-rclone.conf"><code class="language-shell">nano rclone.conf</code></pre>
<p id="bkmrk-%C2%A0-5"> </p>
<pre id="bkmrk-%5Bmedia%5D-type-%3D-s3-en"><code class="language-">[media]
type = s3
env_auth =
access_key_id = &lt;first key in .csv file from user creation&gt;
secret_access_key = &lt;second key from user creation&gt;
region =
endpoint = https://s3.eu-central-1.wasabisys.com #if using a europe bucket, else; See below for specifics
location_constraint =
acl =
server_side_encryption =
storage_class =

####You don't need to copy this shit in to the file, it's in reference to line 7###
#Wasabi US East 1 (N. Virginia): s3.wasabisys.com or s3.us-east-1.wasabisys.com
#Wasabi US East 2 (N. Virginia): s3.us-east-2.wasabisys.com
#Wasabi US West 1 (Oregon): s3.us-west-1.wasabisys.com
#Wasabi EU Central 1 (Amsterdam): s3.eu-central-1.wasabisys.com</code></pre>
<p id="bkmrk-test-this-by-going-t">Test this by going to the wasabi interface and uploading something to the bucket.</p>
<p id="bkmrk-then-do">then do</p>
<pre id="bkmrk-rclone-ls-media%3A%3Cbuc"><code class="language-shell">rclone ls media:&lt;bucket name, probably jeff&gt;</code></pre>
<p id="bkmrk-should-return-the-fi">Should return the file name.<br>If you have issues, contact me. You can email me at the webmaster email address and I'll be happy to help where I can.</p>
<p id="bkmrk-next-we-need-to-map-">Next we need to map the bucket to a folder.</p>
<p id="bkmrk-open-screen-by-typin">Open screen by typing <code>screen<br></code>Change directory to the media folder you created erlier and run:</p>
<pre id="bkmrk-rclone-mount-media%3A%3C"><code class="language-shell">rclone mount media:&lt;bucket name&gt; media --allow-others</code></pre>
<p id="bkmrk-it-may-throw-back-an">It may throw back an error about using --allow-others, but just do what the command says and edit the file, remove the # in from of the allow_others or what's closest in the file.</p>
<p id="bkmrk-it-should-return-not">It should return nothing if it worked. Press ctrl + a + d</p>
<p id="bkmrk-try-ls-on-the-media-">try ls on the media folder. We should see the file we uploaded from earlier. </p>
<p id="bkmrk-%C2%A0-6"> </p>
<p id="bkmrk-now-we-can-build-the">Now we can build the jellyfin docker image what's it. </p>
<p id="bkmrk-in-the-folder-where-">In the folder where the docker-compose.yml file exists, run:</p>
<pre id="bkmrk-docker-compose-up"><code class="language-shell">docker-compose up</code></pre>
<p id="bkmrk-if-all-went-well-it-">If all went well it should spin up and then you can visit the IP address for the vm you're working on with the jellyfin port number and then add the media like you would usually:</p>
<p id="bkmrk--0"><img id="bkmrk--5" src="https://documentation.breadnet.co.uk/uploads/images/gallery/2020-05/scaled-1680-/9W1mq4mymSV0sKft-image-1588292228032.png"></p>
<p id="bkmrk-%C2%A0-7"> </p>
<p id="bkmrk-i-suggest-you-create">I suggest you create the folders though wasabi webui and upload the files there if you're not 100% with rclone.</p>
<p id="bkmrk-%C2%A0-8"> </p>
<p id="bkmrk-that-should-be-it.-l">That should be it. Let it whir away and it should be all fine and dandy. </p>
<p id="bkmrk-%C2%A0-9"> </p>
<p id="bkmrk-this-is-the-vps-stat">This is the VPS status for usage and disk usage:</p>
<p id="bkmrk--1"><img id="bkmrk--6" src="https://documentation.breadnet.co.uk/uploads/images/gallery/2020-05/scaled-1680-/gSzylkkvNrHlBaLC-image-1588292772671.png"></p>
<p id="bkmrk-%C2%A0-10"> </p>
<p id="bkmrk-like-i-said%2C-if-ther">Like I said, if there's any issues or you're confused to me, reach out to me on Reddit or email!</p>
<p id="bkmrk--2"><br><br></p>
<p id="bkmrk-%C2%A0-11"> </p>
<p id="bkmrk-%C2%A0-12"> </p>
