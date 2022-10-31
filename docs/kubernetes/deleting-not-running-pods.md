---
title: Deleting not running pods
---

# Deleting not running pods

## Why

Sometimes we can have a lot of pods that fail. A good example is on a GKE cluster running on [preemptible](https://cloud.google.com/compute/docs/instances/preemptible)
instances

The AWS Alternative is [Spot Instances](https://aws.amazon.com/ec2/spot/)

## How

=== "Default namespace"

    ```shell
    kubectl get pods --field-selector status.phase!=Running  -o name | xargs kubectl delete 
    ```

=== "Specify Namespace"

    ```shell
    kubectl get pods --field-selector status.phase!=Running -n <namespace> -o name | xargs kubectl delete -n <namespace>
    ```

    !!! note
        
        A better solution is to use something like [kubectx + kubens](https://github.com/ahmetb/kubectx)