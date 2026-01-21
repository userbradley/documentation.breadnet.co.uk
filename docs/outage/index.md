---
reviewdate: '2026-12-20'
title: Outage Reports
---

## How to create a new outage

```shell
touch $(date +"%Y-%m-%d-%H").md
```

This will create a file with the format `yyyy-mm-dd-hh`

## Template

```markdown
---
title: "yyyy-mm-dd hh"
---

## What was affected

## What caused it

## What monitoring was in place

## What was done to resolve it

## What did we learn
```
