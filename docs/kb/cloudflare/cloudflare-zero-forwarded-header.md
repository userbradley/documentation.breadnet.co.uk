---
title: List of Headers Cloudflare zero sends
---



## Headers

```json
{
  "Accept": [
    "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"
  ],
  "Accept-Encoding": [
    "gzip, br"
  ],
  "Accept-Language": [
    "en-US,en;q=0.9"
  ],
  "Cdn-Loop": [
    "cloudflare; loops=1"
  ],
  "Cf-Access-Authenticated-User-Email": [
    "example@localhost
  ],
  "Cf-Access-Jwt-Assertion": [
    "<redacted>"
  ],
  "Cf-Connecting-Ip": [
    "<redacted>"
  ],
  "Cf-Ipcountry": [
    "GB"
  ],
  "Cf-Ray": [
    "<redacted>"
  ],
  "Cf-Visitor": [
    "{\"scheme\":\"https\"}"
  ],
  "Cf-Warp-Tag-Id": [
    "<redacted>"
  ],
  "Connection": [
    "keep-alive"
  ],
  "Cookie": [
    "<redacted>"
  ],
  "Priority": [
    "u=0, i"
  ],
  "Sec-Ch-Ua": [
    "\"Google Chrome\";v=\"129\", \"Not=A?Brand\";v=\"8\", \"Chromium\";v=\"129\""
  ],
  "Sec-Ch-Ua-Mobile": [
    "?0"
  ],
  "Sec-Ch-Ua-Platform": [
    "\"macOS\""
  ],
  "Sec-Fetch-Dest": [
    "document"
  ],
  "Sec-Fetch-Mode": [
    "navigate"
  ],
  "Sec-Fetch-Site": [
    "none"
  ],
  "Sec-Fetch-User": [
    "?1"
  ],
  "Upgrade-Insecure-Requests": [
    "1"
  ],
  "User-Agent": [
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36"
  ],
  "X-Api-Revision": [
    "<redacted>"
  ],
  "X-Api-Version": [
    "6.7.0"
  ],
  "X-Forwarded-For": [
    "<redacted>"
  ],
  "X-Forwarded-Proto": [
    "https"
  ]
}
```

## Explain

### Cf-Access-Authenticated-User-Email

This header is the most important header if you're planning to use Cloudflare Zero for things like [Grocy auth headers](../grocy/set-grocy-to-use-cloudflare-username.md)
