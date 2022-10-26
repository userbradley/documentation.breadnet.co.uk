---
title: Installing jellyfin
outdated: true
---

# Installing jellyfin

```bash
curl -fsSL https://get.docker.com -o get-docker.shsh
get-docker.sh
```

```bash
apt-get install docker-compose
```

Before running the Jellyfin Container. We need to make 3 folders:
Make a folder called Jellyfin, and create the 3 folders inside the Jellyfin Folder.

* Config
* Cache
* Media

```bash
mkdir -p Path/To/Config
mkdir -p Path/To/Cache
mkdir -p Path/To/Media
```

(may need sudo)

```bash
docker pull jellyfin/jellyfin
```

Docker-Compose

Create a docker-compose.yml file with the following contents:

```yaml
version: "3"
services:
 jellyfin:
  image: jellyfin/jellyfin
  user: 1000:1000
  network_mode: "host"
  volumes:
    - /path/to/config:/config
    - /path/to/cache:/cache
    - /path/to/media:/media
```

Then while in the same folder as the docker-compose.yml run:

```bash
docker-compose up
```