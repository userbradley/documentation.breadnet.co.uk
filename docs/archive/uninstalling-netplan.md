---
title: Uninstalling netplan
outdated: true
---

<p id="bkmrk-hese-directions-have"><strong>These directions have been tested also to Ubuntu 18.04.1 and will very likely work also for any future release using <code>netplan</code> and <code>systemd</code>.</strong></p>
<p id="bkmrk-there%27s-no-need-at-a">There's no need at all to fiddle with GRUB nor any manual file removal. The configuration set up in <code>/etc/networking</code> files and directories <strong>will survive reboots</strong>.</p>
<p id="bkmrk-these-are-the%C2%A0verifi">These are the <strong>verified</strong> steps:</p>
<ol id="bkmrk-check-the-actual-int">
<li>Check the actual interface names you are interested in with <code>ip l</code> for the <em>links</em> (aka interfaces) and with <code>ip a</code> for addresses.</li>
<li>Install <code>ifupdown</code> with <code>sudo apt -y install ifupdown</code>.</li>
<li>Purge <code>netplan</code> with <code>sudo apt -y purge netplan.io</code>.</li>
<li>Configure <code>/etc/network/interfaces</code> and/or <code>/etc/network/interfaces.d</code> accordingly to your needs (<code>man 5 interfaces</code> can be of some help with examples).</li>
<li>Restart the <code>networking</code> service with <code>sudo systemctl restart networking; systemctl status networking</code> or <code>sudo /etc/init.d/networking restart; /etc/init.d/networking status</code>. The output of the <code>status</code> command should mention <code>active</code> as its status.</li>
<li>The command <code>ip a</code> will show whether the expected network configuration has been applied.</li>
<li>Optionally, manually purge the remants of the netplan configuration files with <code>sudo rm -vfr /usr/share/netplan /etc/netplan</code>.</li>
</ol>
<p id="bkmrk-no-reboot-is-needed-">No reboot is needed in order to "refresh" the IP configuration: it will be active as of step no.5 . In case of troubles, double check the interface names. A typical IPv4 DHCP configuration will resemble this one:</p>
<pre id="bkmrk-auto-enp0s3-iface-en"><code class="language-">auto enp0s3
iface enp0s3 inet dhcp</code></pre>
<p id="bkmrk-while-a-static-ipv4-">while a static IPv4 address can be configured like this:</p>
<pre id="bkmrk-auto-enp0s3-iface-en-0"><code class="language-">auto enp0s3
iface enp0s3 inet static
address 192.168.255.42/24
gateway 192.168.255.254
#dns-nameservers 8.8.8.8 208.67.222.222</code></pre>