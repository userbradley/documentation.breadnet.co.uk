---
title: Forward real IP to a NGINX behind a GCP Load Balancer
---

## Introduction

We worked in a project that required a nginx server to be able to whitelist some public ip addresses while denying all other connections. While this can be addressed using GCP firewall rules there were some other reasons why it was necessary to be done through nginx configuration instead of using GCP rules.

The problem is that nginx was not showing the correct real ip address of the request in the REMOTE_ADDR header.

```text
130.211.0.230 - - [23/Jan/2020:09:44:51 +0000] "GET / HTTP/1.1" 404 "108.26.106.168, 36.129.221.25"
```

## Scenario

I’ll be using a very simple scenario:

* Google Compute private instance running two docker containers: nginx and a php based app
* Public GCP Load Balancer targeting the nginx container.

Fake IP addresses used in this post:

* User originating requests: 108.26.106.168
* GCP Load Balancer public IP: 36.129.221.25
* GCP Load Balancer private ranges: 130.211.0.0/22 and 35.191.0.0/16

That’s it.

## The problem

Let’s quickly review how a Load Balancer works: When a request is received from a remote client it is terminated and a new request is issued from the LB against the backend, forwarding a set of headers (click on GCP and AWS for specific details) that are then catched by the underlying service.

When you place a nginx server behind the LB you receive the Load Balancer’s private IP as remote address instead of the user’s real public ip.

![](https://geko2.factoryfy.com/wp-content/uploads/travolta-1.gif)

If we take a look at nginx logs we can see this:

```
130.211.0.130 - - [23/Jan/2020:09:02:51 +0000] "GET / HTTP/1.1" 200 "108.26.106.168, 36.129.221.25"
```

Wait! The user IP address appears in that chain at the end of the log. Why the heck is nginx taking the private range of the LB as the origin ip address? Well, this is because the LB is actually doing a new request.

## How did we solve the issue

The first IP in the log comes from the `REMOTE_ADDR` header. We need to replace the value of this header with the real ip address received in the X-Forwarded-For header.

But there’s something else we need to deal with this second header: It actually comes not only with the user real IP but with the Load Balancer public address too.

In order to solve all this we will use the real_ip module. We are going to apply the following configuration in nginx.conf inside the “server” block:

```nginx
set_real_ip_from 36.129.221.25/32; // LB Public IP address
set_real_ip_from 130.211.0.0/22; // Private IP range for GCP Load Balancers
set_real_ip_from 35.191.0.0/16; //Private IP range for GCP Load Balancers
real_ip_header X-Forwarded-For;
real_ip_recursive on;
```

Let’s split it down:

* `set_real_ip_from`: Tell nginx to trust GCP LB public and private IPs.
* `real_ip_header`: Replace REMOTE_ADDR header with the values from X-Forwarded-For.
* `real_ip_recursive on`: Filter out the trusted ips from the chain, therefore the last non-trusted address in the chain will be used as the remote address.

Finally test it out:

```text
108.26.106.168 - - [23/Jan/2020:09:44:51 +0000] "GET / HTTP/1.1" 200 "108.26.106.168, 36.129.221.25"
```

## Conclusion

As we can see the solution was pretty straight forward, but still it took some time diving into documentation to understand how the Load Balancer was forwarding the headers and how we can tune nginx to rewrite the headers in order to achieve the expected behaviour.

Nevertheless, it was a good learning experience.

Sources: <https://nginx.org/en/docs/http/ngx_http_realip_module.html>

## Originally seen on

[Geko.cloud](https://geko.cloud/en/forward-real-ip-to-a-nginx-behind-a-gcp-load-balancer/)
