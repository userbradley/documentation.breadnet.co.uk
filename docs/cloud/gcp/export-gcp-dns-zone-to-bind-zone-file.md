---
title: Export GCP DNS zone to bind zone file
---

## Why

Sometimes clients may want to see all their records as a bind file, or they want to see it in yaml

## How

First locate the Zone in GCP.

Once you've located it and _entered_ it, make a note of the zone name.

!!! tip "How to find the zone name"
    In the URL, it will be between `zones` and `details`

    ```text
    dns/zones/examplezonename/details
    ```

=== "Bind"

    ```shell
    gcloud dns record-sets export examplezonename.zonefile --zone=examplezonename --zone-file-format
    ```

=== "Yaml"

    ```shell
    gcloud dns record-sets export records.yaml --zone=examplezonename
    ```
