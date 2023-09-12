---
title: Cloudflared on Ubuntu for ssh
---

# Cloudflared on Ubuntu for ssh

The below assumes you have already connected to the server via ssh you want to manage

## Install cloudflared

```shell
cd /tmp
wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
sudo dpkg -i cloudflared-linux-amd64.deb
apt-get install -f
```

## Login

```shell
cloudflared tunnel login
```

You will then need to click the link, and login to your cloudflare account in the UI. Once done click on the domain you wish to authorize it on

## Create tunnel

```shell
cloudflared tunnel create <name>
```

This will give an output similar to the below

```text
Tunnel credentials written to /root/.cloudflared/hfg2323-a5af-463f-<redacted>-8a0d63237d36.json. cloudflared chose this file based on where your origin certificate was found. Keep this file secret. To revoke these credentials, delete the tunnel.

Created tunnel web with id hfg2323-a5af-463f-<redacted>-8a0d63237d36
```

## Create config file

!!! note "Below is expected to fail"

```shell
cloudflared service install
cd /etc/cloudflared
```

The `service install` should fail, we are just using this to create the directory.

Next, creat the file

```shell
touch config.yaml
```

```shell
nano config.yaml
```

In there, paste the below and edit as you see fit

```yaml
logDirectory: /var/log/cloudflared
tunnel: <tunnel ID>
credentials-file: <location of tunnel file>
no-autoupdate: true
ingress:
  - hostname: ssh-<server>.<domain>
    service: ssh://127.0.0.1:22
  - service: http_status:404
```

## Install the cloudflared service

```shell
cloudflared service install
systemctl enable cloudflared
```

## Start the tunnel

```shell
systemctl start cloudflared
```

## Troubleshooting

### quic not connecting

```text
 Failed to create new quic connection error="failed to dial to edge with quic: timeout: no recent network activity
```

In order for `quic` to work you need to have the below ports allowed **outbound**

- `udp/7844`

If you do not feel like allowing this port, you can have the tunnel use `http2` -  Read below on how to do this

#### Edit the service

```shell
nano /etc/systemd/system/cloudflared.service
```

Edit the file so it's like the below

```diff
[Service]
TimeoutStartSec=0
Type=notify
-ExecStart=/usr/bin/cloudflared --config /etc/cloudflared/config.yml tunnel run
+ExecStart=/usr/bin/cloudflared --protocol http2  --config /etc/cloudflared/config.yml tunnel run
Restart=on-failure
RestartSec=5s
```

Add `--protocol http2` after `/usr/bin/cloudflared`

#### Reload the daemon

```shell
systemctl daemon-reload
```

#### Restart the service

```shell
systemctl restart cloudflared
```
