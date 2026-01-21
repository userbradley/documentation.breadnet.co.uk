---
reviewdate: '2026-12-20'
tite: Cloudflare cdn-cgi endpoints
---

## What

When a domain is proxied through Cloudflare you get a new endpoint on your site

!!! note "Only work when proxied"

    These will only work when your domain is proxied through cloudflare

    This means your DNS record needs to have the <img alt="true" height="50" src="/assets/cloudflare_status.png" width="50"/> icon next to it

```shell
/cdn-cgi/
```

This is a special endpoint that is managed by Cloudflare, and you've got no control over it.

It has some interesting functionality however, that's not centrally documented anywhere - so this is my attempt to do so
and centrally document them as I've come across them

## Access

These endpoints are for Cloudflare's _Access_ product. Zerotrust auth platform etc

### `/cdn-cgi/access/logout`

This allows you to log out of the sessions when using Cloudflare Access

!!! note "This is across all applications"

    Using this will log you out across all your Access applications

#### How to use

* `<application-domain>/cdn-cgi/access/logout`
* `<team-name>.cloudflareaccess.com/cdn-cgi/access/logout`

### `cdn-cgi/access/certs`

Ability to access Signing keys used to mint JWT's

Example from Cloudflare's Documentation

```json
{
  "keys": [
    {
      "kid": "1a1c3986a44ce6390be42ec772b031df8f433fdc71716db821dc0c39af3bce49",
      "kty": "RSA",
      "alg": "RS256",
      "use": "sig",
      "e": "AQAB",
      "n": "5PKw-...-AG7MyQ"
    },
    {
      "kid": "6c3bffef71bb0a90c9cbef3b7c0d4a1c7b4b8b76b80292a623afd9dac45d1c65",
      "kty": "RSA",
      "alg": "RS256",
      "use": "sig",
      "e": "AQAB",
      "n": "pwVn...AA6Hw"
    }
  ],
  "public_cert": {
    "kid": "6c3bffef71bb0a90c9cbef3b7c0d4a1c7b4b8b76b80292a623afd9dac45d1c65",
    "cert": "-----BEGIN CERTIFICATE----- ... -----END CERTIFICATE----- "
  },
  "public_certs": [
    {
      "kid": "1a1c3986a44ce6390be42ec772b031df8f433fdc71716db821dc0c39af3bce49",
      "cert": "-----BEGIN CERTIFICATE----- ... -----END CERTIFICATE----- "
    },
    {
      "kid": "6c3bffef71bb0a90c9cbef3b7c0d4a1c7b4b8b76b80292a623afd9dac45d1c65",
      "cert": "-----BEGIN CERTIFICATE----- ... -----END CERTIFICATE----- "
    }
  ]
}
```

#### How to use

* `https://<team-name>.cloudflareaccess.com/cdn-cgi/access/certs`
* `<application-domain>/cdn-cgi/access/certs`

### `/cdn-cgi/access/get-identity`

This endpoint allows you to view information about your user identity and diagnose groups issues

Example response

```json
{
  "id": "a1b2c3d4-e5f6-7890-1234-567890abcdef",
  "email": "user@example.com",
  "idp": {
    "id": "f47ac10b-58cc-4372-a567-0e02b2c3d4e5",
    "type": "oidc"
  },
  "geo": {
    "country": "GB"
  },
  "user_uuid": "98765432-aaaa-bbbb-cccc-1234567890ab",
  "account_id": "11223344556677889900aabbccddeeff",
  "iat": 1762449672,
  "devicePosture": {
    "c0ffee00-dead-beef-1234-567890abcdef": {
      "type": "gateway",
      "rule_name": "Gateway",
      "success": false
    }
  },
  "ip": "203.0.113.10",
  "auth_status": "NONE",
  "common_name": "",
  "service_token_status": false,
  "is_warp": false,
  "is_gateway": false,
  "version": 0,
  "device_sessions": {
    "11111111-2222-3333-4444-555555555555": {
      "last_authenticated": 1728658943,
      "warp_as_idp": {
        "iat": 1728658943,
        "expires": 1728687743
      }
    },
    "22222222-3333-4444-5555-666666666666": {
      "last_authenticated": 1745517768,
      "warp_as_idp": {
        "iat": 1745517768,
        "expires": 1745546568
      }
    },
    "33333333-4444-5555-6666-777777777777": {
      "last_authenticated": 1745518329,
      "warp_as_idp": {
        "iat": 1745518329,
        "expires": 1745547129
      }
    },
    "44444444-5555-6666-7777-888888888888": {
      "last_authenticated": 1745518984,
      "warp_as_idp": {
        "iat": 1745518984,
        "expires": 1745547784
      }
    },
    "55555555-6666-7777-8888-999999999999": {
      "last_authenticated": 1749857168,
      "warp_as_idp": {
        "iat": 1749857168,
        "expires": 1749885968
      }
    },
    "66666666-7777-8888-9999-aaaaaaaaaaaa": {
      "last_authenticated": 1745587461,
      "warp_as_idp": {
        "iat": 1745587461,
        "expires": 1745616261
      }
    },
    "77777777-8888-9999-aaaa-bbbbbbbbbbbb": {
      "last_authenticated": 1746793067,
      "warp_as_idp": {
        "iat": 1746793067,
        "expires": 1746821867
      }
    },
    "88888888-9999-aaaa-bbbb-cccccccccccc": {
      "last_authenticated": 1757882690,
      "warp_as_idp": {
        "iat": 1757882690,
        "expires": 1757911490
      }
    }
  },
  "custom": {
    "groups": [
      "mealie"
    ]
  }
}
```

#### How to use

* `https://<team-name>.cloudflareaccess.com/cdn-cgi/access/get-identity`
* `<application-domain>/cdn-cgi/access/get-identity`

## Generic

These are endpoints that do not rely on any products

### `/cdn-cgi/trace`

This endpoint gives you information about your request

Example would be

```text
fl=736f69
h=documentation.breadnet.co.uk
ip=69.69.69.69
ts=1762450907.000
visit_scheme=https
uag=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36
colo=LHR
sliver=none
http=http/3
loc=GB
tls=TLSv1.3
sni=encrypted
warp=off
gateway=off
rbi=off
kex=X25519MLKEM768
```

#### How to use

* `<domain-or-subdomain>/cdn-cgi/trace`
