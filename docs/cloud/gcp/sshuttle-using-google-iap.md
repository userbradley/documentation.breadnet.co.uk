---
title: sshuttle using Google IAP
---

# SSHuttle using Google IAP

## SSH to the server

You will need to SSH to the server to begin with.

See [SSH using IAP](ssh-iap.md)

## get your username

run `whoami`

Make a note of this

## Edit your `~/.ssh/config` file

Add the below in

```shell
Host proxy
  ProxyCommand gcloud compute start-iap-tunnel <host name> 22 --listen-on-stdin --project=<gcp project> --zone=<zone> --verbosity=warning
  IdentityFile /Users/<username>/.ssh/google_compute_engine
  UserKnownHostsFile=/Users/<username>/.ssh/google_compute_known_hosts
  user <username from whoami>
```

Once this is done, you can connect

## sshuttle

```shell
sshuttle -r proxt <ip/range>
```

??? error "Possible error you will see"

    ```text
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    @    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
    Someone could be eavesdropping on you right now (man-in-the-middle attack)!
    It is also possible that a host key has just been changed.
    The fingerprint for the ED25519 key sent by the remote host is
    SHA256:<redacted>.
    Please contact your system administrator.
    Add correct host key in /Users/<redacted>/.ssh/google_compute_known_hosts to get rid of this message.
    Offending ED25519 key in /Users/<redacted>/.ssh/google_compute_known_hosts:1
    Password authentication is disabled to avoid man-in-the-middle attacks.
    Keyboard-interactive authentication is disabled to avoid man-in-the-middle attacks.
    ```
    
    You can just ignore this