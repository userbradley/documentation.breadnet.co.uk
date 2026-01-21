---
title: Terraform - Building infrastructure
reviewdate: '2026-12-20'
---

##### Picking your region

First we need to set which cloud provider we will be using. In this example we will be using GCP

Start with defining the cloud providor and then the version. Usually this is not needed!

From Google cloud console, you will need to get the project ID. This can be found on the dashboard of the project.

Then we will need to define the region and zone. Today I will be using us-central1 and then the zone of c

This becomes `us-central1-`c in the format of <country>-<area><dcnumber>-<a,b,c...>

Below is a list of regions and zones. If you are scaling and need low latency, use the same zone as they are physically closer! (wow)

### Regions and Zones

Region

Zones

Location

`asia-east1`

a, b, c

Changhua County, Taiwan

`asia-east2`

a, b, c

Hong Kong

`asia-northeast1`

a, b, c

Tokyo, Japan

`asia-northeast2`

a, b, c

Osaka, Japan

`asia-northeast3`

a, b, c

Seoul, South Korea

`asia-south1`

a, b, c

Mumbai, India

`asia-southeast1`

a, b, c

Jurong West, Singapore

`australia-southeast1`

a, b, c

Sydney, Australia

`europe-north1`

a, b, c

Hamina, Finland

`europe-west1`

b, c, d

St. Ghislain, Belgium

`europe-west2`

a, b, c

London, England, UK

`europe-west3`

a, b, c

Frankfurt, Germany

`europe-west4`

a, b, c

Eemshaven, Netherlands

`europe-west6`

a, b, c

Zürich, Switzerland

`northamerica-northeast1`

a, b, c

Montréal, Québec, Canada

`southamerica-east1`

a, b, c

Osasco (São Paulo), Brazil

`us-central1`

a, b, c, f

Council Bluffs, Iowa, USA

`us-east1`

b, c, d

Moncks Corner, South Carolina, USA

`us-east4`

a, b, c

Ashburn, Northern Virginia, USA

`us-west1`

a, b, c

The Dalles, Oregon, USA

`us-west2`

a, b, c

Los Angeles, California, USA

`us-west3`

a, b, c

Salt Lake City, Utah, USA

##### Networking

Next we will be creating a network in the us-central1-c zone called `google_compute_network.vpc_network` and giving it a name of `terraform-network`

For this, we will define a resource.

    resource "google_compute_network" "vpc_network"{
                                              name = "terraform-network"
                                            }

Depending on the need, you can assign the vm's a static ip by defining another resource, this time calling it by the `google_compute_address`

    resource "google_compute_address" "vm_static_ip" {
        name = "terraform-static-ip"
    }

#### Creating the Instance

As always, when creating something in terraform, we need to define it as a resource. In this case we will use the `google_compute_instance.vm_instance` which tells google, bro, spin me up a vm

Just like everything else, we need to give it a name. This not only helps with admin tasks, but we can call it by name for later tasks!

Then we need to pick what machine type to use! I am going to be using these [found here](https://cloud.google.com/compute/docs/machine-types#sharedcore)

We can add tags. This is useful for sorting machines by production, pre deployment and dev.

Next thing we will need to do is add the boot disk. We can do this by creating a `boot_disk`

In here we define the type of disk we want. Here we have gone for a container optimized server

    boot_disk {
            initialize_params{
                image = "cos-cloud/cos-stable"
            }
        }

##### More networking

Finally, we add the IP address and allow nat:

    network_interface {
        network = google_compute_network.vpc_network.name
            access_config {
                nat_ip = google_compute_address.vm_static_ip.address
            }
        }

`provisioner` is a tool we can use to get details of the vm we created. Here we will get the public ip address and print it to a file in the folder we are in

    provisioner "local-exec" {
            command = "echo ${google_compute_instance.vm_instance.name}:${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip} >> ip_address.txt"
        }



    provider "google" {
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
    command = "echo ${google_compute_instance.vm_instance.name}:${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip} >> ip_address.txt"
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
