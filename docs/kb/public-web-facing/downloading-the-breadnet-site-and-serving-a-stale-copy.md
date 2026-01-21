---
reviewdate: '2026-12-20'
title: Downloading the breadNET site and serving a stale copy
---

This is part of a project to serve the breadnet site when the server goes down for maintenance.

## Download the site

```shell
wget \
     --recursive \
     --no-clobber \
     --page-requisites \
     --html-extension \
     --convert-links \
     --no-parent \
         breadnet.co.uk
```

## Replace broken links

```shell
grep -rli 'jpgg' * | LC_ALL=C xargs  sed -i  '' 's/jpgg/jpg/g'
grep -rli 'JPGG' * | LC_ALL=C xargs  sed -i  '' 's/JPGG/jpg/g'
grep -rli 'jpgpg' * | LC_ALL=C xargs  sed -i  '' 's/jpgpg/jpg/g'
grep -rli 'JPGPG' * | LC_ALL=C xargs  sed -i  '' 's/JPGPG/jpg/g'
grep -rli 'jpgjpg' * | LC_ALL=C xargs  sed -i  '' 's/jpgjpg/jpg/g'
grep -rli 'JPGJPG' * | LC_ALL=C xargs  sed -i  '' 's/JPGJPG/jpg/g'
grep -rli 'pngg' * | xargs  sed -i  '' 's/pngg/png/g'
grep -rli 'pngng' * | xargs  sed -i  '' 's/pngng/png/g'
grep -rli 'pngpng' * | xargs  sed -i  '' 's/pngpng/png/g'
grep -rli 'svgg' * | xargs  sed -i  '' 's/svgg/svg/g'
grep -rli 'svgvg' * | xargs  sed -i  '' 's/svgvg/svg/g'
grep -rli 'svgsvg' * | xargs  sed -i  '' 's/svgsg/svg/g'
```

## Serve the site

```shell
docker run -p 8080:80 -v $(pwd):/usr/share/nginx/html/ -it nginx
```
