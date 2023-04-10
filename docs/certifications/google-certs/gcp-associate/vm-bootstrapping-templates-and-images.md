---
title: VM Bootstrapping, templates and Images
reviewdate: '2022-01-01'
---

# VM Bootstrapping, templates and Images

You can bootstrap an instance with a startup script

You are then also able to create templates for configuring your specs

With templates, you can use it to create VM Instances as well as Managed Instance groups.

You dont have to specify an OS, you can create one with a family and it will chose the most up to date one.

You should aim to use templates and only edit things when needed.



Now we are able to cut down the time of boot by creating an image.

Images can be shared across projects and you're able to deprecate images after a while. You can then tell users to use a new recommended one - This allows you to push security standards to all images that users may deploy.

Best to use a custom image opposed to a startup script.

To create an image, you go to compute engine > disks > actions > create image

You will want to stop the machine when creating an image.

An image is basically just a snapshot you can deploy.  