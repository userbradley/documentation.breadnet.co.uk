---
reviewdate: '2026-12-20'
title: Send test email on Passbolt
---

There are 2 ways to send a test email

1. Exec from your computer
2. Shell in the container

The preferred way is to: **exec from your computer**

If you're running passbolt **not** in a container, you can just use the `send the test email` command from the passbolt directory

=== "Exec from your computer"

    === "Docker"

        Get the container name

        ```shell
        docker ps
        ```

        Send the test email

        ```shell
        docker exec -it <container> bin/cake passbolt send_test_email -r test@breadnet.co.uk
        ```

    === "Podman"

        Get the container name

        ```shell
        podman ps
        ```

        Send the test email

        ```shell
        podman exec -it <container> bin/cake passbolt send_test_email -r test@breadnet.co.uk
        ```

        Also, you're cool for using podman

=== "Shell in container"

    === "Docker"

        Get the container name

        ```shell
        docker ps
        ```

        Exec in to the container

        ```shell
        docker exec -it <conteiner> /bin/sh
        ```

        Send test email

        ```shell
        bin/cake passbolt send_test_emai -r test@breadnet.co.uk
        ```

    === "Podman"
        Get the container name

        ```shell
        podman ps
        ```

        Exec in to the container

        ```shell
        podman exec -it <conteiner> /bin/sh
        ```

        Send test email

        ```shell
        bin/cake passbolt send_test_emai -r test@breadnet.co.uk
        ```

        Also, you're cool for using podman

??? note "The old way"
    Passbolt have changed how you send emails.

    You used to do

    ```shell
    ./cake passbolt send_test_email test@breadnet.co.uk
    ```
