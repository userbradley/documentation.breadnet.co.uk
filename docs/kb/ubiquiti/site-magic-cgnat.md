---
title: Site-magic CG-nat
---

## What

Sometimes Unifi Site-magic does not work with CGnat

## Solution

> You need a rule on the remote site behind CGNAT permitting Internet In with the source being the remote network and the destination being the local network. UI sucks. I came here looking for a solution and then not finding one other than site magic started poking at it with Wireshark. This fixed it for me. It's lame... but hey that's UI.

## Source

* [Reddit](https://www.reddit.com/r/Ubiquiti/comments/1dcdsc3/site_to_site_vpn_with_one_end_behind_cgnat/)
