---
reviewdate: '2026-12-20'
title: Terraform Sleep
---

## Why

Some resources cant have things applied right after each-other, like creating 12 projects then assigning them IAM

## How to fix

```terraform
resource "google_project" "default" {
  name       = "My Project"
  project_id = "your-project-id"
  org_id     = "1234567"
}

resource "time_sleep" "sleep" {
  create_duration = "10s"
  depends_on      = [google_project.default]
}

resource "google_project" "my_project" {
  name       = "My Project"
  project_id = "your-project-id"
  org_id     = "1234567"
  depends_on = [time_sleep.sleep]
}

```

The above block will

1. Create a google project
2. Sleep for 10 seconds
3. Apply the Google Project IAM

This is especially useful when running in IAM
