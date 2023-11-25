---
title: Kubectl commands
---

# Kubectl commands

#### Connect to the cluster

    gcloud container clusters get-credentials <cluster name> --zone us-central1-c --project <project name>

#### Get pods

    kubectl get pods

#### Get deployment

    kubectl get deployments

#### Deploy a deployment

    kubectl create deployment <name> --image=<docker id>/<container>:<version>

#### Scale a deployment

    kubectl scale deployment <name of deployment> --replicas <how many replicas>

#### Create an LB

    kubectl expose deployment <deployment name> --type=LoadBalancer --port=<external port to expose on>

#### See services

    kubectl get services

#### Resize a node pool in the cluster

    gcloud container clusters resize <cluster anme> --node-pool <node pool name> --num-nodes=<number>

#### Enable HPA

    kubectl autoscale deployment <deployment name> --max=<max containers> --min=<number> --cpu-percent=<number>

#### Get HPA

    kubectl get hpa

#### Delete HPA

    kubectl delete hpa <hpa name>

#### Auto-scaling the cluster

    gcloud container clusters update <cluster name> --enable-autoscaling --min-nodes=<min> --max-nodes=<max>

#### Create a config map

    kubctl create configmap <name> --from-literal=<variable>=<data>

#### Describe the details of something

    kubectl describe <thing>

#### Create a secret

    kubectl create secret generic <name> --from-literal=<password name>=<password>

#### Update an image

    kubectl set image deployment <deployment name> <deployment name>=<docker hub id and version>

##### Get the service IP range

    SVCRANGE=$(echo '{"apiVersion":"v1","kind":"Service","metadata":{"name":"tst"},"spec":{"clusterIP":"1.1.1.1","ports":[{"port":443}]}}' | kubectl apply -f - 2>&1 | sed 's/.*valid IPs is //')
    echo $SVCRANGE

##### Enable Autocomplete

    source <(kubectl completion bash)

##### Update the image for the deployment

    kubectl set image deployment.v1.apps/nginx-deployment nginx=nginx:1.9.1 --record

##### View the rollout status

    kubectl rollout status deployment.v1.apps/nginx-deployment

##### View Deployment History

    kubectl rollout history deployment nginx-deployment

##### Rollback the deployment

    kubectl rollout undo deployments nginx-deployment

##### Create config map from file

    kubectl create secret generic <name> \
     --from-file=key.json=$HOME/<file>.json
