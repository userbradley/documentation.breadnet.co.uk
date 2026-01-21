---
reviewdate: '2026-12-20'
title: Get DNSSEC Record for Google Cloud DNS
---

## Why

When configuring DNSSEC for a domain on Google CLoud DNS, you need the DNSSEC Record to enable signing

## How

### Get the Zone

```shell
gcloud dns dns-keys list --zone breadnet --project=breadnet-dns
```

You will get an output like the below, we want toe `key_signing` one, so `0`

```text
ID  KEY_TAG  TYPE          IS_ACTIVE  DESCRIPTION
0   1234     KEY_SIGNING   True
1   12345    ZONE_SIGNING  True
```

### Get the ds_record

```shell
gcloud dns dns-keys describe -zone breadnet --project=breadnet-dns 0 \
   --format "value(ds_record())"
```

You will get an output like the below

```text
44300 8 2 92966cefacccd85b3bf00fcbcc4318b5f97a27889489b8e89b5bd56f83066ddb
```

## What does the output mean?

```text
  * - - - - - - - - - - - - - - Key tag
  |   * - - - - - - - - - - - - Algorithm
  |   | * - - - - - - - - - - - Digest Type
  |   | |             * - - - - Digest (Hexadecimal)
  |   | |             |
44300 8 2 92966cefacccd85b3bf00fcbcc4318b5f97a27889489b8e89b5bd56f83066ddb
```
