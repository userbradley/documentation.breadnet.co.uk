---
title: To string from a list in terraform
---

Sometimes, like for example when you're trying to crowbar a WAF together you want to pass a list.

??? note "Example of list"

    ```terraform
    asn_block = [
        "16276",
        "9009",
        "13213",
        "15395",
        "15510",
        "20738",
        "20860",
        "21321",
        "25369",
        "29302",
        "29550",
        "35017",
        "35662",
        "39326",
        "42831",
        "51159",
        "57230",
        "58305",
        "59764",
        "60011",
        "60068",
        "61317",
        "62217",
        "62240",
        "199883",
        "200039",
        "57773",
        "198047"]
    ```

## Converting it to a List

```terraform
asn_block_render = [ join(" || ", [for s in local.asn_block : format("origin.asn == %v", s)]) ]
```

This will now render it like the below

```terraform
"origin.asn == 16276 || origin.asn == 9009 || origin.asn == 13213 || origin.asn == 15395 || origin.asn == 15510 || origin.asn == 20738 || origin.asn == 20860 || origin.asn == 21321 || origin.asn == 25369 || origin.asn == 29302 || origin.asn == 29550 || origin.asn == 35017 || origin.asn == 35662 || origin.asn == 39326 || origin.asn == 42831 || origin.asn == 51159 || origin.asn == 57230 || origin.asn == 58305 || origin.asn == 59764 || origin.asn == 60011 || origin.asn == 60068 || origin.asn == 61317 || origin.asn == 62217 || origin.asn == 62240 || origin.asn == 199883 || origin.asn == 200039 || origin.asn == 57773 || origin.asn == 198047"
```

However, it's still as `[""]` - So to consume it as a string, we call it like the below

```terraform
thing = local.asn_block_render[0]
```
