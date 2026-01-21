---
reviewdate: '2026-12-20'
title: View the hash of an object in GCS
---

## Why

Sometimes we need to ensure that the file we viewed yesterday hasn't been changed

## How

```shell
gsutil stat gs://<bucket>/<object>
```

??? note "Example of Output"

    ```text
     gsutil stat gs://bradley/default.tfstate
    gs://bradley/default.tfstate:
        Creation time:          Wed, 25 Jan 2023 14:02:40 GMT
        Update time:            Wed, 25 Jan 2023 14:02:40 GMT
        Storage class:          STANDARD
        Content-Length:         2172
        Content-Type:           text/plain; charset=utf-8
        Hash (crc32c):          up7Q==
        Hash (md5):             waly4looI6kugBACFpRw==
        ETag:                   CPq8kq/x4vwCEAE=
        Generation:             1674655366654970
        Metageneration:         1


    ```
