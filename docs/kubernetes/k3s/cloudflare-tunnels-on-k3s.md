---
title: Cloudflare Tunnels on k3s
---

# Cloudflare Tunnels on k3s

## What are cloudflare tunnels

## Install cloudflared

We first need to install it on our computer, so we can log in

```shell
brew install cloudflared
```

## Authenticate and create tunnel

Login to `cloudflared`

```shell
cloudflared tunnel login
```

Create tunnel

```shell
cloudflared tunnel create k3s
```

You will see an output like

```text
Tunnel credentials written to /Users/cf000197/.cloudflared/ef824aef-7557-4b41-a398-4684585177ad.json. cloudflared chose this file based on where your origin certificate was found. Keep this file secret. To revoke these credentials, delete the tunnel.
Created tunnel example-tunnel with id ef824aef-7557-4b41-a398-4684585177ad
```

## Upload Credentials to Kubernetes

The below assumes you already have a namespace called `cloudflare`

```shell
kubens cloudflare
kubectl create secret generic tunnel-credentials --from-literal="credentials.json"=$(cat /Users/cf000197/.cloudflared/ef824aef-7557-4b41-a398-4684585177ad.json | base64)
```

## Creating Records

We will touch on creating the actual config file later, this is the DNS records side

Using the above, the tunnel ID is `ef824aef-7557-4b41-a398-4684585177ad`

And we want the domain `example.breadnet.co.uk` to be sent over the tunnel

Create a record like the below

| Type    | Name                     | Content                                                 | Proxied                                                                      |
|---------|--------------------------|---------------------------------------------------------|------------------------------------------------------------------------------|
| `CNAME` | `example.breadnet.co.uk` | `ef824aef-7557-4b41-a398-4684585177ad.cfargotunnel.com` | <img alt="true" height="50" src="/assets/cloudflare_status.png" width="50"/> |

## Creating the config file

We need to create the cloudflared config file that tells cloudflared where to route things

```yaml
tunnel: k3s
credentials-file: /etc/cloudflared/creds/credentials.json
metrics: 0.0.0.0:2000
no-autoupdate: true
ingress:
  - hostname: example.breadnet.co.uk
    service: http://example:80
  - service: http_status:404
```

!!! note "Final rule"
    When `cloudflared` receives an incoming request, it evaluates each ingress rule from top to bottom to find which rule matches the request. Rules can match either the hostname or path of an incoming request, or both.

    If a rule does not specify a hostname, all hostnames will be matched. If a rule does not specify a path, all paths will be matched.

    The last rule you list in the configuration file must be a catch-all rule that matches all traffic.

The above specifies that the tunnel `ef824aef-7557-4b41-a398-4684585177ad` will be forwarded to the tunnel and then sent
to `http://example:80` in the network

## Kubernetes Manifest

```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: cloudflared
spec:
  selector:
    matchLabels:
      app: cloudflared
  replicas: 2
  template:
    metadata:
      labels:
        app: cloudflared
    spec:
      containers:
        - name: cloudflared
          image: cloudflare/cloudflared:2022.3.0
          args:
            - tunnel
            - --config
            - /etc/cloudflared/config/config.yaml
            - run
          livenessProbe:
            httpGet:
              path: /ready
              port: 2000
            failureThreshold: 1
            initialDelaySeconds: 10
            periodSeconds: 10
          volumeMounts:
            - name: config
              mountPath: /etc/cloudflared/config
              readOnly: true
            - name: creds
              mountPath: /etc/cloudflared/creds
              readOnly: true
      volumes:
        - name: creds
          secret:
            secretName: tunnel-credentials
        - name: config
          configMap:
            name: cloudflared
            items:
              - key: config.yaml
                path: config.yaml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: cloudflared
data:
  config.yaml: |
    tunnel: k3s
    credentials-file: /etc/cloudflared/creds/credentials.json
    metrics: 0.0.0.0:2000
    no-autoupdate: true
    ingress:
      - hostname: example.breadnet.co.uk
        service: http://example:80
      - service: http_status:404
```
