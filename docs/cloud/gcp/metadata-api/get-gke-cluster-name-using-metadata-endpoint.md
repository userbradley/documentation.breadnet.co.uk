---
reviewdate: '2026-12-20'
title: Get GKE cluster name using GCP Metadata Endpoint
---

### Why

You need to get the cluster name in a script being run within the cluster

### How

```shell
curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/attributes/cluster-name
```

=== "Go"
    ```go
    package main

    import (
            "fmt"
            "net/http"
    )

    func main() {
            client := &http.Client{}
            req, err := http.NewRequest("GET", "http://metadata.google.internal/computeMetadata/v1/instance/attributes/cluster-name", nil)
            if err != nil {
                    panic(err)
            }
            req.Header.Add("Metadata-Flavor", "Google")
            resp, err := client.Do(req)
            if err != nil {
                    panic(err)
            }
            defer resp.Body.Close()
            fmt.Println("response Status:", resp.Status)
            // Print the response body
            buf := make([]byte, 1024)
            n, err := resp.Body.Read(buf)
            if err != nil {
                    panic(err)
            }
            fmt.Println("response Body:", string(buf[:n]))
    }
    ```

=== "Python"

    ```python
    import requests

    headers = {
        'Metadata-Flavor': 'Google'
    }

    response = requests.get('http://metadata.google.internal/computeMetadata/v1/instance/attributes/cluster-name', headers=headers)

    print(response.text)
    ```

=== "PHP"

    ```php
    <?php

    $headers = array(
        'Metadata-Flavor: Google',
    );

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, "http://metadata.google.internal/computeMetadata/v1/instance/attributes/cluster-name");
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    $response = curl_exec($ch);

    if (curl_errno($ch)) {
        echo 'Error:' . curl_error($ch);
    }

    curl_close($ch);

    echo $response;

    ?>
    ```
