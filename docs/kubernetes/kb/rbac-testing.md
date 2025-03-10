---
title: Testing RBAC changes in Kubernetes
---

## Why

Sometimes we need to give a user access to a resource in Kubernetes, and don't want to have to pester them about changes we make

## Command Reference

```shell
kubectl auth can-i
```

??? note "Help"

    ```shell
    Check whether an action is allowed.

     VERB is a logical Kubernetes API verb like 'get', 'list', 'watch', 'delete', etc. TYPE is a Kubernetes resource. Shortcuts and groups will be resolved. NONRESOURCEURL is a partial URL that starts with "/". NAME is the name of a particular Kubernetes resource. This command pairs nicely with impersonation. See --as global flag.

    Examples:
      # Check to see if I can create pods in any namespace
      kubectl auth can-i create pods --all-namespaces

      # Check to see if I can list deployments in my current namespace
      kubectl auth can-i list deployments.apps

      # Check to see if I can do everything in my current namespace ("*" means all)
      kubectl auth can-i '*' '*'

      # Check to see if I can get the job named "bar" in namespace "foo"
      kubectl auth can-i list jobs.batch/bar -n foo

      # Check to see if I can read pod logs
      kubectl auth can-i get pods --subresource=log

      # Check to see if I can access the URL /logs/
      kubectl auth can-i get /logs/

      # List all allowed actions in namespace "foo"
      kubectl auth can-i --list --namespace=foo

    Options:
        -A, --all-namespaces=false:
     If true, check the specified action in all namespaces.

        --list=false:
     If true, prints all allowed actions.

        --no-headers=false:
     If true, prints allowed actions without headers

        -q, --quiet=false:
     If true, suppress output and just return the exit code.

        --subresource='':
     SubResource such as pod/log or deployment/scale

    Usage:
      kubectl auth can-i VERB [TYPE | TYPE/NAME | NONRESOURCEURL] [options]

    Use "kubectl options" for a list of global command-line options (applies to all commands).

    ```

### Current user

#### Create deployment

!!! Note
    This assumes namespace is `default`

```shell
kubectl auth can-i create deployment
```

#### Create deployment in different namespace

```shell
kubectl auth can-i create deployment --namespace bradley
```

### Other user

#### Check if current user can create deployment

```shell
kubectl auth can-i create deployment --namespace <namespace> -as <username> # (1)!
```

1. `<username>` needs to appear as it does in the `RoleBinding`

#### Get list of actions other user can do

```shell
kubectl auth can-i --list --as <username> # (1)!
```

1. `<username>` needs to appear as it does in the `RoleBinding`
