---
title: Terraform - Building infrastructure
outdated: true
---

# Terraform - Building infrastructure

<h5 id="bkmrk-picking-your-region">Picking your region</h5>
<p id="bkmrk-first-we-need-to-set">First we need to set which cloud provider we will be using. In this example we will be using GCP</p>
<p id="bkmrk-start-with-defining-">Start with defining the cloud privodor and then the version. Usually this is not needed!</p>
<p id="bkmrk-from-google-cloud-co">From google cloud console, you will need to get the project ID. This can be found on the dashboard of the project.</p>
<p id="bkmrk-the-we-will-nee-to-d">The we will nee to define the region and zone. Today I will be using us-central1 and then the zone of c</p>
<p id="bkmrk-this-becomes-us-cent">This becomes <code>us-central1-</code>c in the format of &lt;country&gt;-&lt;area&gt;&lt;dcnumber&gt;-&lt;a,b,c...&gt;</p>
<p id="bkmrk-below-is-a-list-of-r">Below is a list of regions and zones. If you are scaling and need low latency, use the same zone as they are physically closer! <sub>(wow)</sub></p>
<h3 id="bkmrk-%C2%A0">Regions and Zones</h3>
<table id="bkmrk-region-zones-locatio">
<thead>
<tr>
<th width="40%">Region</th>
<th width="20%">Zones</th>
<th width="40%">Location</th>
</tr>
</thead>
<tbody>
<tr>
<td><code dir="ltr" translate="no">asia-east1</code></td>
<td>a, b, c</td>
<td>Changhua County, Taiwan</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">asia-east2</code></td>
<td>a, b, c</td>
<td>Hong Kong</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">asia-northeast1</code></td>
<td>a, b, c</td>
<td>Tokyo, Japan</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">asia-northeast2</code></td>
<td>a, b, c</td>
<td>Osaka, Japan</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">asia-northeast3</code></td>
<td>a, b, c</td>
<td>Seoul, South Korea</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">asia-south1</code></td>
<td>a, b, c</td>
<td>Mumbai, India</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">asia-southeast1</code></td>
<td>a, b, c</td>
<td>Jurong West, Singapore</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">australia-southeast1</code></td>
<td>a, b, c</td>
<td>Sydney, Australia</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">europe-north1</code></td>
<td>a, b, c</td>
<td>Hamina, Finland</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">europe-west1</code></td>
<td>b, c, d</td>
<td>St. Ghislain, Belgium</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">europe-west2</code></td>
<td>a, b, c</td>
<td>London, England, UK</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">europe-west3</code></td>
<td>a, b, c</td>
<td>Frankfurt, Germany</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">europe-west4</code></td>
<td>a, b, c</td>
<td>Eemshaven, Netherlands</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">europe-west6</code></td>
<td>a, b, c</td>
<td>Zürich, Switzerland</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">northamerica-northeast1</code></td>
<td>a, b, c</td>
<td>Montréal, Québec, Canada</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">southamerica-east1</code></td>
<td>a, b, c</td>
<td>Osasco (São Paulo), Brazil</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">us-central1</code></td>
<td>a, b, c, f</td>
<td>Council Bluffs, Iowa, USA</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">us-east1</code></td>
<td>b, c, d</td>
<td>Moncks Corner, South Carolina, USA</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">us-east4</code></td>
<td>a, b, c</td>
<td>Ashburn, Northern Virginia, USA</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">us-west1</code></td>
<td>a, b, c</td>
<td>The Dalles, Oregon, USA</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">us-west2</code></td>
<td>a, b, c</td>
<td>Los Angeles, California, USA</td>
</tr>
<tr>
<td><code dir="ltr" translate="no">us-west3</code></td>
<td>a, b, c</td>
<td>Salt Lake City, Utah, USA</td>
</tr>
</tbody>
</table>
<h5 id="bkmrk-networking">Networking</h5>
<p id="bkmrk-next-we-will-be-crea">Next we will be creating a network in the us-central1-c zone called <code>google_compute_network.vpc_network</code> and giving it a name of <code>terraform-network</code></p>
<p id="bkmrk-for-this%2C-we-will-de">For this, we will define a a resource.&nbsp;</p>
<pre id="bkmrk-resource-%22google_com"><code class="language-JSON">resource "google_compute_network" "vpc_network"{
    name = "terraform-network"
  }</code></pre>
<p id="bkmrk-depending-on-the-nee">Depending on the need, you can assign the vm's a static ip by defining another resource, this time calling it by the google_compute_address</p>
<pre id="bkmrk-resource-%22google_com-0"><code class="language-JSON">resource "google_compute_address" "vm_static_ip" {
    name = "terraform-static-ip"  
}</code></pre>
<h4 id="bkmrk-creating-the-instanc">Creating the Instance</h4>
<p id="bkmrk-as-always%2C-when-crea">As always, when creating something in terraform, we need to define it as a resource. In this case we will use the <code>google_compute_instance.vm_instance</code> which tells google, bro, spin me up a vm</p>
<p id="bkmrk-just-like-everything">Just like everything else, we need to give it a name. This not only helps with admin tasks, but we can call it by name for later tasks!&nbsp;</p>
<p id="bkmrk-then-we-need-to-pick">Then we need to pick what machine type to use! I am going to be using these <a href="https://cloud.google.com/compute/docs/machine-types#sharedcore" target="_blank" rel="noopener">found here</a></p>
<p id="bkmrk-we-can-add-tags.-thi">We can add tags. This is useful for sorting machines by production, pre deployment and dev.&nbsp;</p>
<p id="bkmrk-%C2%A0-0"><br></p>
<p id="bkmrk-next-thing-we-will-n">Next thing we will need to do is add the boot disk. We can do this by creating a <code>boot_disk</code></p>
<p id="bkmrk-in-here-we-define-th">In here we define the type of disk we want. Here we have gone for a container optimized server</p>
<pre id="bkmrk-boot_disk-%7B-initiali"><code class="language-JSON">boot_disk {
        initialize_params{
            image = "cos-cloud/cos-stable"
        }
    }</code></pre>
<h5 id="bkmrk-%C2%A0-1">More networking</h5>
<p id="bkmrk-finally-we-add-the-i">Finally we add the IP address and allow nat:</p>
<pre id="bkmrk-network_interface-%7B-"><code class="language-JSON">network_interface {
    network = google_compute_network.vpc_network.name 
        access_config {
            nat_ip = google_compute_address.vm_static_ip.address
        }
    }</code></pre>
<p id="bkmrk-%C2%A0-2"><br></p>
<p id="bkmrk-provision-er-is-a-to">Provision er is a tool we can use to get details of the vm we created. Here we will get the public ip address and print it to a file in the folder we are in</p>
<pre id="bkmrk-provisioner-%22local-e"><code class="language-JSON">provisioner "local-exec" {
        command = "echo ${google_compute_instance.vm_instance.name}:${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip} &gt;&gt; ip_address.txt"
    }</code></pre>
<p id="bkmrk-%C2%A0-3"><br></p>
<pre id="bkmrk-provider-%22google%22-%7B-"><code class="language-JSON">provider "google" {
  version = "3.5.0"
  credentials = file("terraform-c8b2b88693d4.json")

project = "absolute-access-271419"
region  = "us-central1"
zone    = "us-central1-c"
}
resource "google_compute_network" "vpc_network"{
name = "terraform-network"
}

resource "google_compute_address" "vm_static_ip" {
name = "terraform-static-ip"

}
resource "google_compute_instance" "vm_instance" {
name    = "terraform-instance"
machine_type = "f1-micro"
tags    = ["test","firsttry"]
provisioner "local-exec" {
command = "echo ${google_compute_instance.vm_instance.name}:${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip} &gt;&gt; ip_address.txt"
}
boot_disk {
initialize_params{
image = "cos-cloud/cos-stable"
}
}

network_interface {
network = google_compute_network.vpc_network.name
access_config {
nat_ip = google_compute_address.vm_static_ip.address
}
}
}
</code></pre>