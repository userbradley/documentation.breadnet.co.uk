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
... etc
```

## Alternatives

If you're running a markdown site, you can also use Lychee

[Lychee Link Checker](../markdown/lychee-link-checker.md)
