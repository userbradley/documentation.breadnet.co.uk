---
title: Serverless VPC access for Cloudrun across Projects
---

# Serverless VPC access for Cloudrun across Projects

Firstly locate the Project numerical ID, this can be done via terraform using the below resource:

!!! Note
    This will only work if you are creating the project through terraform, otherwise use the Data block

```terraform
google_project.vpc-cloudrun.number
```

Create a network with a `/28` subnet

```terraform
resource "google_compute_subnetwork" "custom_test" {
  provider      = google-beta
  name          = "vpc-con"
  ip_cidr_range = "10.2.0.0/28"
  project       = google_project.vpc-host.name
  network       = google_compute_network.vpc_network.name
}
```

Now create the connection, and ensure you set the project field otherwise you will have issues

```terraform
resource "google_vpc_access_connector" "connector" {
  provider = google-beta
  region   = "europe-west2"
  project  = google_project.vpc-cloudrun.name
  name     = "vpc-conn-test-${random_integer.priority.result}"
  max_instances = 3
  min_instances = 2
  subnet {
    name = google_compute_subnetwork.custom_test.name
    project_id = google_project.vpc-host.name
  }
  machine_type = "f1-micro" # (1)!
  
}
```

1.  Depending on how much network traffic you plan to send over this, the machine type needs to be larger.
    The default is `e2-micro`

You will need to give the vpc service account editor on the host

```terraform
resource "google_project_iam_member" "project" {
  project = google_project.vpc-host.name
  role    = "roles/editor"
  member  = "serviceAccount:${google_project.vpc-cloudrun.number}@cloudservices.gserviceaccount.com"
}
```
