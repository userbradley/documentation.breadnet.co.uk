---
title: Broken link checker
---

## What

Broken links on a site cause issues.

During the migration of `bookstack` to `mkdocs`, there were a LOAD of links that broke

## How

We can use a tool like `blc` to programmatically check for broken links

### Installing

```shell
npm install broken-link-checker -g
```

For more information, see [stevenvachon/broken-link-checker](https://github.com/stevenvachon/broken-link-checker)

### Using

```shell
blc https://bookstack.breadnet.co.uk
```

#### Example output

```text
➜ blc https://bookstack.breadnet.co.uk
Getting links from: https://bookstack.breadnet.co.uk/
├───OK─── https://squidfunk.github.io/mkdocs-material/
├───OK─── https://breadnet.co.uk/favicon.png
├───OK─── https://git-scm.com/
├───OK─── https://documentation.breadnet.co.uk/automation/ansible/basics/
├───OK─── https://documentation.breadnet.co.uk/automation/ansible/python-install/
├───OK─── https://documentation.breadnet.co.uk/automation/airflow/airflow-basics/
├───OK─── https://documentation.breadnet.co.uk/cloud/terraform/building-infrastructure/
├─BROKEN─ https://uk.linkedin.com/in/bradley-stannard (HTTP_999)
├───OK─── https://documentation.breadnet.co.uk/cloud/terraform/openstack/
├───OK─── https://documentation.breadnet.co.uk/cloud/terraform/terraform-plugin-cannot-locate-module-locally-unknown-reason/
├───OK─── https://documentation.breadnet.co.uk/cloud/terraform/google-iap/
├───OK─── https://github.com/userbradley/documentation.breadnet.co.uk
├───OK─── https://documentation.breadnet.co.uk/cloud/terraform/tfupdate/
├───OK─── https://documentation.breadnet.co.uk/cloud/terraform/recursive-delete-of-terraform/
├───OK─── https://documentation.breadnet.co.uk/cloud/terraform/remote-data/
├───OK─── https://documentation.breadnet.co.uk/cloud/gcp/curl-to-iap/
├───OK─── https://documentation.breadnet.co.uk/cloud/gcp/export-to-terraform-using-gcloud-cli/
├───OK─── https://documentation.breadnet.co.uk/cloud/gcp/grafeas/
├───OK─── https://documentation.breadnet.co.uk/cloud/aqua/aqua-page-1/
├───OK─── https://github.com/userbradley/documentation.breadnet.co.uk/edit/dev/docs/index.md
├───OK─── https://documentation.breadnet.co.uk/cloud/aqua/aqua-page-2/
├───OK─── https://documentation.breadnet.co.uk/cloud/aqua/partnership-info/
├───OK─── https://documentation.breadnet.co.uk/certifications/google-certs/gcp-architect/gcp-architect-1/
├───OK─── https://documentation.breadnet.co.uk/certifications/google-certs/gcp-architect/gcp-architect-2/
├───OK─── https://documentation.breadnet.co.uk/certifications/google-certs/gcp-architect/gcp-architect-3/
├───OK─── https://documentation.breadnet.co.uk/certifications/google-certs/gcp-architect/kubectl-commands/
├───OK─── https://documentation.breadnet.co.uk/certifications/google-certs/gcp-architect/gcp-load-balancer/
├───OK─── https://documentation.breadnet.co.uk/certifications/google-certs/gcp-security/1-the-exam-topic/
├───OK─── https://documentation.breadnet.co.uk/certifications/google-certs/gcp-security/gcp-security-1/
├───OK─── https://github.com/userbradley
├───OK─── https://documentation.breadnet.co.uk/certifications/google-certs/workspace-admin/user-administration/
├───OK─── https://documentation.breadnet.co.uk/certifications/google-certs/workspace-admin/managing-gsuit/
├───OK─── https://documentation.breadnet.co.uk/certifications/google-certs/workspace-admin/mdm/
├───OK─── https://documentation.breadnet.co.uk/certifications/google-certs/gcp-associate/regions-and-zones/
├───OK─── https://documentation.breadnet.co.uk/certifications/google-certs/gcp-associate/gcp/
├───OK─── https://documentation.breadnet.co.uk/certifications/google-certs/gcp-associate/gce-google-compute-engine/
├───OK─── https://documentation.breadnet.co.uk/certifications/google-certs/gcp-associate/networking-and-lb/
├───OK─── https://documentation.breadnet.co.uk/certifications/google-certs/gcp-associate/vm-bootstrapping-templates-and-images/
├───OK─── https://documentation.breadnet.co.uk/certifications/google-certs/gcp-associate/costs/
├───OK─── https://documentation.breadnet.co.uk/certifications/google-certs/gcp-associate/compute-engine/
├───OK─── https://documentation.breadnet.co.uk/certifications/cka/cka-1/
├───OK─── https://documentation.breadnet.co.uk/kb/disk-management/expanding-a-filesystem/
├───OK─── https://documentation.breadnet.co.uk/kb/disk-management/formatting-drive-automount/
├───OK─── https://documentation.breadnet.co.uk/kb/disk-management/mount-a-new-drive/
├───OK─── https://documentation.breadnet.co.uk/kb/disk-management/gpt-pmbr-size-mismatch-will-be-corrected-by-write/
├───OK─── https://documentation.breadnet.co.uk/kb/minio/old/
├───OK─── https://documentation.breadnet.co.uk/kb/minio/minio-over-s3fs/
├───OK─── https://documentation.breadnet.co.uk/kb/minio/s3-policies/
├───OK─── https://documentation.breadnet.co.uk/kb/php/install-php/
├───OK─── https://documentation.breadnet.co.uk/kb/php/wordpress-permissions/
├───OK─── https://documentation.breadnet.co.uk/kb/docker/installing-docker/
├───OK─── https://documentation.breadnet.co.uk/kb/docker/basics-of-docker/
├───OK─── https://documentation.breadnet.co.uk/kb/docker/installing-jellyfin/
├───OK─── https://documentation.breadnet.co.uk/kb/docker/docker-intro-and-notes/
├───OK─── https://documentation.breadnet.co.uk/kb/docker/exporting-and-importing/
├───OK─── https://documentation.breadnet.co.uk/kb/docker/docker-architecture/
├───OK─── https://documentation.breadnet.co.uk/kb/docker/bulk-retag/
├───OK─── https://documentation.breadnet.co.uk/kb/google-cloud/projects-resources-iam-users-roles-permissions-apis-and-cloud-shell/
├───OK─── https://documentation.breadnet.co.uk/kb/google-cloud/serverless-vpc-access-for-cloudrun-across-projects/
├───OK─── https://documentation.breadnet.co.uk/kb/google-cloud/api-get-project/
├───OK─── https://documentation.breadnet.co.uk/kb/google-cloud/api-get-sa/
├───OK─── https://documentation.breadnet.co.uk/kb/linux-networking/uninstall-netplan/
├───OK─── https://documentation.breadnet.co.uk/kb/linux-networking/dns-on-ubuntu/
├───OK─── https://documentation.breadnet.co.uk/kb/linux-networking/bringing-up-interfaces/
├───OK─── https://documentation.breadnet.co.uk/kb/linux-networking/netplan-2-interfaces/
├───OK─── https://documentation.breadnet.co.uk/kb/linux-networking/centos-iptables/
├───OK─── https://documentation.breadnet.co.uk/kb/linux-networking/null-routing/
├───OK─── https://documentation.breadnet.co.uk/kb/linux-networking/listen-on-a-port/
├───OK─── https://documentation.breadnet.co.uk/kb/linux-networking/list-of-unique-ips/
├───OK─── https://documentation.breadnet.co.uk/kb/linux-networking/connections-on-a-port/
├───OK─── https://documentation.breadnet.co.uk/kb/linux-networking/rvc-ip-range/
├───OK─── https://documentation.breadnet.co.uk/kb/ssh/ssh-keys/
├───OK─── https://documentation.breadnet.co.uk/kb/ssh/ssh-port-redirection/
├───OK─── https://documentation.breadnet.co.uk/kb/ssh/ssh-client-setup-using-keys/
├───OK─── https://documentation.breadnet.co.uk/kb/ssh/importing-ssh-keys-from-github/
├───OK─── https://documentation.breadnet.co.uk/kb/ssh/weird-bash/
├───OK─── https://documentation.breadnet.co.uk/kb/ssh/sshuttle/
├───OK─── https://documentation.breadnet.co.uk/kb/public-web-facing/cachet/
├───OK─── https://documentation.breadnet.co.uk/kb/public-web-facing/certbot/
├───OK─── https://documentation.breadnet.co.uk/kb/public-web-facing/reverse-web-proxy/
├───OK─── https://documentation.breadnet.co.uk/kb/public-web-facing/bookstack/
├───OK─── https://documentation.breadnet.co.uk/kb/public-web-facing/jellyfin-s3/
├───OK─── https://documentation.breadnet.co.uk/kb/public-web-facing/custom-headers/
├───OK─── https://documentation.breadnet.co.uk/kb/public-web-facing/remove-server-headers/
├───OK─── https://documentation.breadnet.co.uk/kb/public-web-facing/wildcard-certificates/
├───OK─── https://documentation.breadnet.co.uk/kb/public-web-facing/send-test-email-on-passbolt/
├───OK─── https://documentation.breadnet.co.uk/kb/public-web-facing/check-passbolt-is-healthy/
├───OK─── https://documentation.breadnet.co.uk/kb/public-web-facing/installed-applications-reverse/
├───OK─── https://documentation.breadnet.co.uk/kb/public-web-facing/nginxservice-failed-because-the-control-process-exited/
├───OK─── https://documentation.breadnet.co.uk/kb/other/downloading-the-breadnet-site-and-serving-a-stale-copy/
├───OK─── https://documentation.breadnet.co.uk/kb/wasabi/policies/
├───OK─── https://documentation.breadnet.co.uk/kb/wasabi/transport-endpoint-is-not-connected/
├───OK─── https://documentation.breadnet.co.uk/kb/authentication/fingerprint-on-linux-mint/
├───OK─── https://documentation.breadnet.co.uk/kb/aws/cloud-init-sg1/
├───OK─── https://documentation.breadnet.co.uk/kb/aws/aws-cli/
├───OK─── https://documentation.breadnet.co.uk/kb/google-workspace/setup-routing/
├───OK─── https://documentation.breadnet.co.uk/kb/linux-cli/uuidgen-lowercase/
├───OK─── https://documentation.breadnet.co.uk/kb/networking/vpn-network-routing-mikrotik/
├───OK─── https://documentation.breadnet.co.uk/kb/networking/update-tough-switch/
├───OK─── https://documentation.breadnet.co.uk/kb/cloud/cloud-init/
├───OK─── https://documentation.breadnet.co.uk/kb/markdown/github-repos-and-stuff/
├───OK─── https://documentation.breadnet.co.uk/kb/markdown/custom-badges/
├───OK─── https://documentation.breadnet.co.uk/kb/markdown/built-by-badge/
├───OK─── https://documentation.breadnet.co.uk/kb/kubernetes/connect-to-container-that-has-sidecars/
├───OK─── https://documentation.breadnet.co.uk/kb/kubernetes/deleting-not-running-pods/
├───OK─── https://documentation.breadnet.co.uk/kb/kubernetes/kubectl-set-namespace/
├───OK─── https://documentation.breadnet.co.uk/kb/kubernetes/rbac-testing/
├───OK─── https://documentation.breadnet.co.uk/kb/kubernetes/workload-id-test/
├───OK─── https://documentation.breadnet.co.uk/kb/kubernetes/sleeper/
├───OK─── https://documentation.breadnet.co.uk/home/
├───OK─── https://documentation.breadnet.co.uk/home/cu/consumer-unit/
├───OK─── https://documentation.breadnet.co.uk/home/oven/oven/
├───OK─── https://documentation.breadnet.co.uk/home/washing/washing-machine/
├───OK─── https://breadnet.co.uk/
├───OK─── https://bradley.breadnet.co.uk/
├───OK─── https://kubernetes.breadnet.co.uk/
├───OK─── https://documentation.breadnet.co.uk/mkdocs.org/
├───OK─── https://documentation.breadnet.co.uk/assets/pipeline.png
├───OK─── https://documentation.breadnet.co.uk/cdn-cgi/l/email-protection#bccbd9ded1ddcfc8d9cefcdeced9ddd8d2d9c892dfd392c9d7


```