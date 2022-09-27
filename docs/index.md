---
title: Welcome
---

This is the _new_ documentation site for [breadNET](https://breadnet.co.uk)

## Other sites maintained

* [breadnet.co.uk](https://breadnet.co.uk)
* [kubernetes.breadnet.co.uk](https://kubernetes.breadnet.co.uk)

## How this site works

Like mentioned [above](#:~:text=new%20documentation%20site%20for%20breadNET) - This is the _new_ documentation site,
replacing `bookstack.breadnet.co.uk` (Which is now offline)

I have decided to move towards an [SCM](https://git-scm.com) based site.

This means I write [markdown files]() and then using [mkdocs](mkdocs.org/) with the [material theme](https://squidfunk.github.io/mkdocs-material/)
the site gets built.

### How the site gets _built_

I have a CD pipeline that builds the site and copies it to the webserver
