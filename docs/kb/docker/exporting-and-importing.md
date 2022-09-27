---
title: Exporting and importing
outdated: true
---

<p id="bkmrk-sometimes-you-will-n">Sometimes you will need to export an image as a zip file because you cant commit it to a repo</p>
<pre id="bkmrk-docker-export-%3Cimage"><code class="language-">docker export &lt;image&gt;:&lt;tag&gt; -o &lt;image&gt;.zip</code></pre>
<p id="bkmrk-copy-the-file-where-">Copy the file where ever you need it to be done</p>
<p id="bkmrk-when-importing-it-do">When importing it doesnt pull over the run command, just the file sytem.</p>
<p id="bkmrk-we-need-to-import-it">We need to import it differently</p>
<pre id="bkmrk-docker-import-%5C---ch"><code class="language-">docker import \                       
--change 'CMD ["command", "goes", "here"]' \
&lt;file&gt;.zip &lt;image&gt;:&lt;tag&gt;</code></pre>
<p id="bkmrk-if-you%27re-still-havi">if you're still having issues, try</p>
<pre id="bkmrk-docker-load-%3C-%3Cfile%3E"><code class="language-">docker load &lt; &lt;file&gt;.zip</code></pre>