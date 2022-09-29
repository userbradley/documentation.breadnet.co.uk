---
title: Formatting drive and auto mount
outdated: true
---


<h2 id="bkmrk-list-logical-disks-a">List logical disks and partitions</h2>
<p id="bkmrk-sudo-fdisk--l"><code>sudo fdisk -l</code></p>
<h2 id="bkmrk-partition-the-disk">
<a id="bkmrk-" class="anchor" href="https://gist.github.com/keithmorris/b2aeec1ea947d4176a14c1c6a58bfc36#partition-the-disk" aria-hidden="true"><svg class="octicon octicon-link" viewbox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"></svg></a>Partition the disk</h2>
<p id="bkmrk-sudo-fdisk-%2Fdev%2Fsdb"><code>sudo fdisk /dev/sdb</code></p>
<ul id="bkmrk-press%C2%A0n%C2%A0to-create-a-">
<li>Press <code>n</code> to create a partition</li>
<li>Press <code>p</code> or <code>l</code> to create primary or logical partitions</li>
<li>Press <code>w</code> to write your changes or <code>q</code> to quit</li>
</ul>
<h2 id="bkmrk-format-the-partition">
<a id="bkmrk--0" class="anchor" href="https://gist.github.com/keithmorris/b2aeec1ea947d4176a14c1c6a58bfc36#format-the-partition" aria-hidden="true"><svg class="octicon octicon-link" viewbox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"></svg></a>Format the partition</h2>
<ul id="bkmrk-sudo-mkfs--t-ext4-%2Fd">
<li><code>sudo mkfs -t ext4 /dev/sdb1</code></li>
<li>
<code>sudo mkfs -t ext4 -N 2000000 /dev/sdb1</code> - This will manually set the number of inodes to 2,000,000</li>
</ul>
<h2 id="bkmrk-mount-disk">
<a id="bkmrk--1" class="anchor" href="https://gist.github.com/keithmorris/b2aeec1ea947d4176a14c1c6a58bfc36#mount-disk" aria-hidden="true"><svg class="octicon octicon-link" viewbox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"></svg></a>Mount disk</h2>
<ul id="bkmrk-mount%C2%A0--shows-what-i">
<li>
<code>mount</code> - Shows what is mounted</li>
<li><code>mkdir /mnt/mydrive</code></li>
<li><code>mount -t ext4 /dev/sdb1 /mnt/mydrive</code></li>
</ul>
<h2 id="bkmrk-get-disk%27s-uuid">
<a id="bkmrk--2" class="anchor" href="https://gist.github.com/keithmorris/b2aeec1ea947d4176a14c1c6a58bfc36#get-disks-uuid" aria-hidden="true"><svg class="octicon octicon-link" viewbox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"></svg></a>Get disk's UUID</h2>
<p id="bkmrk-ls--al-%2Fdev%2Fdisk%2Fby-"><code>ls -al /dev/disk/by-uuid/</code><br>or<br><code>blkid</code></p>
<h2 id="bkmrk-mount-at-boot">
<a id="bkmrk--3" class="anchor" href="https://gist.github.com/keithmorris/b2aeec1ea947d4176a14c1c6a58bfc36#mount-at-boot" aria-hidden="true"><svg class="octicon octicon-link" viewbox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"></svg></a>Mount at boot</h2>
<p id="bkmrk-add-the-following-li">Add the following line to your <code>/etc/fstab</code> file adjusting the UUID to your device's id and the directory to where you want to mount:</p>
<p id="bkmrk-uuid%3D811d3de0-ca6b-4"><code>UUID=811d3de0-ca6b-4b61-9445-af2e306d9999 /mnt/mydrive ext4 defaults 0 0</code></p>
<p id="bkmrk-mount--a%C2%A0--remounts-"><code>mount -a</code> - remounts filesystems from <code>/etc/fstab</code></p>