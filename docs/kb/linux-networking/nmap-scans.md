---
title: Nmap scanning commands
---

# Nmap scanning commands

## Cool things to note

You can press `space` to view the status

## Generic scan

```shell
nmap -Pn <ip>
```

Scans top 1000 port, but will not enumerate past synack 

## Service Enumeration

=== "Top 1000 ports"

    ```shell
    nmap -sC -sV <ip>
    ```

=== "Specific Port"

    ```shell
    nmap -sC -sV -p 80  <ip>
    ```

=== "All Ports"

    ```shell
    nmap -p- <ip>
    ```