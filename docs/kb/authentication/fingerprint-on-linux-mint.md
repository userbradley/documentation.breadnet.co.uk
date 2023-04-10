---
title: Fingerprint on Linux Mint
reviewdate: '2022-01-01'
---

# Fingerprint on Linux Mint

Use `fprintd` (lacks gui)

```shell
sudo apt install fprintd libpam-fprintd
```

Example code for enrolling your (i) specific finger or (ii) all your fingers:

```shell
fprintd-enroll -f left-index-finger
```

All Fingers

```shell
for finger in {left,right}-{thumb,{index,middle,ring,little}-finger}; do sudo fprintd-enroll -f "$finger"; done
```

Follow the prompt and swipe your finger across your scanner 5 times.

Finally, enable access by marking Fingerprint option with * using the spacebar key in:

```shell
sudo pam-auth-update
```

_Appeared [here](https://forums.linuxmint.com/viewtopic.php?t=323688)_