---
title: "Nginx ingress with Cloudflare origin SSL/TLS"
---

## What

When using Cloudflare, you have the option to only allow traffic from Cloudflare servers to terminate SSL.

In simple speak, cloudflare uses a self-signed SSL certificate to connect from their servers to yours.

We can set up Nginx-ingress to honour this

## How it works

Using the below diagram, the browser (you) connects to cloudflare, then cloudflare servers connect to your origin server (your webserver)
and it uses its own SSL certificate to ensure it's encrypted, then it communicates back to cloudflare then to you

<svg width="500" height="117.6470588235294" viewBox="0 0 720 161.58" aria-hidd en="true"><path fill="#404242" d="M123.52 83.27h144.9v-4.66h-144.9" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #313537;"></path><path d="M120.51 41h-90a4.13 4.13 0 00-4.07 4.08v71.47a4.13 4.13 0 004.07 4.07h90a4.13 4.13 0 004.07-4.07V45.11a4.13 4.13 0 00-4.07-4.11zm-60.6 4.13h55.86a3.6 3.6 0 110 7.19H59.91a3.6 3.6 0 010-7.19zm-12.6 1.47a2.17 2.17 0 11-2.17 2.16 2.17 2.17 0 012.17-2.16zm-6.4 0a2.17 2.17 0 11-2.17 2.16 2.16 2.16 0 012.17-2.16zm-6.41 0a2.17 2.17 0 11-2.16 2.16 2.17 2.17 0 012.16-2.16zm86.18 70l-.17.16h-90l-.17-.16V56.85h90.31z" fill="#404242" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #313537;"></path><path d="M55.3 99.85l19.49 11.26a1.55 1.55 0 001.56 0l.19-.14 19.22-11.35a1.56 1.56 0 00.76-1.36l-.19-21.74a1.57 1.57 0 00-.11-.53 1.55 1.55 0 00-.71-1l-19-11.56a1.59 1.59 0 00-1.59 0L55.47 74.55a1.64 1.64 0 00-.35.29 1.54 1.54 0 00-.5 1.13l-.1 22.52a1.58 1.58 0 00.78 1.36zm38.09-2.47L77.13 107V88l16.1-8.87zM75.72 66.59l15.89 9.69-16 9L68 80.9l-8.58-5zm-18 12.07l8.65 4.93L74 88v19l-16.35-9.4z" fill="#404242" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #313537;"></path><path d="M214.8 80.48a18.1 18.1 0 11-18.1-18.09 18.1 18.1 0 0118.1 18.09z" fill="#fff" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #e8e6e3;"></path><path d="M214.8 80.48h-2a16.08 16.08 0 11-4.71-11.38 16.06 16.06 0 014.71 11.38h4a20.1 20.1 0 10-20.1 20.1 20.09 20.09 0 0020.1-20.1z" fill="#404242" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #bfb9b1;"></path><path d="M188.62 90.73h16.12a1.07 1.07 0 001.11-1.12v-11a1.07 1.07 0 00-1.11-1.12h-1.59v-3.16a6.43 6.43 0 00-12.86 0v3.17h-1.58a1.08 1.08 0 00-1.12 1.12v11c-.19.55.41 1.11 1.03 1.11zm9.41-4.1a.6.6 0 01-.56.74h-1.68a.6.6 0 01-.56-.74l.56-2a1.8 1.8 0 01-1-1.77 2 2 0 113.91 0 2.2 2.2 0 01-1 1.77zm-4.66-12.3a3.26 3.26 0 116.52 0v3.17h-6.43z" fill="#79c698" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #7dc89b;"></path><text transform="translate(49.83 135.89)" font-size="14" font-family="SFProDisplay-Regular,SF Pro Display,-apple-system, system-ui, BlinkMacSystemFont,Segoe UI, Roboto, Oxygen, Ubuntu, Helvetica Neue,  Arial, sans-serif">Browser</text><g><path fill="#404242" d="M424.94 83.27h144.89v-4.66H424.94" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #313537;"></path><path d="M693.24 54.15a4.29 4.29 0 00-2.24-2.33 4.17 4.17 0 00-1.63-.33h-120a4.13 4.13 0 00-1.63.33 4.19 4.19 0 00-1.37.94 4.2 4.2 0 00-1.21 3v41a4.22 4.22 0 004.21 4.22h120a4.2 4.2 0 004.2-4.22v-41a4.31 4.31 0 00-.33-1.61zm-4.52 42.11H569.9v-40h118.82z" fill="#404242" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #313537;"></path><path d="M671.06 68.56a1.43 1.43 0 011.44-1.44 1.43 1.43 0 011 .42 1.46 1.46 0 01.43 1V84a1.48 1.48 0 01-.43 1 1.43 1.43 0 01-1 .42 1.45 1.45 0 01-1-.42 1.47 1.47 0 01-.42-1zm-10.87 0a1.43 1.43 0 011.44-1.44 1.47 1.47 0 011 .42 1.45 1.45 0 01.42 1V84a1.43 1.43 0 01-1.45 1.45 1.45 1.45 0 01-1-.42 1.47 1.47 0 01-.42-1zm-10.78 0a1.46 1.46 0 01.43-1 1.43 1.43 0 011-.42 1.43 1.43 0 011.44 1.44V84a1.47 1.47 0 01-.42 1 1.45 1.45 0 01-1 .42 1.43 1.43 0 01-1-.42 1.48 1.48 0 01-.43-1zm-10.77 0a1.43 1.43 0 011.44-1.44 1.47 1.47 0 011 .42 1.45 1.45 0 01.42 1V84a1.43 1.43 0 01-1.45 1.45 1.45 1.45 0 01-1-.42 1.47 1.47 0 01-.42-1zm-10.78 0a1.45 1.45 0 112.89 0V84a1.47 1.47 0 01-.42 1 1.45 1.45 0 01-2 0 1.48 1.48 0 01-.43-1zm-10.77 0a1.43 1.43 0 011.44-1.44 1.47 1.47 0 011 .42 1.45 1.45 0 01.42 1V84a1.43 1.43 0 01-1.45 1.45 1.45 1.45 0 01-1-.42 1.47 1.47 0 01-.42-1zm-10.78 0a1.45 1.45 0 112.89 0V84a1.47 1.47 0 01-.42 1 1.45 1.45 0 01-2 0 1.48 1.48 0 01-.43-1zm-10.77 0a1.45 1.45 0 112.89 0V84a1.47 1.47 0 01-.42 1 1.46 1.46 0 01-2 0 1.47 1.47 0 01-.42-1zm-10.8 0a1.45 1.45 0 012.9 0V84a1.48 1.48 0 01-.43 1 1.45 1.45 0 01-2 0 1.48 1.48 0 01-.43-1z" fill="#404242" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #313537;"></path><path d="M629.31 85.43a1.45 1.45 0 001-.42 1.47 1.47 0 00.42-1V68.56a1.45 1.45 0 00-2.89 0V84a1.48 1.48 0 00.43 1 1.45 1.45 0 001.04.43zM640.08 85.43a1.43 1.43 0 001.45-1.43V68.56a1.45 1.45 0 00-.42-1 1.47 1.47 0 00-1-.42 1.43 1.43 0 00-1.44 1.44V84a1.47 1.47 0 00.42 1 1.45 1.45 0 00.99.43zM650.86 85.43a1.45 1.45 0 001-.42 1.47 1.47 0 00.42-1V68.56a1.43 1.43 0 00-1.44-1.44 1.43 1.43 0 00-1 .42 1.46 1.46 0 00-.43 1V84a1.48 1.48 0 00.43 1 1.43 1.43 0 001.02.43zM661.63 85.43a1.43 1.43 0 001.45-1.43V68.56a1.45 1.45 0 00-.42-1 1.47 1.47 0 00-1-.42 1.43 1.43 0 00-1.44 1.44V84a1.47 1.47 0 00.42 1 1.45 1.45 0 00.99.43zM586.19 85.43a1.45 1.45 0 001-.42 1.48 1.48 0 00.43-1V68.56a1.45 1.45 0 00-2.9 0V84a1.48 1.48 0 00.43 1 1.45 1.45 0 001.04.43zM597 85.43a1.45 1.45 0 001-.42 1.47 1.47 0 00.42-1V68.56a1.45 1.45 0 10-2.89 0V84a1.47 1.47 0 00.42 1 1.45 1.45 0 001.05.43zM607.76 85.43a1.45 1.45 0 001-.42 1.47 1.47 0 00.42-1V68.56a1.45 1.45 0 00-2.89 0V84a1.48 1.48 0 00.43 1 1.45 1.45 0 001.04.43zM618.53 85.43A1.43 1.43 0 00620 84V68.56a1.45 1.45 0 00-.42-1 1.47 1.47 0 00-1-.42 1.43 1.43 0 00-1.44 1.44V84a1.47 1.47 0 00.42 1 1.45 1.45 0 00.97.43zM672.5 85.43a1.43 1.43 0 001-.42 1.48 1.48 0 00.43-1V68.56a1.46 1.46 0 00-.43-1 1.43 1.43 0 00-1-.42 1.43 1.43 0 00-1.44 1.44V84a1.47 1.47 0 00.42 1 1.45 1.45 0 001.02.43zM674 106.93a2.63 2.63 0 00-.54-.84 2.53 2.53 0 00-.79-.56 2.36 2.36 0 00-.95-.18H586.9a2.36 2.36 0 00-1.7.74 2.6 2.6 0 000 3.57 2.32 2.32 0 001.7.74h84.81a2.29 2.29 0 00.93-.17 2.64 2.64 0 00.79-.54 2.32 2.32 0 00.53-.81 2.43 2.43 0 00.2-1 2.55 2.55 0 00-.16-.95z" fill="#404242" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #313537;"></path><text transform="translate(590 135.89)" font-size="14" font-family="SFProDisplay-Regular,SF Pro Display,-apple-system, system-ui, BlinkMacSystemFont,Segoe UI, Roboto, Oxygen, Ubuntu, Helvetica Neue,  Arial, sans-serif">Origin Server</text><path d="M513.8 80.48a18.1 18.1 0 11-18.1-18.09 18.1 18.1 0 0118.1 18.09z" fill="#fff" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #e8e6e3;"></path><path d="M513.8 80.48h-2a16.08 16.08 0 11-4.71-11.38 16.06 16.06 0 014.71 11.38h4a20.1 20.1 0 10-20.1 20.1 20.09 20.09 0 0020.1-20.1z" fill="#404242" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #bfb9b1;"></path><path d="M487.62 90.73h16.12a1.07 1.07 0 001.11-1.12v-11a1.07 1.07 0 00-1.11-1.12h-1.59v-3.16a6.43 6.43 0 00-12.86 0v3.17h-1.58a1.08 1.08 0 00-1.12 1.12v11c-.19.55.41 1.11 1.03 1.11zm9.41-4.1a.6.6 0 01-.56.74h-1.68a.6.6 0 01-.56-.74l.56-2a1.8 1.8 0 01-1-1.77 2 2 0 113.91 0 2.2 2.2 0 01-1 1.77zm-4.66-12.3a3.26 3.26 0 116.52 0v3.17h-6.43z" fill="#79c698" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #7dc89b;"></path><path d="M706.69 75.7a17.61 17.61 0 00-2.63-2.76 17.55 17.55 0 00-11.06-4 17.28 17.28 0 00-14.62 26.52 18 18 0 002 2.64 17.8 17.8 0 002.58 2.24v15.4l9.74-7.64 10.3 8.55v-16.32a17.23 17.23 0 003.68-24.63z" fill="#fff" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #181a1b;"></path><path d="M702.62 74.76a15 15 0 00-22.34 19.58 15.26 15.26 0 001.78 2.29 15.5 15.5 0 002.24 2l.52.37v12.58l8-6.23 8.4 7V99l.52-.37a15 15 0 003.21-21.43l1-.76-1 .76a14.9 14.9 0 00-2.33-2.44zM702 88.9a9.61 9.61 0 01-2.77 4.57 9.43 9.43 0 01-12.21.57 9.56 9.56 0 01-3.74-7.55A9.53 9.53 0 01702 84.06a9.77 9.77 0 01.32 2.44 9.58 9.58 0 01-.32 2.4z" fill="#71c492" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #78c797;"></path></g><g><path d="M425.26 80.84h-2.21a76.07 76.07 0 11-22.28-53.77 75.79 75.79 0 0122.28 53.77h4.42a80.47 80.47 0 10-23.57 56.9 80.24 80.24 0 0023.57-56.9z" fill="#f5821f" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #b75908;"></path><path d="M368.05 92.57a6.63 6.63 0 00-.69-5.85 5.92 5.92 0 00-4.72-2.32l-38.51-.5a.69.69 0 01-.59-.31.86.86 0 01-.1-.69 1.05 1.05 0 01.91-.69l38.85-.5c4.6-.22 9.61-3.94 11.36-8.51l2.22-5.79a1.21 1.21 0 00.06-.75 25.29 25.29 0 00-48.64-2.59A11.37 11.37 0 00310.05 72a12.21 12.21 0 00.28 4 16.16 16.16 0 00-15.7 16.17 18.68 18.68 0 00.16 2.35.76.76 0 00.75.65h71.07a1 1 0 00.91-.69z" fill="#f5821f" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #b75908;"></path><path d="M380.32 67.82h-1.07a.63.63 0 00-.56.44l-1.5 5.22a6.63 6.63 0 00.69 5.85 5.92 5.92 0 004.72 2.32l8.2.5a.69.69 0 01.59.31.84.84 0 01.09.69 1 1 0 01-.9.69l-8.54.5c-4.63.22-9.61 3.94-11.36 8.51l-.63 1.59a.46.46 0 00.44.63h29.35a.78.78 0 00.75-.56 21.49 21.49 0 00.78-5.7 21.08 21.08 0 00-21.05-20.99z" fill="#fbae40" data-darkreader-inline-fill="" style="--darkreader-inline-fill: #fbb147;"></path><text transform="translate(315.73 135.45)" font-size="14" font-family="SFProDisplay-Regular,SF Pro Display,-apple-system, system-ui, BlinkMacSystemFont,Segoe UI, Roboto, Oxygen, Ubuntu, Helvetica Neue,  Arial, sans-serif">Cloudflare</text></g></svg>

## Creating SSL Certificate

!!! note "DNS settings"
    You **must** set your DNS setting for the domain (eg: `server.breadinfra.net`) to use `proxied` otherwise this wont work

In cloudflare, select your domain then navigate to **SSL/TLS** > **Origin server**

Enable **Authenticated Origin pulls**

Click `Create Certificate`

Select **Generate private key and CSR with cloudflare** and select **RSA (2048)**

Fill out the domain name

You can select how long you want the certificate to be valid for, default is 15 years

### Create the files locally

Once you've clicked `Create` from the previous screen, you are presented with 2 text boxes

* Origin Certificate
* Private Key

Copy the **Origin certificate** in to a file called `cf.crt`

Copy the **Private key** in to a file called `cf.key`

## Enable Strict SSL

Click **Overview** on the `**SSL/TLS**` navbar

Under the top box, there is an option called `Full (strict)`, enable this

![](../../assets/cf_strict-ssl.png)


Download the [Cloudflare Origin CA root certificate](https://developers.cloudflare.com/ssl/origin-configuration/origin-ca/#cloudflare-origin-ca-root-certificate)

```shell
wget https://developers.cloudflare.com/ssl/static/authenticated_origin_pull_ca.pem
```

## Create kubernetes secrets

### Create cloudflare TLS Secret

This secret is used to ensure that requests are real and are coming from the cloudflare network

```shell
kubectl create secret generic cloudflare-tls-secret --from-file=ca.crt=./authenticated_origin_pull_ca.pem
```

### Create SSL Certificate

```shell
kubectl create secret tls cloudflare-origin-server --key cf.key --cert cf.crt
```

## Configure nginx ingress

Configure the below lines for your ingress.

Make sure to chang `<namespace>` to the namespace where the secret is created
``` yaml hl_lines="5-8 26"
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    nginx.ingress.kubernetes.io/auth-tls-pass-certificate-to-upstream: "true"
    nginx.ingress.kubernetes.io/auth-tls-secret: <namespace>/cloudflare-tls-secret
    nginx.ingress.kubernetes.io/auth-tls-verify-client: "on"
    nginx.ingress.kubernetes.io/auth-tls-verify-depth: "1"
  name: name
spec:
  ingressClassName: nginx
  rules:
  - host: <host-from-cloudflare>
    http:
      paths:
      - backend:
          service:
            name: <service-name>
            port:
              number: <service-port>
        path: /
        pathType: Prefix
  tls:
  - hosts:
    - <host-from-cloudflare>
    secretName: cloudflare-origin-server
```

Once created, get the ingress IP

```shell
kubectl get ingress <name>
```

Output:

```shell
NAME            HOSTS     ADDRESS         PORTS     AGE
basic-ingress   *         203.0.113.12    80        2m
```

You should now set your DNS to use this IP address
