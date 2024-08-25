---
title: View logs on who enabled an API
---

## Why

Because you may want to know who enabled an API

## How

=== "Service Usage Enable"
    ```shell
    protoPayload.methodName="google.api.serviceusage.v1.ServiceUsage.EnableService"
    ```
    [:fontawesome-brands-google: View in Console](https://console.cloud.google.com/logs/query;query=protoPayload.methodName%3Dgoogle.api.serviceusage.v1.ServiceUsage.EnableService){ .md-button .md-button--primary }

=== "Authorized user"
    ```shell
    protoPayload.authorizationInfo.permission="serviceusage.services.enable"
    ```

    [:fontawesome-brands-google: View in Console](https://console.cloud.google.com/logs/query;query=protoPayload.authorizationInfo.permission%3Dserviceusage.services.enable){ .md-button .md-button--primary }
