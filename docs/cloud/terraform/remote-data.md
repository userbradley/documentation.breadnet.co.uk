---
title: Remote data in terraform
---

# Remote data in terraform

## What is remote data

Remote data is the system in terraform that allows us to use outputs from other configs, in ours.

It sets the dependency on external resources, so should ideally be avoided. We should really use a `data "" ""{}` block


We have split this up in to 2 parts.

Part A: Contains the infrastructure

Part B: The infrastructure that needs data from `Part A`

## Part A

```terraform title="ip.tf"
resource "google_compute_address" "nat" {
  region  = var.region
  project = var.project
  name    = "${var.region}-nat"
}
```

```terraform title="output.tf"
output "gke-nat-ip-address" {
  value = google_compute_address.nat.address
}
```

## Part B

```terraform title="data.tf"
data "terraform_remote_state" "init" {
  backend = "gcs"
  config = {
    bucket = "ip-setup"
    prefix = "nat"
  }
}
```

We can then reference it via it's UID:

```terraform
data.terraform_remote_state.init.outputs.gke-nat-ip-address
```