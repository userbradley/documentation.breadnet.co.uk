---
title: List bucket size on Wasabi
---

## Why

The UI is often not up to date around the bucket size, so it can cause you issues when working out their stupid 90 days storage cost.

## How

You will need to know your service URL for your bucket.

Read the page [Service URLs for Wasabi's Storage Regions](https://docs.wasabi.com/docs/what-are-the-service-urls-for-wasabi-s-different-storage-regions)

Examples below

=== "London"
    ```shell
    aws s3 ls --summarize --human-readable --recursive --endpoint-url=https://s3.eu-west-1.wasabisys.com s3://<bucket name>
    ```
=== "Tokyo"
    ```shell
    aws s3 ls --summarize --human-readable --recursive --endpoint-url=https://s3.ap-northeast-1.wasabisys.com s3://<bucket name>
    ```

=== "Texas"
    ```shell
    aws s3 ls --summarize --human-readable --recursive --endpoint-url=https://s3.us-central-1.wasabisys.com s3://<bucket name>
    ```
