# [breadNET Documentation](https://documentation.breadnet.co.uk)
[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/breadnet/Static%20sites%2FDocumentation?type=cf-2&key=eyJhbGciOiJIUzI1NiJ9.NjA2NDk2ODIzMDk5OTgxZTRjODFmMTNi.5gYRawM6ODqOOVHDq1eDn1cma2Df2_jcXcQ4oAsb9wM)]( https://g.codefresh.io/pipelines/edit/new/builds?id=63332e88189958204cec2b93&pipeline=Documentation&projects=Static%20sites&projectId=6182852a9c76740876ee5660)

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

Site is available at [dev-documentation.breadnet.co.uk](dev-documentation.breadnet.co.uk)

You will know when you're on the development site, as the colors are red!

# File directory

```text.
├── README.md
├── bookstack.sql
├── cd
│   └── codefresh-v1.yml
├── docker-compose.yml
├── docs
│   ├── assets
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
│   │   ├── PSJKUlFwm2Zluoes-image-1651955845728.png
│   │   ├── amex-simpleicons.png
│   │   ├── b7eY4DH3O7l5mvGO-image-1606744736955.png
│   │   ├── data-incident-response-figure-1.png
│   │   ├── e1giSp8BGj8Wx2nH-drawing-1-1620509841.png
│   │   ├── fan.png
│   │   ├── goQwxsbjB33Z1ZN1-image-1606741677022.png
│   │   ├── grilling.png
│   │   ├── h0o4TLba8od6YCyr-image-1606757098863.png
│   │   ├── iPZWBvJp9qJTDbh5-image-1642771101260.png
│   │   ├── iqQ48KLKrC2hNJ1k-image-1606743820345.png
│   │   ├── k74fQlTzbNTCoVmD-image-1642771208110.png
│   │   ├── lHFWdtVTkMX6AX5G-image-1606740965114.png
│   │   ├── lR3gpWqK5uymZy76-image-1642771373312.png
│   │   ├── lb-serverless-run-ext-https.svg
│   │   ├── light.png
│   │   ├── mode-gen-temp.png
│   │   ├── mode-gen.png
│   │   ├── nWVeT4OzIa1ANMPb-image-1621095512411.png
│   │   ├── nzcVoSkDoOg3V3D9-image-1606769464676.png
│   │   ├── pipeline.png
│   │   ├── qtFenCGbLvRUVQqs-image-1606738550809.png
│   │   ├── rG2Sxc83fg9oyJVi-image-1605010726509.png
│   │   ├── red-cu.png
│   │   ├── s3e11nJc8jbmRYtA-image-1621087752258.png
│   │   ├── sGYTTQzEk4MNllA8-image-1642771319408.png
│   │   ├── tjxlFRVsXUgsDatm-image-1588972001839.png
│   │   └── x5BORuXlBtctN0Mi-image-1646765189176.png
│   ├── automation
│   │   ├── airflow
│   │   │   └── airflow-basics.md
│   │   └── ansible
│   │       ├── basics.md
│   │       └── python-install.md
│   ├── bookstack.md
│   ├── certifications
│   │   ├── cka
│   │   │   └── cka-1.md
│   │   └── google-certs
│   │       ├── gcp-architect
│   │       │   ├── gcp-architect-1.md
│   │       │   ├── gcp-architect-2.md
│   │       │   ├── gcp-architect-3.md
│   │       │   ├── gcp-load-balancer.md
│   │       │   └── kubectl-commands.md
│   │       ├── gcp-associate
│   │       │   ├── compute-engine.md
│   │       │   ├── costs.md
│   │       │   ├── gce-google-compute-engine.md
│   │       │   ├── gcp.md
│   │       │   ├── networking-and-lb.md
│   │       │   ├── pages.yml
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
│   │   ├── gcp
│   │   │   ├── curl-to-iap.md
│   │   │   ├── export-to-terraform-using-gcloud-cli.md
│   │   │   └── grafeas.md
│   │   └── terraform
│   │       ├── building-infrastructure.md
│   │       ├── google-iap.md
│   │       ├── openstack.md
│   │       ├── recursive-delete-of-terraform.md
│   │       ├── remote-data.md
│   │       ├── terraform-plugin-cannot-locate-module-locally-unknown-reason.md
│   │       └── tfupdate.md
│   ├── home
│   │   ├── cu
│   │   │   └── consumer-unit.md
│   │   ├── index.md
│   │   ├── oven
│   │   │   └── oven.md
│   │   └── washing
│   │       └── washing-machine.md
│   ├── index.md
│   ├── kb
│   │   ├── authentication
│   │   │   └── fingerprint-on-linux-mint.md
│   │   ├── aws
│   │   │   ├── aws-cli.md
│   │   │   └── cloud-init-sg1.md
│   │   ├── cloud
│   │   │   └── cloud-init.md
│   │   ├── disk-management
│   │   │   ├── expanding-a-filesystem.md
│   │   │   ├── formatting-drive-automount.md
│   │   │   ├── gpt-pmbr-size-mismatch-will-be-corrected-by-write.md
│   │   │   └── mount-a-new-drive.md
│   │   ├── docker
│   │   │   ├── basics-of-docker.md
│   │   │   ├── bulk-retag.md
│   │   │   ├── docker-architecture.md
│   │   │   ├── docker-intro-and-notes.md
│   │   │   ├── exporting-and-importing.md
│   │   │   ├── installing-docker.md
│   │   │   └── installing-jellyfin.md
│   │   ├── google-cloud
│   │   │   ├── projects-resources-iam-users-roles-permissions-apis-and-cloud-shell.md
│   │   │   └── serverless-vpc-access-for-cloudrun-across-projects.md
│   │   ├── google-workspace
│   │   │   └── setup-routing.md
│   │   ├── kubernetes
│   │   │   ├── connect-to-container-that-has-sidecars.md
│   │   │   ├── deleting-not-running-pods.md
│   │   │   └── kubectl-set-namespace.md
│   │   ├── linux-cli
│   │   │   └── uuidgen-lowercase.md
│   │   ├── linux-networking
│   │   │   ├── bringing-up-interfaces.md
│   │   │   ├── centos-iptables.md
│   │   │   ├── connections-on-a-port.md
│   │   │   ├── dns-on-ubuntu.md
│   │   │   ├── list-of-unique-ips.md
│   │   │   ├── listen-on-a-port.md
│   │   │   ├── netplan-2-interfaces.md
│   │   │   ├── null-routing.md
│   │   │   ├── rvc-ip-range.md
│   │   │   └── uninstall-netplan.md
│   │   ├── markdown
│   │   │   ├── built-by-badge.md
│   │   │   ├── custom-badges.md
│   │   │   └── github-repos-and-stuff.md
│   │   ├── minio
│   │   │   ├── minio-over-s3fs.md
│   │   │   ├── old.md
│   │   │   └── s3-policies.md
│   │   ├── networking
│   │   │   ├── update-tough-switch.md
│   │   │   └── vpn-network-routing-mikrotik.md
│   │   ├── other
│   │   │   └── downloading-the-breadnet-site-and-serving-a-stale-copy.md
│   │   ├── php
│   │   │   ├── install-php.md
│   │   │   └── wordpress-permissions.md
│   │   ├── public-web-facing
│   │   │   ├── bookstack.md
│   │   │   ├── cachet.md
│   │   │   ├── certbot.md
│   │   │   ├── check-passbolt-is-healthy.md
│   │   │   ├── custom-headers.md
│   │   │   ├── installed-applications-reverse.md
│   │   │   ├── jellyfin-s3.md
│   │   │   ├── nginxservice-failed-because-the-control-process-exited.md
│   │   │   ├── pages.yml
│   │   │   ├── remove-server-headers.md
│   │   │   ├── reverse-web-proxy.md
│   │   │   ├── send-test-email-on-passbolt.md
│   │   │   └── wildcard-certificates.md
│   │   ├── ssh
│   │   │   ├── importing-ssh-keys-from-github.md
│   │   │   ├── ssh-client-setup-using-keys.md
│   │   │   ├── ssh-keys.md
│   │   │   ├── ssh-port-redirection.md
│   │   │   ├── sshuttle.md
│   │   │   └── weird-bash.md
│   │   └── wasabi
│   │       ├── policies.md
│   │       └── transport-endpoint-is-not-connected.md
│   ├── not-found.md
│   ├── robots.txt
│   └── stylesheets
│       └── custom.css
├── mkdocs.yml
├── overrides
│   └── main.html
└── redirect.conf

42 directories, 155 files

```

