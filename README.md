# [breadNET Documentation](https://documentation.breadnet.co.uk)
[![Dev](https://github.com/userbradley/documentation.breadnet.co.uk/actions/workflows/dev.yaml/badge.svg)](https://github.com/userbradley/documentation.breadnet.co.uk/actions/workflows/dev.yaml) [![Production](https://github.com/userbradley/documentation.breadnet.co.uk/actions/workflows/prod.yaml/badge.svg)](https://github.com/userbradley/documentation.breadnet.co.uk/actions/workflows/prod.yaml)
[![wakatime](https://wakatime.com/badge/user/befd4d51-df71-4caa-90ba-09a83c0524b0/project/fa7f3e73-d976-48d9-94f5-a17bd1bb4614.svg)](https://wakatime.com/badge/user/befd4d51-df71-4caa-90ba-09a83c0524b0/project/fa7f3e73-d976-48d9-94f5-a17bd1bb4614)

This repo houses all the public documentation that I have created over the years, recently migrated to mkdocs

You can access it at [documentation.breadnet.co.uk](https://documentation.breadnet.co.uk)

## What is the tech stack

This site runs on [fly.io](https://fly.io?ref=documentation.breadnet.co.uk) and is built using GitHub actions

## Why mkdocs

I used to run Bookstack for my documentation when I used to live at my parents house (because electricity was basically free)
but since moving out I was unable to take my 48U server rack with me. Thanks Tory Government.

Mkdocs is simple and flexible where I need it to be, but has very little attack surface.

In fact, [if you can breach the website and prove a reverse shell I will pay you.](SECURITY.md)

Mkdocs uses markdown files making it easy to use, as most engineers know how to write markdown


## Why Migrate

I used to run bookstack, but since moving I found it was becoming annoying to run and maintain the server. MKdocs runs as a docker
container on anywhere that runs docker, or allows static content to be hosted.


## How to Contribute

If you see an issue with a page or something isn't right, please contribute changes back.

### Software you need installed to contribute

1. Podman or Docker
2. Pre-commit

Make a fork of this repo to your account, make the changes then run the below

```shell
podman-compose up
```

Or if you are using Docker:

```shell
docker compose up
```

Navigate to [http://localhost:8080](http://localhost:8080) where you will see the site rendered.

### Pre commit

We use pre-commit on this repo to keep bad things out

```shell
task pre-commit-install
```

This will install the pre-commit hooks on this repo, as well as run pre-commit on the files.

### I want to run `mkdocs` locally

```shell
pip3 install -r requirments.txt
brew install cairo freetype libffi libjpeg libpng zlib pngquant
```
## CI

This repo uses a fair bit of CI for a simple site

Below takes you through the actions that run when you open a Pull request

### Auto Assign

This action will automatically set the user who created the PR as the assignee and then set [@userbradley](https://github.com/userbradley) as the reviewer

### Dev

This action will build the site and deploy it to my Fly account. Nothing special is done here

### Pre Commit

This runs the pre-commit on the changes, and will error if there is something wrong.

### Trufflehog Secret scaner

Checks you've not accidentally commited a secret in to the repo!

### Production

This action runs only on commits to `main` (eg: through a Pull request)

The action will deploy the site to my Fly account under the `documentation.breadnet.co.uk` domain


## Uptime

[Status Page](https://status.breadnet.co.uk)

This site is hosted on Fly and has a system in place to promote changes from Development to Production, meaning something
would have had to go **really** wrong for the site to not be online

Eventually I will create an archive of this site as a Google storage object that you can download, but until then if it goes down then
just suffer.

From the migration, the URl changed.  `bookstack.breadnet.co.uk` will redirect to `documentation.breadnet.co.uk`, and all
pages that were originally on `bookstack` should now redirect to a page on mkdocs. see [redirect.conf](redirect.conf) for pages



# Branching Strategy

## main

This is the main branch of the site and repo, which holds the live site that you can access.

The Dev build must pass, and you require approval before merging in to main is allowed

## dev

This branch houses the development site, which is built on each commit to `dev`

By default, this site is not indexed by google, and has a password protecting it


# File directory

```text
.
├── CODEOWNERS
├── CODE_OF_CONDUCT.md
├── Dockerfile
├── LICENSE
├── README.md
├── SECURITY.md
├── Taskfile.yml
├── ci-status.md
├── ci-status.sh
├── cloudflare.conf
├── deny.conf
├── dev-nginx.conf
├── dev-robots.txt
├── dev.Dockerfile
├── dev.toml
├── docker-compose.yaml
├── docs
│   ├── assets
│   │   ├── 120m.png
│   │   ├── 2022-grocy-list.png
│   │   ├── 2023-grocy-notthere.png
│   │   ├── 2mznsOlbTSNaaAcI-image-1604671927789.png
│   │   ├── 46FRmJql62IK5eFK-image-1620574015296.png
│   │   ├── 48hjeTKxj568yycW-image-1621117434743.png
│   │   ├── 7yHzJ5Hrs19Z0A5k-image-1621088484420.png
│   │   ├── 80eCCMAfHz1QGsR0-image-1606765018828.png
│   │   ├── 9lwDfBcEr0MVFVt3-image-1642771239476.png
│   │   ├── AooTYe4QwdbFLMru-image-1606764758712.png
│   │   ├── DEK0ilyWJhXXzqhb-image-1642771115391.png
│   │   ├── DO_Logo_icon_blue.png
│   │   ├── GJIc7rJptYTmXzfh-image-1606735635793.png
│   │   ├── IMG_9259.JPG
│   │   ├── IMG_9260.JPG
│   │   ├── IMG_9261.jpg
│   │   ├── LeArchitect.ttf
│   │   ├── PSJKUlFwm2Zluoes-image-1651955845728.png
│   │   ├── airflow-1.png
│   │   ├── airflow-2.png
│   │   ├── amex-simpleicons.png
│   │   ├── b7eY4DH3O7l5mvGO-image-1606744736955.png
│   │   ├── cf_strict-ssl.png
│   │   ├── chronicle-ingestion-auth.png
│   │   ├── chronicle-select-vector.png
│   │   ├── chronicle-vector-logs-show-up.png
│   │   ├── cloudflare_status.png
│   │   ├── cluster.png
│   │   ├── collapsed-section-view.webp
│   │   ├── composer-owner-numerical.png
│   │   ├── conductorone-entitlement-alias.png
│   │   ├── data-incident-response-figure-1.png
│   │   ├── dell-hdd-password-protected.png
│   │   ├── dev-tools-console.png
│   │   ├── dev-tools-showPassword.png
│   │   ├── docker-ps.png
│   │   ├── e1giSp8BGj8Wx2nH-drawing-1-1620509841.png
│   │   ├── ee-router-advanced-settings.png
│   │   ├── ee-router-advanced.png
│   │   ├── ee-router-boradband.png
│   │   ├── ee-router-dns.png
│   │   ├── ee-router-homepage.png
│   │   ├── ee-router-ipv4-config.png
│   │   ├── ee-router-system.png
│   │   ├── ee-show-password.png
│   │   ├── fan.png
│   │   ├── gcloud-add-user-viewer.png
│   │   ├── gcloud-grant-access-buttom.png
│   │   ├── gcloud-select-org-project.png
│   │   ├── gcloud-select-org.png
│   │   ├── gh-actions.png
│   │   ├── gke-pools.png
│   │   ├── goQwxsbjB33Z1ZN1-image-1606741677022.png
│   │   ├── google-api-try-this-method.png
│   │   ├── google-api-user-look-like-this.png
│   │   ├── google-api-user-response.png
│   │   ├── google-cloud-icons
│   │   │   ├── access_context_manager
│   │   │   │   ├── access_context_manager.png
│   │   │   │   └── access_context_manager.svg
│   │   │   ├── administration
│   │   │   │   ├── administration.png
│   │   │   │   └── administration.svg
│   │   │   ├── advanced_agent_modeling
│   │   │   │   ├── advanced_agent_modeling.png
│   │   │   │   └── advanced_agent_modeling.svg
│   │   │   ├── advanced_solutions_lab
│   │   │   │   ├── advanced_solutions_lab.png
│   │   │   │   └── advanced_solutions_lab.svg
│   │   │   ├── agent_assist
│   │   │   │   ├── agent_assist.png
│   │   │   │   └── agent_assist.svg
│   │   │   ├── ai_hub
│   │   │   │   ├── ai_hub.png
│   │   │   │   └── ai_hub.svg
│   │   │   ├── ai_platform
│   │   │   │   ├── ai_platform.png
│   │   │   │   └── ai_platform.svg
│   │   │   ├── ai_platform_unified
│   │   │   │   ├── ai_platform_unified.png
│   │   │   │   └── ai_platform_unified.svg
│   │   │   ├── analytics_hub
│   │   │   │   ├── analytics_hub.png
│   │   │   │   └── analytics_hub.svg
│   │   │   ├── anthos
│   │   │   │   ├── anthos.png
│   │   │   │   └── anthos.svg
│   │   │   ├── anthos_config_management
│   │   │   │   ├── anthos_config_management.png
│   │   │   │   └── anthos_config_management.svg
│   │   │   ├── anthos_service_mesh
│   │   │   │   ├── anthos_service_mesh.png
│   │   │   │   └── anthos_service_mesh.svg
│   │   │   ├── api
│   │   │   │   ├── api.png
│   │   │   │   └── api.svg
│   │   │   ├── api_analytics
│   │   │   │   ├── api_analytics.png
│   │   │   │   └── api_analytics.svg
│   │   │   ├── api_monetization
│   │   │   │   ├── api_monetization.png
│   │   │   │   └── api_monetization.svg
│   │   │   ├── apigee_api_platform
│   │   │   │   ├── apigee_api_platform.png
│   │   │   │   └── apigee_api_platform.svg
│   │   │   ├── apigee_sense
│   │   │   │   ├── apigee_sense.png
│   │   │   │   └── apigee_sense.svg
│   │   │   ├── app_engine
│   │   │   │   ├── app_engine.png
│   │   │   │   └── app_engine.svg
│   │   │   ├── artifact_registry
│   │   │   │   ├── artifact_registry.png
│   │   │   │   └── artifact_registry.svg
│   │   │   ├── asset_inventory
│   │   │   │   ├── asset_inventory.png
│   │   │   │   └── asset_inventory.svg
│   │   │   ├── assured_workloads
│   │   │   │   ├── assured_workloads.png
│   │   │   │   └── assured_workloads.svg
│   │   │   ├── automl
│   │   │   │   ├── automl.png
│   │   │   │   └── automl.svg
│   │   │   ├── automl_natural_language
│   │   │   │   ├── automl_natural_language.png
│   │   │   │   └── automl_natural_language.svg
│   │   │   ├── automl_tables
│   │   │   │   ├── automl_tables.png
│   │   │   │   └── automl_tables.svg
│   │   │   ├── automl_translation
│   │   │   │   ├── automl_translation.png
│   │   │   │   └── automl_translation.svg
│   │   │   ├── automl_video_intelligence
│   │   │   │   ├── automl_video_intelligence.png
│   │   │   │   └── automl_video_intelligence.svg
│   │   │   ├── automl_vision
│   │   │   │   ├── automl_vision.png
│   │   │   │   └── automl_vision.svg
│   │   │   ├── bare_metal_solutions
│   │   │   │   ├── bare_metal_solutions.png
│   │   │   │   └── bare_metal_solutions.svg
│   │   │   ├── batch
│   │   │   │   ├── batch.png
│   │   │   │   └── batch.svg
│   │   │   ├── beyondcorp
│   │   │   │   ├── beyondcorp.png
│   │   │   │   └── beyondcorp.svg
│   │   │   ├── bigquery
│   │   │   │   ├── bigquery.png
│   │   │   │   └── bigquery.svg
│   │   │   ├── bigtable
│   │   │   │   ├── bigtable.png
│   │   │   │   └── bigtable.svg
│   │   │   ├── billing
│   │   │   │   ├── billing.png
│   │   │   │   └── billing.svg
│   │   │   ├── binary_authorization
│   │   │   │   ├── binary_authorization.png
│   │   │   │   └── binary_authorization.svg
│   │   │   ├── catalog
│   │   │   │   ├── catalog.png
│   │   │   │   └── catalog.svg
│   │   │   ├── certificate_authority_service
│   │   │   │   ├── certificate_authority_service.png
│   │   │   │   └── certificate_authority_service.svg
│   │   │   ├── certificate_manager
│   │   │   │   ├── certificate_manager.png
│   │   │   │   └── certificate_manager.svg
│   │   │   ├── cloud_api_gateway
│   │   │   │   ├── cloud_api_gateway.png
│   │   │   │   └── cloud_api_gateway.svg
│   │   │   ├── cloud_apis
│   │   │   │   ├── cloud_apis.png
│   │   │   │   └── cloud_apis.svg
│   │   │   ├── cloud_armor
│   │   │   │   ├── cloud_armor.png
│   │   │   │   └── cloud_armor.svg
│   │   │   ├── cloud_asset_inventory
│   │   │   │   ├── cloud_asset_inventory.png
│   │   │   │   └── cloud_asset_inventory.svg
│   │   │   ├── cloud_audit_logs
│   │   │   │   ├── cloud_audit_logs.png
│   │   │   │   └── cloud_audit_logs.svg
│   │   │   ├── cloud_build
│   │   │   │   ├── cloud_build.png
│   │   │   │   └── cloud_build.svg
│   │   │   ├── cloud_cdn
│   │   │   │   ├── cloud_cdn.png
│   │   │   │   └── cloud_cdn.svg
│   │   │   ├── cloud_code
│   │   │   │   ├── cloud_code.png
│   │   │   │   └── cloud_code.svg
│   │   │   ├── cloud_composer
│   │   │   │   ├── cloud_composer.png
│   │   │   │   └── cloud_composer.svg
│   │   │   ├── cloud_data_fusion
│   │   │   │   ├── cloud_data_fusion.png
│   │   │   │   └── cloud_data_fusion.svg
│   │   │   ├── cloud_deploy
│   │   │   │   ├── cloud_deploy.png
│   │   │   │   └── cloud_deploy.svg
│   │   │   ├── cloud_deployment_manager
│   │   │   │   ├── cloud_deployment_manager.png
│   │   │   │   └── cloud_deployment_manager.svg
│   │   │   ├── cloud_dns
│   │   │   │   ├── cloud_dns.png
│   │   │   │   └── cloud_dns.svg
│   │   │   ├── cloud_domains
│   │   │   │   ├── cloud_domains.png
│   │   │   │   └── cloud_domains.svg
│   │   │   ├── cloud_ekm
│   │   │   │   ├── cloud_ekm.png
│   │   │   │   └── cloud_ekm.svg
│   │   │   ├── cloud_endpoints
│   │   │   │   ├── cloud_endpoints.png
│   │   │   │   └── cloud_endpoints.svg
│   │   │   ├── cloud_external_ip_addresses
│   │   │   │   ├── cloud_external_ip_addresses.png
│   │   │   │   └── cloud_external_ip_addresses.svg
│   │   │   ├── cloud_firewall_rules
│   │   │   │   ├── cloud_firewall_rules.png
│   │   │   │   └── cloud_firewall_rules.svg
│   │   │   ├── cloud_for_marketing
│   │   │   │   ├── cloud_for_marketing.png
│   │   │   │   └── cloud_for_marketing.svg
│   │   │   ├── cloud_functions
│   │   │   │   ├── cloud_functions.png
│   │   │   │   └── cloud_functions.svg
│   │   │   ├── cloud_generic
│   │   │   │   ├── cloud_generic.png
│   │   │   │   └── cloud_generic.svg
│   │   │   ├── cloud_gpu
│   │   │   │   ├── cloud_gpu.png
│   │   │   │   └── cloud_gpu.svg
│   │   │   ├── cloud_healthcare_api
│   │   │   │   ├── cloud_healthcare_api.png
│   │   │   │   └── cloud_healthcare_api.svg
│   │   │   ├── cloud_healthcare_marketplace
│   │   │   │   ├── cloud_healthcare_marketplace.png
│   │   │   │   └── cloud_healthcare_marketplace.svg
│   │   │   ├── cloud_hsm
│   │   │   │   ├── cloud_hsm.png
│   │   │   │   └── cloud_hsm.svg
│   │   │   ├── cloud_ids
│   │   │   │   ├── cloud_ids.png
│   │   │   │   └── cloud_ids.svg
│   │   │   ├── cloud_inference_api
│   │   │   │   ├── cloud_inference_api.png
│   │   │   │   └── cloud_inference_api.svg
│   │   │   ├── cloud_interconnect
│   │   │   │   ├── cloud_interconnect.png
│   │   │   │   └── cloud_interconnect.svg
│   │   │   ├── cloud_jobs_api
│   │   │   │   ├── cloud_jobs_api.png
│   │   │   │   └── cloud_jobs_api.svg
│   │   │   ├── cloud_load_balancing
│   │   │   │   ├── cloud_load_balancing.png
│   │   │   │   └── cloud_load_balancing.svg
│   │   │   ├── cloud_logging
│   │   │   │   ├── cloud_logging.png
│   │   │   │   └── cloud_logging.svg
│   │   │   ├── cloud_media_edge
│   │   │   │   ├── cloud_media_edge.png
│   │   │   │   └── cloud_media_edge.svg
│   │   │   ├── cloud_monitoring
│   │   │   │   ├── cloud_monitoring.png
│   │   │   │   └── cloud_monitoring.svg
│   │   │   ├── cloud_nat
│   │   │   │   ├── cloud_nat.png
│   │   │   │   └── cloud_nat.svg
│   │   │   ├── cloud_natural_language_api
│   │   │   │   ├── cloud_natural_language_api.png
│   │   │   │   └── cloud_natural_language_api.svg
│   │   │   ├── cloud_network
│   │   │   │   ├── cloud_network.png
│   │   │   │   └── cloud_network.svg
│   │   │   ├── cloud_ops
│   │   │   │   ├── cloud_ops.png
│   │   │   │   └── cloud_ops.svg
│   │   │   ├── cloud_optimization_ai
│   │   │   │   ├── cloud_optimization_ai.png
│   │   │   │   └── cloud_optimization_ai.svg
│   │   │   ├── cloud_optimization_ai_-_fleet_routing_api
│   │   │   │   ├── cloud_optimization_ai_-_fleet_routing_api.png
│   │   │   │   └── cloud_optimization_ai_-_fleet_routing_api.svg
│   │   │   ├── cloud_router
│   │   │   │   ├── cloud_router.png
│   │   │   │   └── cloud_router.svg
│   │   │   ├── cloud_routes
│   │   │   │   ├── cloud_routes.png
│   │   │   │   └── cloud_routes.svg
│   │   │   ├── cloud_run
│   │   │   │   ├── cloud_run.png
│   │   │   │   └── cloud_run.svg
│   │   │   ├── cloud_run_for_anthos
│   │   │   │   ├── cloud_run_for_anthos.png
│   │   │   │   └── cloud_run_for_anthos.svg
│   │   │   ├── cloud_scheduler
│   │   │   │   ├── cloud_scheduler.png
│   │   │   │   └── cloud_scheduler.svg
│   │   │   ├── cloud_security_scanner
│   │   │   │   ├── cloud_security_scanner.png
│   │   │   │   └── cloud_security_scanner.svg
│   │   │   ├── cloud_shell
│   │   │   │   ├── cloud_shell.png
│   │   │   │   └── cloud_shell.svg
│   │   │   ├── cloud_spanner
│   │   │   │   ├── cloud_spanner.png
│   │   │   │   └── cloud_spanner.svg
│   │   │   ├── cloud_sql
│   │   │   │   ├── cloud_sql.png
│   │   │   │   └── cloud_sql.svg
│   │   │   ├── cloud_storage
│   │   │   │   ├── cloud_storage.png
│   │   │   │   └── cloud_storage.svg
│   │   │   ├── cloud_tasks
│   │   │   │   ├── cloud_tasks.png
│   │   │   │   └── cloud_tasks.svg
│   │   │   ├── cloud_test_lab
│   │   │   │   ├── cloud_test_lab.png
│   │   │   │   └── cloud_test_lab.svg
│   │   │   ├── cloud_tpu
│   │   │   │   ├── cloud_tpu.png
│   │   │   │   └── cloud_tpu.svg
│   │   │   ├── cloud_translation_api
│   │   │   │   ├── cloud_translation_api.png
│   │   │   │   └── cloud_translation_api.svg
│   │   │   ├── cloud_vision_api
│   │   │   │   ├── cloud_vision_api.png
│   │   │   │   └── cloud_vision_api.svg
│   │   │   ├── cloud_vpn
│   │   │   │   ├── cloud_vpn.png
│   │   │   │   └── cloud_vpn.svg
│   │   │   ├── compute_engine
│   │   │   │   ├── compute_engine.png
│   │   │   │   └── compute_engine.svg
│   │   │   ├── configuration_management
│   │   │   │   ├── configuration_management.png
│   │   │   │   └── configuration_management.svg
│   │   │   ├── connectivity_test
│   │   │   │   ├── connectivity_test.png
│   │   │   │   └── connectivity_test.svg
│   │   │   ├── connectors
│   │   │   │   ├── connectors.png
│   │   │   │   └── connectors.svg
│   │   │   ├── contact_center_ai
│   │   │   │   ├── contact_center_ai.png
│   │   │   │   └── contact_center_ai.svg
│   │   │   ├── container_optimized_os
│   │   │   │   ├── container_optimized_os.png
│   │   │   │   └── container_optimized_os.svg
│   │   │   ├── container_registry
│   │   │   │   ├── container_registry.png
│   │   │   │   └── container_registry.svg
│   │   │   ├── data_catalog
│   │   │   │   ├── data_catalog.png
│   │   │   │   └── data_catalog.svg
│   │   │   ├── data_labeling
│   │   │   │   ├── data_labeling.png
│   │   │   │   └── data_labeling.svg
│   │   │   ├── data_layers
│   │   │   │   ├── data_layers.png
│   │   │   │   └── data_layers.svg
│   │   │   ├── data_loss_prevention_api
│   │   │   │   ├── data_loss_prevention_api.png
│   │   │   │   └── data_loss_prevention_api.svg
│   │   │   ├── data_qna
│   │   │   │   ├── data_qna.png
│   │   │   │   └── data_qna.svg
│   │   │   ├── data_studio
│   │   │   │   ├── data_studio.png
│   │   │   │   └── data_studio.svg
│   │   │   ├── data_transfer
│   │   │   │   ├── data_transfer.png
│   │   │   │   └── data_transfer.svg
│   │   │   ├── database_migration_service
│   │   │   │   ├── database_migration_service.png
│   │   │   │   └── database_migration_service.svg
│   │   │   ├── dataflow
│   │   │   │   ├── dataflow.png
│   │   │   │   └── dataflow.svg
│   │   │   ├── datalab
│   │   │   │   ├── datalab.png
│   │   │   │   └── datalab.svg
│   │   │   ├── dataplex
│   │   │   │   ├── dataplex.png
│   │   │   │   └── dataplex.svg
│   │   │   ├── datapol
│   │   │   │   ├── datapol.png
│   │   │   │   └── datapol.svg
│   │   │   ├── dataprep
│   │   │   │   ├── dataprep.png
│   │   │   │   └── dataprep.svg
│   │   │   ├── dataproc
│   │   │   │   ├── dataproc.png
│   │   │   │   └── dataproc.svg
│   │   │   ├── dataproc_metastore
│   │   │   │   ├── dataproc_metastore.png
│   │   │   │   └── dataproc_metastore.svg
│   │   │   ├── datashare
│   │   │   │   ├── datashare.png
│   │   │   │   └── datashare.svg
│   │   │   ├── datastore
│   │   │   │   ├── datastore.png
│   │   │   │   └── datastore.svg
│   │   │   ├── datastream
│   │   │   │   ├── datastream.png
│   │   │   │   └── datastream.svg
│   │   │   ├── debugger
│   │   │   │   ├── debugger.png
│   │   │   │   └── debugger.svg
│   │   │   ├── developer_portal
│   │   │   │   ├── developer_portal.png
│   │   │   │   └── developer_portal.svg
│   │   │   ├── dialogflow
│   │   │   │   ├── dialogflow.png
│   │   │   │   └── dialogflow.svg
│   │   │   ├── dialogflow_cx
│   │   │   │   ├── dialogflow_cx.png
│   │   │   │   └── dialogflow_cx.svg
│   │   │   ├── dialogflow_insights
│   │   │   │   ├── dialogflow_insights.png
│   │   │   │   └── dialogflow_insights.svg
│   │   │   ├── document_ai
│   │   │   │   ├── document_ai.png
│   │   │   │   └── document_ai.svg
│   │   │   ├── early_access_center
│   │   │   │   ├── early_access_center.png
│   │   │   │   └── early_access_center.svg
│   │   │   ├── error_reporting
│   │   │   │   ├── error_reporting.png
│   │   │   │   └── error_reporting.svg
│   │   │   ├── eventarc
│   │   │   │   ├── eventarc.png
│   │   │   │   └── eventarc.svg
│   │   │   ├── filestore
│   │   │   │   ├── filestore.png
│   │   │   │   └── filestore.svg
│   │   │   ├── financial_services_marketplace
│   │   │   │   ├── financial_services_marketplace.png
│   │   │   │   └── financial_services_marketplace.svg
│   │   │   ├── firestore
│   │   │   │   ├── firestore.png
│   │   │   │   └── firestore.svg
│   │   │   ├── fleet_engine
│   │   │   │   ├── fleet_engine.png
│   │   │   │   └── fleet_engine.svg
│   │   │   ├── free_trial
│   │   │   │   ├── free_trial.png
│   │   │   │   └── free_trial.svg
│   │   │   ├── game_servers
│   │   │   │   ├── game_servers.png
│   │   │   │   └── game_servers.svg
│   │   │   ├── gce_systems_management
│   │   │   │   ├── gce_systems_management.png
│   │   │   │   └── gce_systems_management.svg
│   │   │   ├── genomics
│   │   │   │   ├── genomics.png
│   │   │   │   └── genomics.svg
│   │   │   ├── gke_on-prem
│   │   │   │   ├── gke_on-prem.png
│   │   │   │   └── gke_on-prem.svg
│   │   │   ├── google_cloud_marketplace
│   │   │   │   ├── google_cloud_marketplace.png
│   │   │   │   └── google_cloud_marketplace.svg
│   │   │   ├── google_kubernetes_engine
│   │   │   │   ├── google_kubernetes_engine.png
│   │   │   │   └── google_kubernetes_engine.svg
│   │   │   ├── google_maps_platform
│   │   │   │   ├── google_maps_platform.png
│   │   │   │   └── google_maps_platform.svg
│   │   │   ├── healthcare_nlp_api
│   │   │   │   ├── healthcare_nlp_api.png
│   │   │   │   └── healthcare_nlp_api.svg
│   │   │   ├── home
│   │   │   │   ├── home.png
│   │   │   │   └── home.svg
│   │   │   ├── identity-aware_proxy
│   │   │   │   ├── identity-aware_proxy.png
│   │   │   │   └── identity-aware_proxy.svg
│   │   │   ├── identity_and_access_management
│   │   │   │   ├── identity_and_access_management.png
│   │   │   │   └── identity_and_access_management.svg
│   │   │   ├── identity_platform
│   │   │   │   ├── identity_platform.png
│   │   │   │   └── identity_platform.svg
│   │   │   ├── iot_core
│   │   │   │   ├── iot_core.png
│   │   │   │   └── iot_core.svg
│   │   │   ├── iot_edge
│   │   │   │   ├── iot_edge.png
│   │   │   │   └── iot_edge.svg
│   │   │   ├── key_access_justifications
│   │   │   │   ├── key_access_justifications.png
│   │   │   │   └── key_access_justifications.svg
│   │   │   ├── key_management_service
│   │   │   │   ├── key_management_service.png
│   │   │   │   └── key_management_service.svg
│   │   │   ├── kuberun
│   │   │   │   ├── kuberun.png
│   │   │   │   └── kuberun.svg
│   │   │   ├── launcher
│   │   │   │   ├── launcher.png
│   │   │   │   └── launcher.svg
│   │   │   ├── local_ssd
│   │   │   │   ├── local_ssd.png
│   │   │   │   └── local_ssd.svg
│   │   │   ├── looker
│   │   │   │   ├── looker.png
│   │   │   │   └── looker.svg
│   │   │   ├── managed_service_for_microsoft_active_directory
│   │   │   │   ├── managed_service_for_microsoft_active_directory.png
│   │   │   │   └── managed_service_for_microsoft_active_directory.svg
│   │   │   ├── media_translation_api
│   │   │   │   ├── media_translation_api.png
│   │   │   │   └── media_translation_api.svg
│   │   │   ├── memorystore
│   │   │   │   ├── memorystore.png
│   │   │   │   └── memorystore.svg
│   │   │   ├── migrate_for_anthos
│   │   │   │   ├── migrate_for_anthos.png
│   │   │   │   └── migrate_for_anthos.svg
│   │   │   ├── migrate_for_compute_engine
│   │   │   │   ├── migrate_for_compute_engine.png
│   │   │   │   └── migrate_for_compute_engine.svg
│   │   │   ├── my_cloud
│   │   │   │   ├── my_cloud.png
│   │   │   │   └── my_cloud.svg
│   │   │   ├── network_connectivity_center
│   │   │   │   ├── network_connectivity_center.png
│   │   │   │   └── network_connectivity_center.svg
│   │   │   ├── network_intelligence_center
│   │   │   │   ├── network_intelligence_center.png
│   │   │   │   └── network_intelligence_center.svg
│   │   │   ├── network_security
│   │   │   │   ├── network_security.png
│   │   │   │   └── network_security.svg
│   │   │   ├── network_tiers
│   │   │   │   ├── network_tiers.png
│   │   │   │   └── network_tiers.svg
│   │   │   ├── network_topology
│   │   │   │   ├── network_topology.png
│   │   │   │   └── network_topology.svg
│   │   │   ├── onboarding
│   │   │   │   ├── onboarding.png
│   │   │   │   └── onboarding.svg
│   │   │   ├── os_configuration_management
│   │   │   │   ├── os_configuration_management.png
│   │   │   │   └── os_configuration_management.svg
│   │   │   ├── os_inventory_management
│   │   │   │   ├── os_inventory_management.png
│   │   │   │   └── os_inventory_management.svg
│   │   │   ├── os_patch_management
│   │   │   │   ├── os_patch_management.png
│   │   │   │   └── os_patch_management.svg
│   │   │   ├── partner_interconnect
│   │   │   │   ├── partner_interconnect.png
│   │   │   │   └── partner_interconnect.svg
│   │   │   ├── partner_portal
│   │   │   │   ├── partner_portal.png
│   │   │   │   └── partner_portal.svg
│   │   │   ├── performance_dashboard
│   │   │   │   ├── performance_dashboard.png
│   │   │   │   └── performance_dashboard.svg
│   │   │   ├── permissions
│   │   │   │   ├── permissions.png
│   │   │   │   └── permissions.svg
│   │   │   ├── persistent_disk
│   │   │   │   ├── persistent_disk.png
│   │   │   │   └── persistent_disk.svg
│   │   │   ├── phishing_protection
│   │   │   │   ├── phishing_protection.png
│   │   │   │   └── phishing_protection.svg
│   │   │   ├── policy_analyzer
│   │   │   │   ├── policy_analyzer.png
│   │   │   │   └── policy_analyzer.svg
│   │   │   ├── premium_network_tier
│   │   │   │   ├── premium_network_tier.png
│   │   │   │   └── premium_network_tier.svg
│   │   │   ├── private_connectivity
│   │   │   │   ├── private_connectivity.png
│   │   │   │   └── private_connectivity.svg
│   │   │   ├── private_service_connect
│   │   │   │   ├── private_service_connect.png
│   │   │   │   └── private_service_connect.svg
│   │   │   ├── producer_portal
│   │   │   │   ├── producer_portal.png
│   │   │   │   └── producer_portal.svg
│   │   │   ├── profiler
│   │   │   │   ├── profiler.png
│   │   │   │   └── profiler.svg
│   │   │   ├── project
│   │   │   │   ├── project.png
│   │   │   │   └── project.svg
│   │   │   ├── pubsub
│   │   │   │   ├── pubsub.png
│   │   │   │   └── pubsub.svg
│   │   │   ├── quantum_engine
│   │   │   │   ├── quantum_engine.png
│   │   │   │   └── quantum_engine.svg
│   │   │   ├── quotas
│   │   │   │   ├── quotas.png
│   │   │   │   └── quotas.svg
│   │   │   ├── real-world_insights
│   │   │   │   ├── real-world_insights.png
│   │   │   │   └── real-world_insights.svg
│   │   │   ├── recommendations_ai
│   │   │   │   ├── recommendations_ai.png
│   │   │   │   └── recommendations_ai.svg
│   │   │   ├── release_notes
│   │   │   │   ├── release_notes.png
│   │   │   │   └── release_notes.svg
│   │   │   ├── retail_api
│   │   │   │   ├── retail_api.png
│   │   │   │   └── retail_api.svg
│   │   │   ├── risk_manager
│   │   │   │   ├── risk_manager.png
│   │   │   │   └── risk_manager.svg
│   │   │   ├── runtime_config
│   │   │   │   ├── runtime_config.png
│   │   │   │   └── runtime_config.svg
│   │   │   ├── secret_manager
│   │   │   │   ├── secret_manager.png
│   │   │   │   └── secret_manager.svg
│   │   │   ├── security
│   │   │   │   ├── security.png
│   │   │   │   └── security.svg
│   │   │   ├── security_command_center
│   │   │   │   ├── security_command_center.png
│   │   │   │   └── security_command_center.svg
│   │   │   ├── security_health_advisor
│   │   │   │   ├── security_health_advisor.png
│   │   │   │   └── security_health_advisor.svg
│   │   │   ├── security_key_enforcement
│   │   │   │   ├── security_key_enforcement.png
│   │   │   │   └── security_key_enforcement.svg
│   │   │   ├── service_discovery
│   │   │   │   ├── service_discovery.png
│   │   │   │   └── service_discovery.svg
│   │   │   ├── speech-to-text
│   │   │   │   ├── speech-to-text.png
│   │   │   │   └── speech-to-text.svg
│   │   │   ├── stackdriver
│   │   │   │   ├── stackdriver.png
│   │   │   │   └── stackdriver.svg
│   │   │   ├── standard_network_tier
│   │   │   │   ├── standard_network_tier.png
│   │   │   │   └── standard_network_tier.svg
│   │   │   ├── stream_suite
│   │   │   │   ├── stream_suite.png
│   │   │   │   └── stream_suite.svg
│   │   │   ├── support
│   │   │   │   ├── support.png
│   │   │   │   └── support.svg
│   │   │   ├── tensorflow_enterprise
│   │   │   │   ├── tensorflow_enterprise.png
│   │   │   │   └── tensorflow_enterprise.svg
│   │   │   ├── text-to-speech
│   │   │   │   ├── text-to-speech.png
│   │   │   │   └── text-to-speech.svg
│   │   │   ├── tools_for_powershell
│   │   │   │   ├── tools_for_powershell.png
│   │   │   │   └── tools_for_powershell.svg
│   │   │   ├── trace
│   │   │   │   ├── trace.png
│   │   │   │   └── trace.svg
│   │   │   ├── traffic_director
│   │   │   │   ├── traffic_director.png
│   │   │   │   └── traffic_director.svg
│   │   │   ├── transfer
│   │   │   │   ├── transfer.png
│   │   │   │   └── transfer.svg
│   │   │   ├── transfer_appliance
│   │   │   │   ├── transfer_appliance.png
│   │   │   │   └── transfer_appliance.svg
│   │   │   ├── user_preferences
│   │   │   │   ├── user_preferences.png
│   │   │   │   └── user_preferences.svg
│   │   │   ├── vertexai
│   │   │   │   ├── vertexai.png
│   │   │   │   └── vertexai.svg
│   │   │   ├── video_intelligence_api
│   │   │   │   ├── video_intelligence_api.png
│   │   │   │   └── video_intelligence_api.svg
│   │   │   ├── virtual_private_cloud
│   │   │   │   ├── virtual_private_cloud.png
│   │   │   │   └── virtual_private_cloud.svg
│   │   │   ├── visual_inspection
│   │   │   │   ├── visual_inspection.png
│   │   │   │   └── visual_inspection.svg
│   │   │   ├── vmware_engine
│   │   │   │   ├── vmware_engine.png
│   │   │   │   └── vmware_engine.svg
│   │   │   ├── web_risk
│   │   │   │   ├── web_risk.png
│   │   │   │   └── web_risk.svg
│   │   │   ├── web_security_scanner
│   │   │   │   ├── web_security_scanner.png
│   │   │   │   └── web_security_scanner.svg
│   │   │   ├── workflows
│   │   │   │   ├── workflows.png
│   │   │   │   └── workflows.svg
│   │   │   └── workload_identity_pool
│   │   │       ├── workload_identity_pool.png
│   │   │       └── workload_identity_pool.svg
│   │   ├── grilling.png
│   │   ├── h0o4TLba8od6YCyr-image-1606757098863.png
│   │   ├── harvest-logo.png
│   │   ├── heater_cover.jpeg
│   │   ├── heater_details.png
│   │   ├── heater_thermo.jpeg
│   │   ├── heater_thermo_control.png
│   │   ├── iPZWBvJp9qJTDbh5-image-1642771101260.png
│   │   ├── ikea-paradox.jpg
│   │   ├── iqQ48KLKrC2hNJ1k-image-1606743820345.png
│   │   ├── k3s-entra-app-registration-nav.png
│   │   ├── k3s-entra-group-claims.png
│   │   ├── k3s-entra-homepage.png
│   │   ├── k3s-entra-optional-claim.png
│   │   ├── k3s-entra-token-config.png
│   │   ├── k3s-logo.png
│   │   ├── k74fQlTzbNTCoVmD-image-1642771208110.png
│   │   ├── kubernetes-icons
│   │   │   ├── png
│   │   │   │   ├── control_plane_components
│   │   │   │   │   └── labeled
│   │   │   │   │       ├── api-.png
│   │   │   │   │       ├── api-128.png
│   │   │   │   │       ├── api-256.png
│   │   │   │   │       ├── c-c-m-.png
│   │   │   │   │       ├── c-c-m-128.png
│   │   │   │   │       ├── c-c-m-256.png
│   │   │   │   │       ├── c-m-.png
│   │   │   │   │       ├── c-m-128.png
│   │   │   │   │       ├── c-m-256.png
│   │   │   │   │       ├── k-proxy-.png
│   │   │   │   │       ├── k-proxy-128.png
│   │   │   │   │       ├── k-proxy-256.png
│   │   │   │   │       ├── kubelet-.png
│   │   │   │   │       ├── kubelet-128.png
│   │   │   │   │       ├── kubelet-256.png
│   │   │   │   │       ├── sched-.png
│   │   │   │   │       ├── sched-128.png
│   │   │   │   │       └── sched-256.png
│   │   │   │   ├── infrastructure_components
│   │   │   │   │   ├── labeled
│   │   │   │   │   │   ├── control-plane-128.png
│   │   │   │   │   │   ├── control-plane-256.png
│   │   │   │   │   │   ├── etcd-.png
│   │   │   │   │   │   ├── etcd-128.png
│   │   │   │   │   │   ├── etcd-256.png
│   │   │   │   │   │   ├── master-.png
│   │   │   │   │   │   ├── master-128.png
│   │   │   │   │   │   ├── master-256.png
│   │   │   │   │   │   ├── node-.png
│   │   │   │   │   │   ├── node-128.png
│   │   │   │   │   │   └── node-256.png
│   │   │   │   │   └── unlabeled
│   │   │   │   │       ├── control-plane-128.png
│   │   │   │   │       ├── control-plane-256.png
│   │   │   │   │       ├── etcd-.png
│   │   │   │   │       ├── etcd-128.png
│   │   │   │   │       ├── etcd-256.png
│   │   │   │   │       ├── master-128.png
│   │   │   │   │       ├── master-256.png
│   │   │   │   │       ├── node-128.png
│   │   │   │   │       └── node-256.png
│   │   │   │   └── resources
│   │   │   │       ├── labeled
│   │   │   │       │   ├── c-role-128.png
│   │   │   │       │   ├── c-role-256.png
│   │   │   │       │   ├── cm-128.png
│   │   │   │       │   ├── cm-256.png
│   │   │   │       │   ├── crb-128.png
│   │   │   │       │   ├── crb-256.png
│   │   │   │       │   ├── crd-128.png
│   │   │   │       │   ├── crd-256.png
│   │   │   │       │   ├── cronjob-128.png
│   │   │   │       │   ├── cronjob-256.png
│   │   │   │       │   ├── deploy-128.png
│   │   │   │       │   ├── deploy-256.png
│   │   │   │       │   ├── ds-128.png
│   │   │   │       │   ├── ds-256.png
│   │   │   │       │   ├── ep-128.png
│   │   │   │       │   ├── ep-256.png
│   │   │   │       │   ├── group-128.png
│   │   │   │       │   ├── group-256.png
│   │   │   │       │   ├── hpa-128.png
│   │   │   │       │   ├── hpa-256.png
│   │   │   │       │   ├── ing-128.png
│   │   │   │       │   ├── ing-256.png
│   │   │   │       │   ├── job-128.png
│   │   │   │       │   ├── job-256.png
│   │   │   │       │   ├── limits-128.png
│   │   │   │       │   ├── limits-256.png
│   │   │   │       │   ├── netpol-128.png
│   │   │   │       │   ├── netpol-256.png
│   │   │   │       │   ├── ns-128.png
│   │   │   │       │   ├── ns-256.png
│   │   │   │       │   ├── pod-128.png
│   │   │   │       │   ├── pod-256.png
│   │   │   │       │   ├── psp-128.png
│   │   │   │       │   ├── psp-256.png
│   │   │   │       │   ├── pv-128.png
│   │   │   │       │   ├── pv-256.png
│   │   │   │       │   ├── pvc-128.png
│   │   │   │       │   ├── pvc-256.png
│   │   │   │       │   ├── quota-128.png
│   │   │   │       │   ├── quota-256.png
│   │   │   │       │   ├── rb-128.png
│   │   │   │       │   ├── rb-256.png
│   │   │   │       │   ├── role-128.png
│   │   │   │       │   ├── role-256.png
│   │   │   │       │   ├── rs-128.png
│   │   │   │       │   ├── rs-256.png
│   │   │   │       │   ├── sa-128.png
│   │   │   │       │   ├── sa-256.png
│   │   │   │       │   ├── sc-128.png
│   │   │   │       │   ├── sc-256.png
│   │   │   │       │   ├── secret-128.png
│   │   │   │       │   ├── secret-256.png
│   │   │   │       │   ├── sts-128.png
│   │   │   │       │   ├── sts-256.png
│   │   │   │       │   ├── svc-128.png
│   │   │   │       │   ├── svc-256.png
│   │   │   │       │   ├── user-128.png
│   │   │   │       │   ├── user-256.png
│   │   │   │       │   ├── vol-128.png
│   │   │   │       │   └── vol-256.png
│   │   │   │       └── unlabeled
│   │   │   │           ├── c-role-128.png
│   │   │   │           ├── c-role-256.png
│   │   │   │           ├── cm-128.png
│   │   │   │           ├── cm-256.png
│   │   │   │           ├── crb-128.png
│   │   │   │           ├── crb-256.png
│   │   │   │           ├── crd-128.png
│   │   │   │           ├── crd-256.png
│   │   │   │           ├── cronjob-128.png
│   │   │   │           ├── cronjob-256.png
│   │   │   │           ├── deploy-128.png
│   │   │   │           ├── deploy-256.png
│   │   │   │           ├── ds-128.png
│   │   │   │           ├── ds-256.png
│   │   │   │           ├── ep-128.png
│   │   │   │           ├── ep-256.png
│   │   │   │           ├── group-128.png
│   │   │   │           ├── group-256.png
│   │   │   │           ├── hpa-128.png
│   │   │   │           ├── hpa-256.png
│   │   │   │           ├── ing-128.png
│   │   │   │           ├── ing-256.png
│   │   │   │           ├── job-128.png
│   │   │   │           ├── job-256.png
│   │   │   │           ├── limits-128.png
│   │   │   │           ├── limits-256.png
│   │   │   │           ├── netpol-128.png
│   │   │   │           ├── netpol-256.png
│   │   │   │           ├── ns-128.png
│   │   │   │           ├── ns-256.png
│   │   │   │           ├── pod-128.png
│   │   │   │           ├── pod-256.png
│   │   │   │           ├── psp-128.png
│   │   │   │           ├── psp-256.png
│   │   │   │           ├── pv-128.png
│   │   │   │           ├── pv-256.png
│   │   │   │           ├── pvc-128.png
│   │   │   │           ├── pvc-256.png
│   │   │   │           ├── quota-128.png
│   │   │   │           ├── quota-256.png
│   │   │   │           ├── rb-128.png
│   │   │   │           ├── rb-256.png
│   │   │   │           ├── role-128.png
│   │   │   │           ├── role-256.png
│   │   │   │           ├── rs-128.png
│   │   │   │           ├── rs-256.png
│   │   │   │           ├── sa-128.png
│   │   │   │           ├── sa-256.png
│   │   │   │           ├── sc-128.png
│   │   │   │           ├── sc-256.png
│   │   │   │           ├── secret-128.png
│   │   │   │           ├── secret-256.png
│   │   │   │           ├── sts-128.png
│   │   │   │           ├── sts-256.png
│   │   │   │           ├── svc-128.png
│   │   │   │           ├── svc-256.png
│   │   │   │           ├── user-128.png
│   │   │   │           ├── user-256.png
│   │   │   │           ├── vol-128.png
│   │   │   │           └── vol-256.png
│   │   │   └── svg
│   │   │       ├── control_plane_components
│   │   │       │   └── labeled
│   │   │       │       ├── api.svg
│   │   │       │       ├── c-c-m.svg
│   │   │       │       ├── c-m.svg
│   │   │       │       ├── k-proxy.svg
│   │   │       │       ├── kubelet.svg
│   │   │       │       └── sched.svg
│   │   │       ├── infrastructure_components
│   │   │       │   ├── labeled
│   │   │       │   │   ├── control-plane.svg
│   │   │       │   │   ├── etcd.svg
│   │   │       │   │   └── node.svg
│   │   │       │   └── unlabeled
│   │   │       │       ├── control-plane.svg
│   │   │       │       ├── etcd.svg
│   │   │       │       └── node.svg
│   │   │       └── resources
│   │   │           ├── labeled
│   │   │           │   ├── c-role.svg
│   │   │           │   ├── cm.svg
│   │   │           │   ├── crb.svg
│   │   │           │   ├── crd.svg
│   │   │           │   ├── cronjob.svg
│   │   │           │   ├── deploy.svg
│   │   │           │   ├── ds.svg
│   │   │           │   ├── ep.svg
│   │   │           │   ├── group.svg
│   │   │           │   ├── hpa.svg
│   │   │           │   ├── ing.svg
│   │   │           │   ├── job.svg
│   │   │           │   ├── limits.svg
│   │   │           │   ├── netpol.svg
│   │   │           │   ├── ns.svg
│   │   │           │   ├── pod.svg
│   │   │           │   ├── psp.svg
│   │   │           │   ├── pv.svg
│   │   │           │   ├── pvc.svg
│   │   │           │   ├── quota.svg
│   │   │           │   ├── rb.svg
│   │   │           │   ├── role.svg
│   │   │           │   ├── rs.svg
│   │   │           │   ├── sa.svg
│   │   │           │   ├── sc.svg
│   │   │           │   ├── secret.svg
│   │   │           │   ├── sts.svg
│   │   │           │   ├── svc.svg
│   │   │           │   ├── user.svg
│   │   │           │   └── vol.svg
│   │   │           └── unlabeled
│   │   │               ├── c-role.svg
│   │   │               ├── cm.svg
│   │   │               ├── crb.svg
│   │   │               ├── crd.svg
│   │   │               ├── cronjob.svg
│   │   │               ├── deploy.svg
│   │   │               ├── ds.svg
│   │   │               ├── ep.svg
│   │   │               ├── group.svg
│   │   │               ├── hpa.svg
│   │   │               ├── ing.svg
│   │   │               ├── job.svg
│   │   │               ├── limits.svg
│   │   │               ├── netpol.svg
│   │   │               ├── ns.svg
│   │   │               ├── pod.svg
│   │   │               ├── psp.svg
│   │   │               ├── pv.svg
│   │   │               ├── pvc.svg
│   │   │               ├── quota.svg
│   │   │               ├── rb.svg
│   │   │               ├── role.svg
│   │   │               ├── rs.svg
│   │   │               ├── sa.svg
│   │   │               ├── sc.svg
│   │   │               ├── secret.svg
│   │   │               ├── sts.svg
│   │   │               ├── svc.svg
│   │   │               ├── user.svg
│   │   │               └── vol.svg
│   │   ├── lHFWdtVTkMX6AX5G-image-1606740965114.png
│   │   ├── lR3gpWqK5uymZy76-image-1642771373312.png
│   │   ├── lb-serverless-run-ext-https.svg
│   │   ├── light.png
│   │   ├── matomo-internal-ip.png
│   │   ├── mikrotik-ok-cancel-apply.png
│   │   ├── minicom-main-menu.png
│   │   ├── minicom-screen-and-keyboard.png
│   │   ├── minicom-serial-baud.png
│   │   ├── minicom-serial-config-menu.png
│   │   ├── mode-gen-temp.png
│   │   ├── mode-gen.png
│   │   ├── nWVeT4OzIa1ANMPb-image-1621095512411.png
│   │   ├── nzcVoSkDoOg3V3D9-image-1606769464676.png
│   │   ├── open-collapsed-section.webp
│   │   ├── openvpn-as-advanced-vpn.png
│   │   ├── openvpn-dns.png
│   │   ├── openvpn-mikrotik-setup.png
│   │   ├── openvpn-tls.png
│   │   ├── oracle-secret-manager.png
│   │   ├── pipeline.png
│   │   ├── plant-room.JPG
│   │   ├── qemu-ded.png
│   │   ├── qtFenCGbLvRUVQqs-image-1606738550809.png
│   │   ├── rG2Sxc83fg9oyJVi-image-1605010726509.png
│   │   ├── red-cu.png
│   │   ├── rest-windows.png
│   │   ├── revere-do-history.png
│   │   ├── reverse-banner.png
│   │   ├── reverse-createdate.png
│   │   ├── reverse-destroy-instance.png
│   │   ├── reverse-dns.png
│   │   ├── reverse-screen.png
│   │   ├── reverse-sessions.png
│   │   ├── reverse-sitting-in-console.png
│   │   ├── reverse-uptime.png
│   │   ├── s3e11nJc8jbmRYtA-image-1621087752258.png
│   │   ├── sGYTTQzEk4MNllA8-image-1642771319408.png
│   │   ├── simple-network.png
│   │   ├── site-visits-usa.png
│   │   ├── tjxlFRVsXUgsDatm-image-1588972001839.png
│   │   ├── ubiquiti-adoption-failed.png
│   │   ├── water-board-key.JPG
│   │   ├── water-board.JPG
│   │   ├── water-shutoff-valves.JPG
│   │   ├── web_ip-address.png
│   │   ├── web_ip-firewall.png
│   │   ├── web_ip.png
│   │   ├── web_login.png
│   │   ├── web_nat-rules.png
│   │   ├── web_nat.png
│   │   ├── web_to-address-old.png
│   │   ├── web_to-address-updated.png
│   │   ├── winbox_firewall-nat.png
│   │   ├── winbox_ip-address-list.png
│   │   ├── winbox_ip-address.png
│   │   ├── winbox_ip-firewall.png
│   │   ├── winbox_login.png
│   │   ├── winbox_nat-rule.png
│   │   ├── windows-clean-the-drives.png
│   │   ├── x5BORuXlBtctN0Mi-image-1646765189176.png
│   │   ├── xcode-select-tos.png
│   │   ├── xcode-select.png
│   │   ├── xcode.png
│   │   └── xcrun-xcode-select.png
│   ├── automation
│   │   ├── airflow
│   │   │   └── airflow-basics.md
│   │   ├── ansible
│   │   │   ├── basics.md
│   │   │   └── python-install.md
│   │   ├── iac
│   │   │   ├── terraform
│   │   │   │   ├── building-infrastructure.md
│   │   │   │   ├── bulk-delete-terraform-state.md
│   │   │   │   ├── failed-to-get-existing-workspaces-querying-Cloud-Storage-failed-storage-bucket-doesnt-exist.md
│   │   │   │   ├── google-iap.md
│   │   │   │   ├── index.md
│   │   │   │   ├── openstack.md
│   │   │   │   ├── recursive-delete-of-terraform.md
│   │   │   │   ├── remote-data.md
│   │   │   │   ├── terraform-lock-file-update.md
│   │   │   │   ├── terraform-plugin-cannot-locate-module-locally-unknown-reason.md
│   │   │   │   ├── terraform-refresh-takes-ages.md
│   │   │   │   ├── terraform-sleep.md
│   │   │   │   ├── terraform-verbose.md
│   │   │   │   ├── tfupdate.md
│   │   │   │   └── to-string-from-list.md
│   │   │   └── terragrunt
│   │   │       ├── generate-backend-file-for-gcs-with-terragrunt.md
│   │   │       ├── index.md
│   │   │       ├── recursive-delete-of-terragrunt-cache.md
│   │   │       ├── required-plugins-are-not-installed-terragrunt.md
│   │   │       ├── terragrunt-auto-approve.md
│   │   │       ├── terragrunt-generate-block.md
│   │   │       ├── terragrunt-in-github-actions.md
│   │   │       └── terragrunt-terraform-auto-upgrade.md
│   │   └── index.md
│   ├── bookstack.md
│   ├── bread
│   │   ├── 2024-04-18.md
│   │   ├── 2024-05-18.md
│   │   └── index.md
│   ├── car
│   │   ├── index.md
│   │   └── seat
│   │       └── leon
│   │           ├── fix-comfort-close.md
│   │           └── push-start-seat-leon.md
│   ├── certifications
│   │   ├── cka
│   │   │   ├── cka-1.md
│   │   │   ├── cka-list-of-controllers.md
│   │   │   ├── cka-practice-questions-struggled.md
│   │   │   ├── cka-practice-questions.md
│   │   │   ├── index.md
│   │   │   └── useful-cka-kubectl-commands.md
│   │   ├── google-certs
│   │   │   ├── gcp-architect
│   │   │   │   ├── gcp-architect-1.md
│   │   │   │   ├── gcp-architect-2.md
│   │   │   │   ├── gcp-architect-3.md
│   │   │   │   └── gcp-load-balancer.md
│   │   │   ├── gcp-associate
│   │   │   │   ├── compute-engine.md
│   │   │   │   ├── costs.md
│   │   │   │   ├── gce-google-compute-engine.md
│   │   │   │   ├── gcp.md
│   │   │   │   ├── networking-and-lb.md
│   │   │   │   ├── regions-and-zones.md
│   │   │   │   └── vm-bootstrapping-templates-and-images.md
│   │   │   ├── gcp-security
│   │   │   │   ├── 1-the-exam-topic.md
│   │   │   │   └── gcp-security-1.md
│   │   │   └── workspace-admin
│   │   │       ├── managing-gsuit.md
│   │   │       ├── mdm.md
│   │   │       └── user-administration.md
│   │   └── terraform-associate
│   │       └── exam-questions.md
│   ├── cloud
│   │   ├── aws
│   │   │   ├── aws-cli.md
│   │   │   └── cloud-init-sg1.md
│   │   ├── csp
│   │   │   ├── aqua
│   │   │   │   ├── aqua-page-1.md
│   │   │   │   ├── aqua-page-2.md
│   │   │   │   └── partnership-info.md
│   │   │   ├── chronicle
│   │   │   │   └── configure-datadog-vector-push-logs.md
│   │   │   ├── conductorone
│   │   │   │   ├── create-alias-on-entitlement.md
│   │   │   │   ├── get-your-user-id-conductor-one.md
│   │   │   │   └── list-users-in-conductor-one-using-the-api.md
│   │   │   └── rapid7
│   │   │       └── add-google-organization-to-rapid7.md
│   │   ├── digitalocean
│   │   │   └── digitalocean-get-list-of-images.md
│   │   ├── fly
│   │   │   ├── create-new-app.md
│   │   │   ├── deployment-strategy.md
│   │   │   ├── fly-ci.md
│   │   │   ├── fly-docker-auth.md
│   │   │   ├── fly-real-ip.md
│   │   │   ├── fly-regions.md
│   │   │   ├── fly-release-ip-address.md
│   │   │   ├── index.md
│   │   │   └── mkdocs-on-fly.md
│   │   ├── gcp
│   │   │   ├── add-external-user-to-org.md
│   │   │   ├── apis-and-services
│   │   │   │   └── composer-apis.md
│   │   │   ├── authenticate-to-google-artifact-registry.md
│   │   │   ├── authenticate-twine-to-google-artifact-registry.md
│   │   │   ├── curl-gcr-ar.md
│   │   │   ├── curl-to-iap.md
│   │   │   ├── curl-to-url-with-google-auth.md
│   │   │   ├── err-exec-docker-credential-gcloud-executable-file-not-found-in-path.md
│   │   │   ├── export-gcp-dns-zone-to-bind-zone-file.md
│   │   │   ├── export-to-terraform-using-gcloud-cli.md
│   │   │   ├── filter-gcloud-output.md
│   │   │   ├── filter-secrets.md
│   │   │   ├── find-latest-version-of-gke.md
│   │   │   ├── forward-real-ip-to-a-nginx-behind-a-gcp-load-balancer.md
│   │   │   ├── gcloud-disable-dependent-services.md
│   │   │   ├── gcloud-disable-services.md
│   │   │   ├── gcurl.md
│   │   │   ├── get-dnssec-keys-for-google-cloud-dns.md
│   │   │   ├── get-email-from-numerical-user-id.md
│   │   │   ├── get-gcs-bucket-iam-members-api.md
│   │   │   ├── get-project-name-of-gcs-bucket.md
│   │   │   ├── get-secret-from-docker-credential-gcloud-cli.md
│   │   │   ├── google-cloud-security-day.md
│   │   │   ├── grafeas.md
│   │   │   ├── iap-url.md
│   │   │   ├── list-all-service-account-keys.md
│   │   │   ├── list-secrets-being-accessed-google-cloud-logging.md
│   │   │   ├── metadata-api
│   │   │   │   ├── get-project-id-using-metadata-endpoint.md
│   │   │   │   ├── get-service-account-token-using-metadata-endpoint.md
│   │   │   │   ├── get-service-account-using-metadata-endpoint.md
│   │   │   │   ├── index.md
│   │   │   │   └── view-startup-script-on-google-compute-engine-using-metadata-endpoint.md
│   │   │   ├── print-secret-gcloud.md
│   │   │   ├── projects-resources-iam-users-roles-permissions-apis-and-cloud-shell.md
│   │   │   ├── re-run-startup-script-google-compute-engine.md
│   │   │   ├── remove-the-lien-to-allow-deletion.md
│   │   │   ├── serverless-vpc-access-for-cloudrun-across-projects.md
│   │   │   ├── show-bq-table-schema.md
│   │   │   ├── ssh-iap.md
│   │   │   ├── sshuttle-using-google-iap.md
│   │   │   ├── useful-gcloud-commands.md
│   │   │   ├── useful-log-queries.md
│   │   │   ├── view-hash-of-object-in-gcs.md
│   │   │   └── view-logs-on-who-enabled-an-api.md
│   │   └── secret-manager-comparison.md
│   ├── favicon.ico
│   ├── favicon.png
│   ├── home
│   │   ├── index.md
│   │   └── rg
│   │       ├── cu
│   │       │   └── consumer-unit.md
│   │       ├── index.md
│   │       ├── oven
│   │       │   └── oven.md
│   │       ├── utilities
│   │       │   ├── electricity.md
│   │       │   ├── index.md
│   │       │   └── water.md
│   │       ├── washing
│   │       │   └── washing-machine.md
│   │       └── water-heater
│   │           └── reduce-temperature.md
│   ├── index.md
│   ├── kb
│   │   ├── authentication
│   │   │   └── fingerprint-on-linux-mint.md
│   │   ├── cloud-init
│   │   │   └── cloud-init.md
│   │   ├── cloudflare
│   │   │   └── cloudflare-zero-forwarded-header.md
│   │   ├── cloudflared
│   │   │   ├── cloudflared-on-ubuntu-for-ssh.md
│   │   │   └── index.md
│   │   ├── copybara
│   │   │   └── installing-copybara.md
│   │   ├── dependabot
│   │   │   └── ignore-terraform-module-version-dependabot.md
│   │   ├── disk-management
│   │   │   ├── dell-hdd-password-protected.md
│   │   │   ├── expanding-a-filesystem.md
│   │   │   ├── formatting-drive-automount.md
│   │   │   ├── gpt-pmbr-size-mismatch-will-be-corrected-by-write.md
│   │   │   └── mount-a-new-drive.md
│   │   ├── docker
│   │   │   ├── basics-of-docker.md
│   │   │   ├── bulk-retag.md
│   │   │   ├── copy-containers-between-repos.md
│   │   │   ├── docker-architecture.md
│   │   │   ├── docker-copy.md
│   │   │   ├── docker-intro-and-notes.md
│   │   │   ├── docker-logs.md
│   │   │   ├── exporting-and-importing.md
│   │   │   ├── installing-docker.md
│   │   │   └── installing-jellyfin.md
│   │   ├── drone
│   │   │   ├── index.md
│   │   │   ├── laws.md
│   │   │   └── stock-image-marketplaces.md
│   │   ├── git
│   │   │   ├── amend-commit-message.md
│   │   │   ├── count-lines-of-code-in-repo.md
│   │   │   ├── create-and-push-tags.md
│   │   │   ├── git-with-different-ssh-keys.md
│   │   │   ├── migrate-repo-to-mono-repo.md
│   │   │   ├── rename-local-git-branch.md
│   │   │   └── set-git-user-per-repo.md
│   │   ├── github
│   │   │   ├── collapsed-sections-github.md
│   │   │   ├── find-date-a-repo-was-created-on-github.md
│   │   │   └── import-github-organization-users-in-to-terraform.md
│   │   ├── githubactions
│   │   │   ├── access-file-between-steps.md
│   │   │   ├── authenticate-github-actions-to-gcp-using-workload-identity-federation.md
│   │   │   ├── authenticate-github-actions-to-google-artifact-registry.md
│   │   │   ├── delete-old-runs-of-deleted-github-actions.md
│   │   │   ├── trigger-manual-action.md
│   │   │   ├── upload-file.md
│   │   │   └── view-jwt-claim-github-actions.md
│   │   ├── google-workspace
│   │   │   └── setup-routing.md
│   │   ├── grocy
│   │   │   ├── set-grocy-to-use-cloudflare-username.md
│   │   │   └── set-grocy-to-use-pritunl-username.md
│   │   ├── juniper
│   │   │   ├── juniper-router-selection.md
│   │   │   └── junos-useful-commands.md
│   │   ├── linux-cli
│   │   │   ├── always-restart-service-after-failure-systemd.md
│   │   │   ├── backup-sqlite-db.md
│   │   │   ├── blc.md
│   │   │   ├── bulk-change-file-extension.md
│   │   │   ├── fingerprint-for-sudo-mac.md
│   │   │   ├── generate-random-token.md
│   │   │   ├── get-current-folder.md
│   │   │   ├── get-dell-service-tag-ubuntu.md
│   │   │   ├── how-to-create-tar-gz-file.md
│   │   │   ├── list-nfs-shares-exported.md
│   │   │   ├── lowercase-to-uppercase.md
│   │   │   ├── remove-new-lines-from-file.md
│   │   │   ├── the-following-signatures-couldnt-be-verified-because-the-public-key-is-not-available.md
│   │   │   ├── uppercase-to-lowercase.md
│   │   │   ├── uuidgen-lowercase.md
│   │   │   ├── xcrun-error-invalid-active-developer-path.md
│   │   │   └── your-xcode-is-too-outdated.md
│   │   ├── linux-networking
│   │   │   ├── bringing-up-interfaces.md
│   │   │   ├── centos-iptables.md
│   │   │   ├── connections-on-a-port.md
│   │   │   ├── dns-on-ubuntu.md
│   │   │   ├── list-of-unique-ips.md
│   │   │   ├── listen-on-a-port.md
│   │   │   ├── netplan-2-interfaces.md
│   │   │   ├── netplan-static-ip.md
│   │   │   ├── nmap-scans.md
│   │   │   ├── null-routing.md
│   │   │   ├── rvc-ip-range.md
│   │   │   └── uninstall-netplan.md
│   │   ├── mac
│   │   │   ├── bose-headphones-crackle.md
│   │   │   └── connect-to-serial-port-on-mac.md
│   │   ├── markdown
│   │   │   ├── built-by-badge.md
│   │   │   ├── custom-badges.md
│   │   │   ├── escape-codeblock.md
│   │   │   ├── how-to-use-git.md
│   │   │   ├── lychee-link-checker.md
│   │   │   └── note-warning-in-markdown.md
│   │   ├── matomo
│   │   │   └── matomo-behind-cloudflare.md
│   │   ├── minio
│   │   │   ├── creating-minio-users-and-assigning-permissions.md
│   │   │   ├── minio-over-s3fs.md
│   │   │   └── old.md
│   │   ├── networking
│   │   │   ├── ee-update-dns.md
│   │   │   ├── show-broadband-password-ee.md
│   │   │   ├── update-route-ip-mikrotik.md
│   │   │   └── vpn-network-routing-mikrotik.md
│   │   ├── nginx
│   │   │   ├── custom-headers.md
│   │   │   ├── get-real-ip-cloudflare.md
│   │   │   ├── nginx-extras.md
│   │   │   ├── nginx-redirects-to-the-first-alphabetical-site-when-not-found-in-config.md
│   │   │   ├── nginxservice-failed-because-the-control-process-exited.md
│   │   │   ├── remove-server-headers.md
│   │   │   └── reverse-web-proxy.md
│   │   ├── openvpn
│   │   │   ├── install-openvpn-as.md
│   │   │   └── mikrotik-to-openvpn.md
│   │   ├── php
│   │   │   ├── install-php.md
│   │   │   ├── password-strength-unknown.md
│   │   │   └── wordpress-permissions.md
│   │   ├── pip
│   │   │   └── skipping-package-due-to-invalid-metadata-entry.md
│   │   ├── podman
│   │   │   ├── authenticate-podman-to-ghcr.md
│   │   │   ├── authenticate-podman-to-google-artifact-registry.md
│   │   │   ├── docker-credential-desktop-not-installed.md
│   │   │   ├── index.md
│   │   │   ├── podmain-google-artifact-registry-mirror.md
│   │   │   ├── podman-mount-directories-mac.md
│   │   │   └── podman-using-lima.md
│   │   ├── pritunl
│   │   │   ├── pritunl-forwarded-header.md
│   │   │   └── ssh-using-pritunl-bastion.md
│   │   ├── public-web-facing
│   │   │   ├── bookstack.md
│   │   │   ├── cachet.md
│   │   │   ├── certbot.md
│   │   │   ├── check-passbolt-is-healthy.md
│   │   │   ├── downloading-the-breadnet-site-and-serving-a-stale-copy.md
│   │   │   ├── jellyfin-using-s3-and-docker.md
│   │   │   ├── reverse.md
│   │   │   ├── send-test-email-on-passbolt.md
│   │   │   ├── wildcard-certificates.md
│   │   │   └── wp-cli-password.md
│   │   ├── sqlite
│   │   │   ├── export-table.md
│   │   │   └── import-table.md
│   │   ├── ssh
│   │   │   ├── generate-ssh-keys.md
│   │   │   ├── import-public-keys-for-ssh-hosts.md
│   │   │   ├── importing-ssh-keys-from-github.md
│   │   │   ├── no-matching-host-key-type-found-their-offer-ssh-dss.md
│   │   │   ├── ssh-client-setup-using-keys.md
│   │   │   ├── ssh-port-redirection.md
│   │   │   ├── sshuttle.md
│   │   │   └── weird-bash.md
│   │   ├── ubiquiti
│   │   │   ├── unifi-device-stuck-in-adoption-failed.md
│   │   │   └── update-tough-switch.md
│   │   ├── wasabi
│   │   │   ├── policies.md
│   │   │   └── transport-endpoint-is-not-connected.md
│   │   └── windows
│   │       └── reset-windows-to-factory-defaults-and-erase-all-data.md
│   ├── kubernetes
│   │   ├── eso
│   │   │   └── trigger-refresh.md
│   │   ├── flux
│   │   │   ├── flux-artifact-registry-google-auth.md
│   │   │   ├── flux-lookup-no-such-host.md
│   │   │   ├── flux-reconcile.md
│   │   │   └── flux-reconciliation-failed-install-retries-exhausted.md
│   │   ├── gke
│   │   │   ├── configure-firewall-for-service-type-loadbalancer-in-gke.md
│   │   │   ├── configure-gke-workload-identity.md
│   │   │   ├── cordon-and-drain-gke-pool.md
│   │   │   ├── index.md
│   │   │   ├── service-account-with-workload-id.md
│   │   │   ├── set-static-ip-on-service-loadbalancer.md
│   │   │   └── workload-id-test.md
│   │   ├── helm
│   │   │   ├── create-helm-chart.md
│   │   │   ├── force-rollout-on-configmap-update.md
│   │   │   ├── helm-loop-through-key-value-pairs.md
│   │   │   ├── helm-repo-gcs.md
│   │   │   └── push-chart-to-ar.md
│   │   ├── index.md
│   │   ├── k3s
│   │   │   ├── cloudflare-tunnels-on-k3s.md
│   │   │   ├── disable-klipper.md
│   │   │   ├── index.md
│   │   │   ├── installing-k3s.md
│   │   │   ├── k3s-private-registry-using-google-artifact-registry.md
│   │   │   ├── lenovo-sff-ubuntu.md
│   │   │   ├── nfs-pvc-cluster-storageclass-k3s.md
│   │   │   ├── oidc-azure-ad.md
│   │   │   └── things-taking-too-long-to-delete.md
│   │   ├── kb
│   │   │   ├── connect-to-container-that-has-sidecars.md
│   │   │   ├── convert-docker-compose-to-kubernetes-manifests.md
│   │   │   ├── delete-crd-matching-name.md
│   │   │   ├── delete-terminating-namespace.md
│   │   │   ├── deleting-not-running-pods.md
│   │   │   ├── downward-api.md
│   │   │   ├── force-delete-pod.md
│   │   │   ├── index.md
│   │   │   ├── kubectl-commands.md
│   │   │   ├── kubectl-get-pods-and-nodes.md
│   │   │   ├── kubectl-get-service-accounts-namespaces.md
│   │   │   ├── kubectl-set-namespace.md
│   │   │   ├── rbac-testing.md
│   │   │   ├── sleeper.md
│   │   │   ├── trigger-kubernetes-cron-job-manually.md
│   │   │   └── using-argocd-image-updater-with-google-artifact-registry.md
│   │   ├── kind
│   │   │   └── load-image-in-to-kind.md
│   │   ├── kubeconform
│   │   │   ├── kube-conform-google-managed-prometheus.md
│   │   │   ├── kubeconform-flux.md
│   │   │   └── kubeconform.md
│   │   └── nginx-ingress
│   │       └── nginx-ingress-with-cloudflare-origin-server-ssl-tls.md
│   ├── mkdocs
│   │   ├── add-review-date-to-page.md
│   │   ├── expired-page-example.md
│   │   ├── index.md
│   │   ├── mark-page-as-outdated.md
│   │   └── outdated-page-example.md
│   ├── not-found.md
│   ├── outage
│   │   ├── 2023-10-27-11.md
│   │   ├── 2023-11-26-04.md
│   │   └── index.md
│   ├── robots.txt
│   └── stylesheets
│       └── custom.css
├── mkdocs.yml
├── nginx.conf
├── overrides
│   └── partials
│       ├── content.html
│       └── integrations
│           └── analytics.html
├── prod.toml
├── redirect.conf
├── renovate.json
└── requirments.txt

327 directories, 1156 files
```
