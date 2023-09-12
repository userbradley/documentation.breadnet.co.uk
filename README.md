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
│   │   ├── amex-simpleicons.png
│   │   ├── b7eY4DH3O7l5mvGO-image-1606744736955.png
│   │   ├── cloudflare_status.png
│   │   ├── data-incident-response-figure-1.png
│   │   ├── dev-tools-console.png
│   │   ├── dev-tools-showPassword.png
│   │   ├── docker-ps.png
│   │   ├── e1giSp8BGj8Wx2nH-drawing-1-1620509841.png
│   │   ├── ee-router-advanced.png
│   │   ├── ee-router-boradband.png
│   │   ├── ee-router-system.png
│   │   ├── ee-show-password.png
│   │   ├── fan.png
│   │   ├── gcloud-add-user-viewer.png
│   │   ├── gcloud-grant-access-buttom.png
│   │   ├── gcloud-select-org-project.png
│   │   ├── gcloud-select-org.png
│   │   ├── gh-actions.png
│   │   ├── goQwxsbjB33Z1ZN1-image-1606741677022.png
│   │   ├── grilling.png
│   │   ├── h0o4TLba8od6YCyr-image-1606757098863.png
│   │   ├── harvest-logo.png
│   │   ├── heater_cover.jpeg
│   │   ├── heater_details.png
│   │   ├── heater_thermo.jpeg
│   │   ├── heater_thermo_control.png
│   │   ├── iPZWBvJp9qJTDbh5-image-1642771101260.png
│   │   ├── iqQ48KLKrC2hNJ1k-image-1606743820345.png
│   │   ├── k3s-logo.png
│   │   ├── k74fQlTzbNTCoVmD-image-1642771208110.png
│   │   ├── lHFWdtVTkMX6AX5G-image-1606740965114.png
│   │   ├── lR3gpWqK5uymZy76-image-1642771373312.png
│   │   ├── lb-serverless-run-ext-https.svg
│   │   ├── light.png
│   │   ├── mikrotik-ok-cancel-apply.png
│   │   ├── mode-gen-temp.png
│   │   ├── mode-gen.png
│   │   ├── nWVeT4OzIa1ANMPb-image-1621095512411.png
│   │   ├── nzcVoSkDoOg3V3D9-image-1606769464676.png
│   │   ├── openvpn-as-advanced-vpn.png
│   │   ├── openvpn-dns.png
│   │   ├── openvpn-mikrotik-setup.png
│   │   ├── openvpn-tls.png
│   │   ├── pipeline.png
│   │   ├── plant-room.JPG
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
│   │   ├── site-visits-usa.png
│   │   ├── tjxlFRVsXUgsDatm-image-1588972001839.png
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
│   │   └── iac
│   │       ├── terraform
│   │       │   ├── building-infrastructure.md
│   │       │   ├── bulk-delete-terraform-state.md
│   │       │   ├── failed-to-get-existing-workspaces-querying-Cloud-Storage-failed-storage-bucket-doesnt-exist.md
│   │       │   ├── google-iap.md
│   │       │   ├── openstack.md
│   │       │   ├── recursive-delete-of-terraform.md
│   │       │   ├── remote-data.md
│   │       │   ├── terraform-lock-file-update.md
│   │       │   ├── terraform-plugin-cannot-locate-module-locally-unknown-reason.md
│   │       │   ├── terraform-refresh-takes-ages.md
│   │       │   ├── terraform-sleep.md
│   │       │   ├── terraform-verbose.md
│   │       │   ├── tfupdate.md
│   │       │   └── to-string-from-list.md
│   │       └── terragrunt
│   │           ├── generate-backend-file-for-gcs-with-terragrunt.md
│   │           ├── required-plugins-are-not-installed-terragrunt.md
│   │           ├── terragrunt-generate-block.md
│   │           ├── terragrunt-in-github-actions.md
│   │           └── terragrunt-terraform-auto-upgrade.md
│   ├── bookstack.md
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
│   │   └── google-certs
│   │       ├── gcp-architect
│   │       │   ├── gcp-architect-1.md
│   │       │   ├── gcp-architect-2.md
│   │       │   ├── gcp-architect-3.md
│   │       │   └── gcp-load-balancer.md
│   │       ├── gcp-associate
│   │       │   ├── compute-engine.md
│   │       │   ├── costs.md
│   │       │   ├── gce-google-compute-engine.md
│   │       │   ├── gcp.md
│   │       │   ├── networking-and-lb.md
│   │       │   ├── regions-and-zones.md
│   │       │   └── vm-bootstrapping-templates-and-images.md
│   │       ├── gcp-security
│   │       │   ├── 1-the-exam-topic.md
│   │       │   └── gcp-security-1.md
│   │       └── workspace-admin
│   │           ├── managing-gsuit.md
│   │           ├── mdm.md
│   │           └── user-administration.md
│   ├── cloud
│   │   ├── aqua
│   │   │   ├── aqua-page-1.md
│   │   │   ├── aqua-page-2.md
│   │   │   └── partnership-info.md
│   │   ├── aws
│   │   │   ├── aws-cli.md
│   │   │   └── cloud-init-sg1.md
│   │   ├── digitalocean
│   │   │   └── digitalocean-get-list-of-images.md
│   │   ├── fly
│   │   │   ├── create-new-app.md
│   │   │   ├── deployment-strategy.md
│   │   │   ├── fly-ci.md
│   │   │   ├── fly-docker-auth.md
│   │   │   ├── fly-real-ip.md
│   │   │   ├── fly-regions.md
│   │   │   └── index.md
│   │   └── gcp
│   │       ├── add-external-user-to-org.md
│   │       ├── authenticate-twine-to-google-artifact-registry.md
│   │       ├── curl-gcr-ar.md
│   │       ├── curl-to-iap.md
│   │       ├── curl-to-url-with-google-auth.md
│   │       ├── export-gcp-dns-zone-to-bind-zone-file.md
│   │       ├── export-to-terraform-using-gcloud-cli.md
│   │       ├── filter-gcloud-output.md
│   │       ├── forward-real-ip-to-a-nginx-behind-a-gcp-load-balancer.md
│   │       ├── get-dnssec-keys-for-google-cloud-dns.md
│   │       ├── get-project-name-of-gcs-bucket.md
│   │       ├── grafeas.md
│   │       ├── list-all-service-account-keys.md
│   │       ├── metadata-api
│   │       │   ├── get-project-id-using-metadata-endpoint.md
│   │       │   ├── get-service-account-using-metadata-endpoint.md
│   │       │   ├── index.md
│   │       │   └── view-startup-script-on-google-compute-engine-using-metadata-endpoint.md
│   │       ├── print-secret-gcloud.md
│   │       ├── projects-resources-iam-users-roles-permissions-apis-and-cloud-shell.md
│   │       ├── re-run-startup-script-google-compute-engine.md
│   │       ├── remove-the-lien-to-allow-deletion.md
│   │       ├── serverless-vpc-access-for-cloudrun-across-projects.md
│   │       ├── show-bq-table-schema.md
│   │       ├── ssh-iap.md
│   │       ├── sshuttle-using-google-iap.md
│   │       ├── useful-gcloud-commands.md
│   │       ├── view-hash-of-object-in-gcs.md
│   │       └── view-logs-for-enabled-apis.md
│   ├── favicon.ico
│   ├── favicon.png
│   ├── home
│   │   ├── cu
│   │   │   └── consumer-unit.md
│   │   ├── index.md
│   │   ├── oven
│   │   │   └── oven.md
│   │   ├── utilities
│   │   │   ├── electricity.md
│   │   │   ├── index.md
│   │   │   └── water.md
│   │   ├── washing
│   │   │   └── washing-machine.md
│   │   └── water-heater
│   │       └── reduce-temperature.md
│   ├── index.md
│   ├── kb
│   │   ├── authentication
│   │   │   └── fingerprint-on-linux-mint.md
│   │   ├── cloud-init
│   │   │   └── cloud-init.md
│   │   ├── cloudflared
│   │   │   ├── cloudflared-on-ubuntu-for-ssh.md
│   │   │   └── index.md
│   │   ├── copybara
│   │   │   └── installing-copybara.md
│   │   ├── dependabot
│   │   │   └── ignore-terraform-module-version-dependabot.md
│   │   ├── disk-management
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
│   │   │   ├── count-lines-of-code-in-repo.md
│   │   │   ├── create-and-push-tags.md
│   │   │   ├── git-with-different-ssh-keys.md
│   │   │   ├── migrate-repo-to-mono-repo.md
│   │   │   └── set-git-user-per-repo.md
│   │   ├── githubactions
│   │   │   ├── access-file-between-steps.md
│   │   │   ├── authenticate-github-actions-to-gcp-using-workload-identity-federation.md
│   │   │   ├── authenticate-github-actions-to-google-artifact-registry.md
│   │   │   ├── delete-old-runs-of-deleted-github-actions.md
│   │   │   ├── upload-file.md
│   │   │   └── view-jwt-claim-github-actions.md
│   │   ├── google-workspace
│   │   │   └── setup-routing.md
│   │   ├── grocy
│   │   │   └── set-grocy-to-use-pritunl-username.md
│   │   ├── linux-cli
│   │   │   ├── always-restart-service-after-failure-systemd.md
│   │   │   ├── backup-sqlite-db.md
│   │   │   ├── blc.md
│   │   │   ├── bulk-change-file-extension.md
│   │   │   ├── fingerprint-for-sudo-mac.md
│   │   │   ├── get-current-folder.md
│   │   │   ├── how-to-create-tar-gz-file.md
│   │   │   ├── list-nfs-shares-exported.md
│   │   │   ├── lowercase-to-uppercase.md
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
│   │   │   └── bose-headphones-crackle.md
│   │   ├── markdown
│   │   │   ├── built-by-badge.md
│   │   │   ├── custom-badges.md
│   │   │   ├── how-to-use-git.md
│   │   │   └── note-warning-in-markdown.md
│   │   ├── minio
│   │   │   ├── creating-minio-users-and-assigning-permissions.md
│   │   │   ├── minio-over-s3fs.md
│   │   │   └── old.md
│   │   ├── networking
│   │   │   ├── show-broadband-password-ee.md
│   │   │   ├── update-route-ip-mikrotik.md
│   │   │   ├── update-tough-switch.md
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
│   │   ├── podman
│   │   │   ├── authenticate-podman-to-ghcr.md
│   │   │   ├── docker-credential-desktop-not-installed.md
│   │   │   ├── index.md
│   │   │   ├── podmain-google-artifact-registry-mirror.md
│   │   │   └── podman-mount-directories-mac.md
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
│   │   ├── wasabi
│   │   │   ├── policies.md
│   │   │   └── transport-endpoint-is-not-connected.md
│   │   └── windows
│   │       └── reset-windows-to-factory-defaults-and-erase-all-data.md
│   ├── kubernetes
│   │   ├── gke
│   │   │   ├── configure-gke-workload-identity.md
│   │   │   ├── index.md
│   │   │   ├── service-account-with-workload-id.md
│   │   │   └── workload-id-test.md
│   │   ├── helm
│   │   │   ├── create-helm-chart.md
│   │   │   ├── force-rollout-on-configmap-update.md
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
│   │   │   └── things-taking-too-long-to-delete.md
│   │   └── kb
│   │       ├── connect-to-container-that-has-sidecars.md
│   │       ├── convert-docker-compose-to-kubernetes-manifests.md
│   │       ├── delete-terminating-namespace.md
│   │       ├── deleting-not-running-pods.md
│   │       ├── downward-api.md
│   │       ├── force-delete-pod.md
│   │       ├── index.md
│   │       ├── kubectl-commands-old.md
│   │       ├── kubectl-commands.md
│   │       ├── kubectl-get-pods-and-nodes.md
│   │       ├── kubectl-set-namespace.md
│   │       ├── rbac-testing.md
│   │       ├── sleeper.md
│   │       ├── trigger-kubernetes-cron-job-manually.md
│   │       └── using-argocd-image-updater-with-google-artifact-registry.md
│   ├── mkdocs
│   │   ├── add-review-date-to-page.md
│   │   ├── expired-page-example.md
│   │   ├── index.md
│   │   ├── mark-page-as-outdated.md
│   │   └── outdated-page-example.md
│   ├── not-found.md
│   ├── robots.txt
│   ├── stylesheets
│   │   └── custom.css
│   └── well-known
│       └── security.txt
├── mkdocs.yml
├── nginx.conf
├── overrides
│   └── partials
│       ├── content.html
│       └── integrations
│           └── analytics.html
├── prod.toml
├── redirect.conf
└── styles
    ├── Google
    │   ├── AMPM.yml
    │   ├── Acronyms.yml
    │   ├── Colons.yml
    │   ├── Contractions.yml
    │   ├── DateFormat.yml
    │   ├── Ellipses.yml
    │   ├── EmDash.yml
    │   ├── EnDash.yml
    │   ├── Exclamation.yml
    │   ├── FirstPerson.yml
    │   ├── Gender.yml
    │   ├── GenderBias.yml
    │   ├── HeadingPunctuation.yml
    │   ├── Headings.yml
    │   ├── Latin.yml
    │   ├── LyHyphens.yml
    │   ├── OptionalPlurals.yml
    │   ├── Ordinal.yml
    │   ├── OxfordComma.yml
    │   ├── Parens.yml
    │   ├── Passive.yml
    │   ├── Periods.yml
    │   ├── Quotes.yml
    │   ├── Ranges.yml
    │   ├── Semicolons.yml
    │   ├── Slang.yml
    │   ├── Spacing.yml
    │   ├── Spelling.yml
    │   ├── Units.yml
    │   ├── We.yml
    │   ├── Will.yml
    │   ├── WordList.yml
    │   ├── meta.json
    │   └── vocab.txt
    ├── Joblint
    │   ├── Acronyms.yml
    │   ├── Benefits.yml
    │   ├── Bro.yml
    │   ├── Competitive.yml
    │   ├── Derogatory.yml
    │   ├── DevEnv.yml
    │   ├── DumbTitles.yml
    │   ├── Gendered.yml
    │   ├── Hair.yml
    │   ├── LegacyTech.yml
    │   ├── Meritocracy.yml
    │   ├── Profanity.yml
    │   ├── README.md
    │   ├── Reassure.yml
    │   ├── Sexualised.yml
    │   ├── Starter.yml
    │   ├── TechTerms.yml
    │   ├── Visionary.yml
    │   └── meta.json
    ├── alex
    │   ├── Ablist.yml
    │   ├── Condescending.yml
    │   ├── Gendered.yml
    │   ├── LGBTQ.yml
    │   ├── Press.yml
    │   ├── ProfanityLikely.yml
    │   ├── ProfanityMaybe.yml
    │   ├── ProfanityUnlikely.yml
    │   ├── README.md
    │   ├── Race.yml
    │   ├── Suicide.yml
    │   └── meta.json
    ├── proselint
    │   ├── Airlinese.yml
    │   ├── AnimalLabels.yml
    │   ├── Annotations.yml
    │   ├── Apologizing.yml
    │   ├── Archaisms.yml
    │   ├── But.yml
    │   ├── Cliches.yml
    │   ├── CorporateSpeak.yml
    │   ├── Currency.yml
    │   ├── Cursing.yml
    │   ├── DateCase.yml
    │   ├── DateMidnight.yml
    │   ├── DateRedundancy.yml
    │   ├── DateSpacing.yml
    │   ├── DenizenLabels.yml
    │   ├── Diacritical.yml
    │   ├── GenderBias.yml
    │   ├── GroupTerms.yml
    │   ├── Hedging.yml
    │   ├── Hyperbole.yml
    │   ├── Jargon.yml
    │   ├── LGBTOffensive.yml
    │   ├── LGBTTerms.yml
    │   ├── Malapropisms.yml
    │   ├── Needless.yml
    │   ├── Nonwords.yml
    │   ├── Oxymorons.yml
    │   ├── P-Value.yml
    │   ├── RASSyndrome.yml
    │   ├── README.md
    │   ├── Skunked.yml
    │   ├── Spelling.yml
    │   ├── Typography.yml
    │   ├── Uncomparables.yml
    │   ├── Very.yml
    │   └── meta.json
    └── write-good
        ├── Cliches.yml
        ├── E-Prime.yml
        ├── Illusions.yml
        ├── Passive.yml
        ├── README.md
        ├── So.yml
        ├── ThereIs.yml
        ├── TooWordy.yml
        ├── Weasel.yml
        └── meta.json

78 directories, 490 files

```
