---
title: Kubectl commands
---

# Kubectl commands

<h4 id="bkmrk-connect-to-the-clust">Connect to the cluster</h4>
<pre id="bkmrk-gcloud-container-clu"><code class="language-">gcloud container clusters get-credentials &lt;cluster name&gt; --zone us-central1-c --project &lt;project name&gt;</code></pre>
<h4 id="bkmrk-get-pods">Get pods</h4>
<pre id="bkmrk-kubectl-get-pods"><code class="language-">kubectl get pods</code></pre>
<h4 id="bkmrk-get-deployment">Get deployment</h4>
<pre id="bkmrk-kubectl-get-deployme"><code class="language-">kubectl get deployments</code></pre>
<h4 id="bkmrk-deploy-a-deployment">Deploy a deployment</h4>
<pre id="bkmrk-kubectl-create-deplo"><code class="language-">kubectl create deployment &lt;name&gt; --image=&lt;docker id&gt;/&lt;container&gt;:&lt;version&gt;</code></pre>
<h4 id="bkmrk-scale-a-deployment">Scale a deployment</h4>
<pre id="bkmrk-kubectl-scale-deploy"><code class="language-">kubectl scale deployment &lt;name of deployment&gt; --replicas &lt;how many replicas&gt;</code></pre>
<h4 id="bkmrk-create-an-lb">Create an LB</h4>
<pre id="bkmrk-kubectl-expose-deplo"><code class="language-">kubectl expose deployment &lt;deployment name&gt; --type=LoadBalancer --port=&lt;external port to expose on&gt;</code></pre>
<h4 id="bkmrk-see-services">See services</h4>
<pre id="bkmrk-kubectl-get-services"><code class="language-">kubectl get services</code></pre>
<h4 id="bkmrk-resize-a-node-pool-i">Resize a node pool in the cluster</h4>
<pre id="bkmrk-gcloud-container-clu-0"><code class="language-">gcloud container clusters resize &lt;cluster anme&gt; --node-pool &lt;node pool name&gt; --num-nodes=&lt;number&gt;</code></pre>
<h4 id="bkmrk-enable-hpa">Enable HPA</h4>
<pre id="bkmrk-kubectl-autoscale-de"><code class="language-">kubectl autoscale deployment &lt;deployment name&gt; --max=&lt;max containers&gt; --min=&lt;number&gt; --cpu-percent=&lt;number&gt;</code></pre>
<h4 id="bkmrk-get-hpa">Get HPA</h4>
<pre id="bkmrk-kubectl-get-hpa"><code class="language-">kubectl get hpa</code></pre>
<h4 id="bkmrk-delete-hpa">Delete HPA</h4>
<pre id="bkmrk-kubectl-delete-hpa-%3C"><code class="language-">kubectl delete hpa &lt;hpa name&gt;</code></pre>
<h4 id="bkmrk-auto-scaling-the-clu">Auto-scaling the cluster</h4>
<pre id="bkmrk-gcloud-container-clu-1"><code class="language-">gcloud container clusters update &lt;cluster name&gt; --enable-autoscaling --min-nodes=&lt;min&gt; --max-nodes=&lt;max&gt;</code></pre>
<h4 id="bkmrk-create-a-config-map">Create a config map</h4>
<pre id="bkmrk-kubctl-create-config"><code class="language-">kubctl create configmap &lt;name&gt; --from-literal=&lt;variable&gt;=&lt;data&gt;</code></pre>
<h4 id="bkmrk-describe-the-details">Describe the details of something</h4>
<pre id="bkmrk-kubectl-describe-%3Cth"><code class="language-">kubectl describe &lt;thing&gt;</code></pre>
<h4 id="bkmrk-create-a-secret">Create a secret</h4>
<pre id="bkmrk-kubectl-create-secre"><code class="language-">kubectl create secret generic &lt;name&gt; --from-literal=&lt;password name&gt;=&lt;password&gt;</code></pre>
<h4 id="bkmrk-update-an-image">Update an image</h4>
<pre id="bkmrk-kubectl-set-image-de"><code class="language-">kubectl set image deployment &lt;deployment name&gt; &lt;deployment name&gt;=&lt;docker hub id and version&gt;</code></pre>
<h5 id="bkmrk-get-the-service-ip-r">Get the service IP range</h5>
<pre id="bkmrk-svcrange%3D%24%28echo-%27%7B%22a"><code class="language-">SVCRANGE=$(echo '{"apiVersion":"v1","kind":"Service","metadata":{"name":"tst"},"spec":{"clusterIP":"1.1.1.1","ports":[{"port":443}]}}' | kubectl apply -f - 2&gt;&amp;1 | sed 's/.*valid IPs is //')
echo $SVCRANGE</code></pre>
<h5 id="bkmrk-%C2%A0">Enable Autocomplete</h5>
<pre id="bkmrk-source-%3C%28kubectl-com"><code class="language-">source &lt;(kubectl completion bash)</code></pre>
<h5 id="bkmrk-update-the-image-for">Update the image for the deployment</h5>
<pre id="bkmrk-kubectl-set-image-de-0"><code class="language-">kubectl set image deployment.v1.apps/nginx-deployment nginx=nginx:1.9.1 --record</code></pre>
<h5 id="bkmrk-view-the-rollout-sta">View the rollout status</h5>
<pre id="bkmrk-kubectl-rollout-stat"><code class="language-">kubectl rollout status deployment.v1.apps/nginx-deployment</code></pre>
<h5 id="bkmrk-view-deployment-hist">View Deployment History</h5>
<pre id="bkmrk-kubectl-rollout-hist"><code class="language-">kubectl rollout history deployment nginx-deployment</code></pre>
<h5 id="bkmrk-rollback-the-deploym">Rollback the deployment</h5>
<pre id="bkmrk-kubectl-rollout-undo"><code class="language-">kubectl rollout undo deployments nginx-deployment</code></pre>
<h5 id="bkmrk-%C2%A0-0">Create config map from file</h5>
<pre id="bkmrk-kubectl-create-secre-0"><code class="language-">kubectl create secret generic &lt;name&gt; \
 --from-file=key.json=$HOME/&lt;file&gt;.json</code></pre>
<p id="bkmrk-%C2%A0-1"> </p>
<p id="bkmrk-%C2%A0-2"> </p>
<p id="bkmrk-%C2%A0-3"> </p>
