---
title: Export to terraform using gcloud cli
---

## Get list of resources you can export

```shell
gcloud beta resource-config list-resource-types
```

??? note "Example output"

    ```
    ┌──────────────────────────────────────┬──────────────┬─────────┬──────┐
    │               KRM KIND               │ BULK EXPORT? │ EXPORT? │ IAM? │
    ├──────────────────────────────────────┼──────────────┼─────────┼──────┤
    │ AccessContextManagerAccessLevel      │              │         │      │
    │ AccessContextManagerAccessPolicy     │              │         │ x    │
    │ AccessContextManagerServicePerimeter │              │         │      │
    │ ArtifactRegistryRepository           │ x            │ x       │ x    │
    │ BigQueryDataset                      │ x            │ x       │      │
    │ BigQueryJob                          │              │ x       │      │
    │ BigQueryTable                        │ x            │ x       │ x    │
    │ BigtableAppProfile                   │ x            │ x       │      │
    │ BigtableGCPolicy                     │              │         │      │
    │ BigtableInstance                     │ x            │ x       │ x    │
    │ BigtableTable                        │ x            │ x       │ x    │
    │ CloudBuildTrigger                    │              │         │      │
    │ CloudIdentityGroup                   │              │         │      │
    │ ComputeAddress                       │ x            │ x       │      │
    │ ComputeAddress                       │ x            │ x       │      │
    │ ComputeBackendBucket                 │ x            │ x       │ x    │
    │ ComputeBackendService                │ x            │ x       │      │
    │ ComputeBackendService                │ x            │ x       │      │
    │ ComputeDisk                          │ x            │ x       │ x    │
    │ ComputeDisk                          │ x            │ x       │ x    │
    │ ComputeExternalVPNGateway            │ x            │ x       │      │
    │ ComputeFirewall                      │ x            │ x       │      │
    │ ComputeForwardingRule                │ x            │ x       │      │
    │ ComputeForwardingRule                │ x            │ x       │      │
    │ ComputeHTTPHealthCheck               │ x            │ x       │      │
    │ ComputeHTTPSHealthCheck              │ x            │ x       │      │
    │ ComputeHealthCheck                   │ x            │ x       │      │
    │ ComputeHealthCheck                   │ x            │ x       │      │
    │ ComputeImage                         │ x            │ x       │ x    │
    │ ComputeInstance                      │ x            │ x       │ x    │
    │ ComputeInstance                      │ x            │         │ x    │
    │ ComputeInstanceGroup                 │ x            │ x       │      │
    │ ComputeInstanceTemplate              │ x            │ x       │      │
    │ ComputeInterconnectAttachment        │ x            │ x       │      │
    │ ComputeNetwork                       │ x            │ x       │      │
    │ ComputeNetworkEndpointGroup          │ x            │ x       │      │
    │ ComputeNetworkPeering                │              │         │      │
    │ ComputeNodeGroup                     │ x            │ x       │      │
    │ ComputeNodeTemplate                  │ x            │ x       │      │
    │ ComputeProjectMetadata               │              │         │      │
    │ ComputeRegionNetworkEndpointGroup    │              │         │      │
    │ ComputeReservation                   │ x            │ x       │      │
    │ ComputeResourcePolicy                │ x            │ x       │      │
    │ ComputeRoute                         │ x            │ x       │      │
    │ ComputeRouter                        │ x            │ x       │      │
    │ ComputeRouterInterface               │              │         │      │
    │ ComputeRouterNAT                     │              │         │      │
    │ ComputeRouterPeer                    │              │         │      │
    │ ComputeSSLCertificate                │ x            │ x       │      │
    │ ComputeSSLCertificate                │ x            │ x       │      │
    │ ComputeSSLPolicy                     │ x            │ x       │      │
    │ ComputeSecurityPolicy                │ x            │ x       │      │
    │ ComputeSharedVPCHostProject          │              │         │      │
    │ ComputeSharedVPCServiceProject       │              │         │      │
    │ ComputeSnapshot                      │ x            │ x       │ x    │
    │ ComputeSubnetwork                    │ x            │ x       │ x    │
    │ ComputeTargetGRPCProxy               │              │ x       │      │
    │ ComputeTargetHTTPProxy               │ x            │ x       │      │
    │ ComputeTargetHTTPProxy               │ x            │ x       │      │
    │ ComputeTargetHTTPSProxy              │ x            │ x       │      │
    │ ComputeTargetHTTPSProxy              │ x            │ x       │      │
    │ ComputeTargetInstance                │ x            │ x       │      │
    │ ComputeTargetPool                    │ x            │ x       │      │
    │ ComputeTargetSSLProxy                │              │ x       │      │
    │ ComputeTargetTCPProxy                │ x            │ x       │      │
    │ ComputeTargetVPNGateway              │ x            │ x       │      │
    │ ComputeURLMap                        │ x            │ x       │      │
    │ ComputeURLMap                        │ x            │ x       │      │
    │ ComputeVPNGateway                    │ x            │ x       │      │
    │ ComputeVPNTunnel                     │ x            │ x       │      │
    │ ContainerCluster                     │ x            │ x       │      │
    │ ContainerNodePool                    │ x            │         │      │
    │ DataflowFlexTemplateJob              │              │         │      │
    │ DataflowJob                          │              │         │      │
    │ DNSManagedZone                       │ x            │ x       │      │
    │ DNSPolicy                            │ x            │ x       │      │
    │ DNSRecordSet                         │              │         │      │
    │ FirestoreIndex                       │              │         │      │
    │ IAMCustomRole                        │ x            │         │      │
    │ IAMServiceAccount                    │ x            │         │ x    │
    │ IAMServiceAccountKey                 │              │         │      │
    │ KMSCryptoKey                         │ x            │         │ x    │
    │ KMSKeyRing                           │ x            │ x       │ x    │
    │ LoggingLogSink                       │ x            │         │      │
    │ MemcacheInstance                     │ x            │ x       │      │
    │ MonitoringAlertPolicy                │ x            │         │      │
    │ MonitoringNotificationChannel        │              │         │      │
    │ PubSubSchema                         │              │ x       │      │
    │ PubSubSubscription                   │ x            │ x       │ x    │
    │ PubSubTopic                          │ x            │ x       │ x    │
    │ RedisInstance                        │ x            │ x       │      │
    │ Folder                               │ x            │ x       │ x    │
    │ Project                              │ x            │ x       │ x    │
    │ ResourceManagerLien                  │              │         │      │
    │ ResourceManagerPolicy                │              │         │      │
    │ SecretManagerSecret                  │ x            │ x       │ x    │
    │ SecretManagerSecretVersion           │ x            │         │      │
    │ ServiceDirectoryEndpoint             │              │ x       │      │
    │ ServiceDirectoryNamespace            │ x            │ x       │ x    │
    │ ServiceDirectoryService              │              │ x       │ x    │
    │ ServiceNetworkingConnection          │              │         │      │
    │ Service                              │ x            │ x       │      │
    │ SourceRepoRepository                 │ x            │ x       │ x    │
    │ SpannerDatabase                      │ x            │ x       │ x    │
    │ SpannerInstance                      │ x            │ x       │ x    │
    │ SQLDatabase                          │              │ x       │      │
    │ SQLInstance                          │ x            │ x       │      │
    │ SQLSSLCert                           │              │         │      │
    │ SQLUser                              │              │         │      │
    │ StorageBucket                        │ x            │         │ x    │
    │ StorageBucketAccessControl           │              │         │      │
    │ StorageDefaultObjectAccessControl    │              │         │      │
    │ StorageNotification                  │              │         │      │
    │ StorageTransferJob                   │              │         │      │
    └──────────────────────────────────────┴──────────────┴─────────┴──────┘
    ```

## Decide what you want to export

In this example, we will export the `project`, `gcs buckets` and the `folder`

```shell
gcloud beta resource-config bulk-export --resource-format=terraform --resource-types=Project,StorageBucket,Folder --folder=<>
```

This will then export everything to `stdout` so you can append `>> main.tf` to put it all in to terraform.

## More about how to target

You can use the below to target resources

* `--folder=<>`
* `--project=<>`
* `--organization=<>`

## Additional Reading

* [Google Docs](https://cloud.google.com/docs/terraform/resource-management/export)
