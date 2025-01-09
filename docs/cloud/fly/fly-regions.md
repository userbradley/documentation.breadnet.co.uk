---
title: Fly regions and scaling
---

This page contains the commands you need to scale an application and add new regions

## List applications

```shell
fly apps list
```

## List regions

```shell
fly platform regions
```

??? note "Fly Regions"

    ```text
    CODE NAME                         GATEWAY
    ams  Amsterdam, Netherlands       ✓
    cdg  Paris, France                ✓
    den  Denver, Colorado (US)
    dfw  Dallas, Texas (US)           ✓
    ewr  Secaucus, NJ (US)
    fra  Frankfurt, Germany           ✓
    gru  São Paulo
    hkg  Hong Kong, Hong Kong         ✓
    iad  Ashburn, Virginia (US)       ✓
    jnb  Johannesburg, South Africa
    lax  Los Angeles, California (US) ✓
    lhr  London, United Kingdom       ✓
    maa  Chennai (Madras), India      ✓
    mad  Madrid, Spain
    mia  Miami, Florida (US)
    nrt  Tokyo, Japan                 ✓
    ord  Chicago, Illinois (US)       ✓
    otp  Bucharest, Romania
    scl  Santiago, Chile              ✓
    sea  Seattle, Washington (US)     ✓
    sin  Singapore, Singapore         ✓
    sjc  San Jose, California (US)    ✓
    syd  Sydney, Australia            ✓
    waw  Warsaw, Poland
    yul  Montreal, Canada
    yyz  Toronto, Canada              ✓
    ```

## Show regions

```shell
fly regions list --config <env>.toml
```

## Add regions

```shell
fly regions add dfw --config <env>.toml
```

## Remove regions

```shell
fly regions remove dfw --config <env>.toml
```

## Scale application with max per region

```shell
fly scale count 4 --max-per-region=2 --config <env>.toml
```

!!! Note "Not set"

    You will see `Max Per Region: Not set` - This is a known issue but the value is set. [Check the status](#Status-of-application)

## Status of application

```shell
fly status -a <app name>
```
