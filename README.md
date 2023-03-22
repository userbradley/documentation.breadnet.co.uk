# [breadNET Documentation](https://documentation.breadnet.co.uk)
[![Dev](https://github.com/userbradley/documentation.breadnet.co.uk/actions/workflows/dev.yaml/badge.svg)](https://github.com/userbradley/documentation.breadnet.co.uk/actions/workflows/dev.yaml) [![Production](https://github.com/userbradley/documentation.breadnet.co.uk/actions/workflows/prod.yaml/badge.svg)](https://github.com/userbradley/documentation.breadnet.co.uk/actions/workflows/prod.yaml)
[![wakatime](https://wakatime.com/badge/user/befd4d51-df71-4caa-90ba-09a83c0524b0/project/fa7f3e73-d976-48d9-94f5-a17bd1bb4614.svg)](https://wakatime.com/badge/user/befd4d51-df71-4caa-90ba-09a83c0524b0/project/fa7f3e73-d976-48d9-94f5-a17bd1bb4614)

This repo houses all the public documentation that I have created over the years, recently migrated to mkdocs

## Why `mkdocs`

I have decided to go with `mkdocs` as it has a really easy to use admin interface.

That was a joke. The real reason is the lack of admin interface. It reduces the attack vector and also means that I can
edit the files anywhere I have access to git.

I hardly find my self editing files away from home, so I'm not too stressed.

## Why Migrate

As mentioned, I am fed-up with Bookstack and administering it.

I love Bookstack. 100% - But the issue is I have outgrown the need to have a full-fledged CMS with user permissions etc.

I think this is just me getting more mature and resizing that a full CMS is not needed.

## Where it's now hosted

At the moment [Documentation](https://documentation.breadnet.co.uk) is hosted
on [Fly.io](https://fly.io) 



# Contribute

I encourage people to contribute to this. 

You can do so by making a fork of this to your own account, making the changes and then open a PR in to DEV.

Ensure you have [direnv](https://direnv.net) installed.

Once `direnv` in installed, run `direnv allow .`

Finally, `mkdocs serve`

You will notice that the page layout, specifically navigation is different. This is intentional. It helps between reloads

# Uptime 

My Bookstack site will not remain active once the migration is complete.

All pages that are migrated will redirect to their new home.

Once the migration is complete, `bookstack.breadnet.co.uk` will redirect to `documentation.breadnet.co.uk`

# Migration plan

The below has the assumption that the new mkdocs project is created, and there is a staging site

1. Export list of slugs from bookstack (sql)
2. Export HTML of each page (sql)
3. `HTML` to `markdown`
4. Create pages
5. Create navigation

# Branches

## master

This branch houses the live site, available at [documentation.breadnet.co.uk](https://documentation.breadnet.co.uk)

The site is only built on PR merge to master

## dev

This branch houses the development site, which is built on each commit to `dev`

Site is available at [dev-documentation.breadnet.co.uk](https://dev-documentation.breadnet.co.uk)

You will know when you're on the development site, as the colors are red!



# File directory

```text
.
├── CODEOWNERS
├── Dockerfile
├── LICENSE
├── README.md
├── SECURITY.md
├── Taskfile.yml
├── cd
│   └── codefresh.yml
├── cloudflare.conf
├── deny.conf
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
│   │   ├── e1giSp8BGj8Wx2nH-drawing-1-1620509841.png
│   │   ├── fan.png
│   │   ├── goQwxsbjB33Z1ZN1-image-1606741677022.png
│   │   ├── grilling.png
│   │   ├── h0o4TLba8od6YCyr-image-1606757098863.png
│   │   ├── heater_cover.jpeg
│   │   ├── heater_details.png
│   │   ├── heater_thermo.jpeg
│   │   ├── heater_thermo_control.png
│   │   ├── iPZWBvJp9qJTDbh5-image-1642771101260.png
│   │   ├── iqQ48KLKrC2hNJ1k-image-1606743820345.png
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
│   │   ├── pipeline.png
│   │   ├── plant-room.JPG
│   │   ├── qtFenCGbLvRUVQqs-image-1606738550809.png
│   │   ├── rG2Sxc83fg9oyJVi-image-1605010726509.png
│   │   ├── red-cu.png
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
│   │   ├── x5BORuXlBtctN0Mi-image-1646765189176.png
│   │   ├── xcode-select-tos.png
│   │   ├── xcode-select.png
│   │   ├── xcode.png
│   │   └── xcrun-xcode-select.png
│   ├── automation
│   │   ├── airflow
│   │   │   └── airflow-basics.md
│   │   └── ansible
│   │       ├── basics.md
│   │       └── python-install.md
│   ├── bookstack.md
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
│   │   ├── gcp
│   │   │   ├── api-get-project.md
│   │   │   ├── api-get-sa.md
│   │   │   ├── curl-gcr-ar.md
│   │   │   ├── curl-to-iap.md
│   │   │   ├── export-to-terraform-using-gcloud-cli.md
│   │   │   ├── filter-gcloud-output.md
│   │   │   ├── forward-real-ip-to-a-nginx-behind-a-gcp-load-balancer.md
│   │   │   ├── get-project-name-of-gcs-bucket.md
│   │   │   ├── grafeas.md
│   │   │   ├── projects-resources-iam-users-roles-permissions-apis-and-cloud-shell.md
│   │   │   ├── serverless-vpc-access-for-cloudrun-across-projects.md
│   │   │   ├── ssh-iap.md
│   │   │   ├── sshuttle-using-google-iap.md
│   │   │   ├── useful-gcloud-commands.md
│   │   │   └── view-hash-of-object-in-gcs.md
│   │   └── terraform
│   │       ├── building-infrastructure.md
│   │       ├── bulk-delete-terraform-state.md
│   │       ├── failed-to-get-existing-workspaces-querying-Cloud-Storage-failed-storage-bucket-doesnt-exist.md
│   │       ├── google-iap.md
│   │       ├── openstack.md
│   │       ├── recursive-delete-of-terraform.md
│   │       ├── remote-data.md
│   │       ├── terraform-lock-file-update.md
│   │       ├── terraform-plugin-cannot-locate-module-locally-unknown-reason.md
│   │       ├── tfupdate.md
│   │       └── to-string-from-list.md
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
│   │   ├── codefresh
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
│   │   │   ├── docker-intro-and-notes.md
│   │   │   ├── exporting-and-importing.md
│   │   │   ├── installing-docker.md
│   │   │   └── installing-jellyfin.md
│   │   ├── drone
│   │   │   ├── index.md
│   │   │   ├── laws.md
│   │   │   └── stock-image-marketplaces.md
│   │   ├── git
│   │   │   ├── count-lines-of-code-in-repo.md
│   │   │   ├── git-with-different-ssh-keys.md
│   │   │   ├── migrate-repo-to-mono-repo.md
│   │   │   └── set-git-user-per-repo.md
│   │   ├── githubactions
│   │   │   ├── access-file-between-steps.md
│   │   │   ├── auth-to-gar.md
│   │   │   └── upload-file.md
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
│   │   │   ├── github-repos-and-stuff.md
│   │   │   └── note-warning-in-markdown.md
│   │   ├── minio
│   │   │   ├── minio-over-s3fs.md
│   │   │   ├── old.md
│   │   │   └── s3-policies.md
│   │   ├── networking
│   │   │   ├── update-route-ip-mikrotik.md
│   │   │   ├── update-tough-switch.md
│   │   │   └── vpn-network-routing-mikrotik.md
│   │   ├── nginx
│   │   │   ├── custom-headers.md
│   │   │   ├── nginx-redirects-to-the-first-alphabetical-site-when-not-found-in-config.md
│   │   │   ├── nginxservice-failed-because-the-control-process-exited.md
│   │   │   ├── remove-server-headers.md
│   │   │   └── reverse-web-proxy.md
│   │   ├── openvpn
│   │   │   ├── img.png
│   │   │   ├── img_1.png
│   │   │   ├── img_2.png
│   │   │   ├── img_3.png
│   │   │   ├── index.md
│   │   │   └── mikrotik-to-openvpn.md
│   │   ├── php
│   │   │   ├── install-php.md
│   │   │   └── wordpress-permissions.md
│   │   ├── pritunl
│   │   │   └── pritunl-forwarded-header.md
│   │   ├── public-web-facing
│   │   │   ├── bookstack.md
│   │   │   ├── cachet.md
│   │   │   ├── certbot.md
│   │   │   ├── check-passbolt-is-healthy.md
│   │   │   ├── downloading-the-breadnet-site-and-serving-a-stale-copy.md
│   │   │   ├── jellyfin-s3.md
│   │   │   ├── send-test-email-on-passbolt.md
│   │   │   ├── wildcard-certificates.md
│   │   │   └── wp-cli-password.md
│   │   ├── sqlite
│   │   │   ├── export-table.md
│   │   │   └── import-table.md
│   │   ├── ssh
│   │   │   ├── generate-ssh-keys.md
│   │   │   ├── importing-ssh-keys-from-github.md
│   │   │   ├── ssh-client-setup-using-keys.md
│   │   │   ├── ssh-port-redirection.md
│   │   │   ├── sshuttle.md
│   │   │   └── weird-bash.md
│   │   └── wasabi
│   │       ├── policies.md
│   │       └── transport-endpoint-is-not-connected.md
│   ├── kubernetes
│   │   ├── gke
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
│   │       ├── delete-terminating-namespace.md
│   │       ├── deleting-not-running-pods.md
│   │       ├── downward-api.md
│   │       ├── index.md
│   │       ├── kubectl-commands-old.md
│   │       ├── kubectl-commands.md
│   │       ├── kubectl-set-namespace.md
│   │       ├── rbac-testing.md
│   │       ├── sleeper.md
│   │       └── using-argocd-image-updater-with-google-artifact-registry.md
│   ├── not-found.md
│   ├── robots.txt
│   ├── stylesheets
│   │   └── custom.css
│   └── well-known
│       └── security.txt
├── mkdocs.yml
├── nginx.conf
├── overrides-dev
│   └── main.html
├── overrides-prod
│   └── main.html
├── prod.toml
└── redirect.conf

61 directories, 291 files


```
