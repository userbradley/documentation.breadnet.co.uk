---
title: Docker copying
---

We are able to use the docker CLI to copy files to and from containers

## Get running containers

--8<-- "docs/kb/docker/docker-ps.md"

## From container to host

Using the ID of the container we can copy from inside the container to the host

=== "Describe"

    ```shell
    docker cp <id of container>:/<path/in/container> .
    ```

=== "Example"

    ```shell
    docker cp db129cf0407d:/home/app/podinfo .
    ```

## From host to container

=== "Describe"

    ```shell
    docker cp </path/on/host> <id of container>:/<path/in/container>
    ```

=== "Example"

    ```shell
    docker cp . db129cf0407d:/root/
    ```

## From container to container

!!! note "This is not supported"
    You will get the below error

    ```text
    copying between containers is not supported
    ```

### Workaround

We can copy it to local and then copy it to the other container

=== "Describe"

    ```shell
    docker cp <id of container>:/<path/in/container> . && cp <files from container 1> <id of container>:/<path/in/container>
    ```
=== "Example"

    ```shell
    docker cp db129cf0407d:/home/app/podinfo . && docker cp podinfo dd5e23474b51:/root/
    ```
