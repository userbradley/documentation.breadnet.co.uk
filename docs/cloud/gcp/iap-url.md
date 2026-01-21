---
reviewdate: '2026-12-20'
title: IAP URLs
---

## IAP Force login

Prepend the below to the end of your domain

```text
?gcp-iap-mode=FORCE_LOGIN
```

## IAP Clear Login Cookie

```text
?gcp-iap-mode=CLEAR_LOGIN_COOKIE
```

OR

```text
/_gcp_iap/clear_login_cookie
```

## IAP Show user Identity

```text
?gcp-iap-mode=IDENTITY
```

## Learn more

* [GCP Query parameters](https://cloud.google.com/iap/docs/query-parameters-and-headers-howto)
