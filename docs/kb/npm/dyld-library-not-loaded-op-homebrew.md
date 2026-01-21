---
reviewdate: '2026-12-20'
title: "dyld Library not loaded: /opt/homebrew/opt/simdjson/lib/libsimdjson.27.dylib"
---

## What

This error happens when trying to run the `npm` command

```shell
➜ npm
dyld[28403]: Library not loaded: /opt/homebrew/opt/simdjson/lib/libsimdjson.27.dylib
  Referenced from: <C969279A-7F56-3A60-95F6-56D90AB2E5A2> /opt/homebrew/Cellar/node/24.9.0_1/bin/node
  Reason: tried: '/opt/homebrew/opt/simdjson/lib/libsimdjson.27.dylib' (no such file), '/System/Volumes/Preboot/Cryptexes/OS/opt/homebrew/opt/simdjson/lib/libsimdjson.27.dylib' (no such file), '/opt/homebrew/opt/simdjson/lib/libsimdjson.27.dylib' (no such file), '/opt/homebrew/Cellar/simdjson/4.1.0/lib/libsimdjson.27.dylib' (no such file), '/System/Volumes/Preboot/Cryptexes/OS/opt/homebrew/Cellar/simdjson/4.1.0/lib/libsimdjson.27.dylib' (no such file), '/opt/homebrew/Cellar/simdjson/4.1.0/lib/libsimdjson.27.dylib' (no such file)
zsh: abort      npm
```

I am not actually sure what I was doing at the time to encounter this issue

## Solution

```shell
brew upgrade node
```

Seems really simple, but it worked.

## Related reading

* [gh:Homebrew/disc/6449](https://github.com/orgs/Homebrew/discussions/6449)
