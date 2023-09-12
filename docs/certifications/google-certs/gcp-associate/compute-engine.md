---
title: Compute Engine
reviewdate: '2022-01-01'
---


<h4 id="bkmrk-ha">HA</h4>
<p id="bkmrk-live-migration-and-a">Live migration and availability policy</p>
<p id="bkmrk-your-running-instanc">Your running instance is migrated to another host in the same zone</p>
<p id="bkmrk-does-not-change-any-">Does not change any attributes</p>
<p id="bkmrk-supports-local-ssd%27s">Supports Local SSD's </p>
<p id="bkmrk-not-supported-for-gp">NOT supported for GPU;s</p>
<p class="callout info" id="bkmrk-it%27s-configured-unde">It's configured under Availability policy </p>
<p id="bkmrk-default-is-to-migrat">Default is to migrate </p>
<p id="bkmrk-you-can-also-configu">You can also configure terminate and automatic restart. </p>
<h4 id="bkmrk-custom-machine-types">Custom machine types</h4>
<p id="bkmrk-you-are-able-to-crea">You are able to create your own machine types and instance settings</p>
<p id="bkmrk-you-are-billed-per-v">You are billed per vcpu and memory provisioned </p>
<h4 id="bkmrk-gpu">GPU</h4>
<p id="bkmrk-you-are-able-to-add-">You are able to add a GPU to your machines</p>
<p id="bkmrk-they-are-good-for-ai">They are good for AI/ML use</p>
<p id="bkmrk-should-have-gpu-libr">Should have GPU libraries </p>
<p id="bkmrk-higher-cost">Higher cost</p>
<p id="bkmrk-not-supported-on-all">Not supported on all machine types</p>
<p id="bkmrk-cant-do-live-migrati">Cant do live migration on GPU machines. Should be terminated instance. </p>
<p id="bkmrk-%C2%A0"> </p>
<h4 id="bkmrk-important-nat-things">Important nat things to remember.</h4>
<p id="bkmrk-vm%27s-are-created-und">VM's are created underProjects </p>
<p id="bkmrk-machine-types-and-av">Machine types and avability differ from region to region</p>
<p id="bkmrk-you-can-only-change-">You can only change a machine type after the instance has stopped </p>
<p id="bkmrk-vm%27s-can-be-filtered">VM's can be filtered on the page</p>
<p id="bkmrk-they-are-zonal-so-on">They are Zonal so only run in a specific zone</p>
<p id="bkmrk-images-are-global-an">Images are global and can be added to other projects if needs be</p>
<p id="bkmrk-templates-are-global">Templates are global unless you use zonal resources </p>
<p id="bkmrk-automated-basic-moni">Automated Basic Monitoring </p>
<p id="bkmrk-%C2%A0-0"> </p>
