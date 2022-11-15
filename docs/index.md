---
title: Welcome
hide:
    - toc
    - edit
---

This site holds all the documentation and notes I've written since starting in IT (around 2016 _ish_)

If you've known me, or referred to my documents before, it used to be `bookstack` 

## Other sites maintained
| Site name                         | Link                                                           |
|-----------------------------------|----------------------------------------------------------------|
| Main site                         | [breadnet.co.uk](https://breadnet.co.uk)                       |
| CV                                | [bradley.breadnet.co.uk](https://bradley.breadnet.co.uk)       |
| Kubernetes Manifest documentation | [kubernetes.breadnet.co.uk](https://kubernetes.breadnet.co.uk) |


## How this site works

This site replaces Bookstack. I decided that it was time to move towards something easier to manage, and that can be run pretty much
anywhere that docker runs. 

It now runs on [fly.io](https://fly.io) and is powered by [mkdocs](https://mkdocs.org)

The cool part is now I just write markdown files, and the site gets built on commit to dev.

Once the dev site is checked and everything looks good, we can open a PR and merge to master.


### How the site gets _built_

I have a CD pipeline that builds a docker image, and publishes it to [fly.io](https://fly.io?ref_documentation-breadnet-co-uk)

You can pull the images from here: 

[userbradley/documentation](https://hub.docker.com/repository/docker/userbradley/documentation)

![](assets/pipeline.png)

You can view the [Source code](https://github.com/userbradley/documentation.breadnet.co.uk/blob/dev/cd/codefresh.yml) for the pipeline 
