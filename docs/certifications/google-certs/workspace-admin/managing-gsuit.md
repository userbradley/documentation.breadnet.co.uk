---
title: Managing Gsuit
reviewdate: '2022-01-01'
---


<h4 id="bkmrk-enabling-services-fo">Enabling services for everyone</h4>
<!--suppress ALL -->
<p id="bkmrk-you-are-able-to-enab">You are able to enable and disable services for everyone under the apps section. This can be configured per OU</p>
<p id="bkmrk-"><a href="/assets/iqQ48KLKrC2hNJ1k-image-1606743820345.png" target="_blank" rel="noopener"><img src="/assets/iqQ48KLKrC2hNJ1k-image-1606743820345.png" alt="image-1606743820345.png"></a></p>
<p id="bkmrk-this-is-much-like-ad">This is much like AD where permissions and status is inherited from the top level.</p>
<p id="bkmrk-to-enable%2F-disable-a">To enable/ disable a service you select the OU and then disable it there</p>
<p id="bkmrk-%C2%A0"> </p>
<p id="bkmrk-if-only-one-user-req">If only one user requires access to a service, you should add them to a group. </p>
<p id="bkmrk-you-will-want-to-cre">You will want to create that group to have access:restricted then under the service you will need to search for it:</p>
<p id="bkmrk--0"><a href="/assets/b7eY4DH3O7l5mvGO-image-1606744736955.png" target="_blank" rel="noopener"><img src="/assets/b7eY4DH3O7l5mvGO-image-1606744736955.png" alt="image-1606744736955.png"></a></p>
<p id="bkmrk-when-creating-groups">When creating groups:</p>
<p id="bkmrk-it-can-and-will-take">It can and will take up to 24 hours</p>
<p id="bkmrk-groups-cant-be-used-">Groups cant be used to deny access, the order of presidence is OU then group</p>
<p id="bkmrk-access-groups-can-co">Access groups can contain users from any OU</p>
<p id="bkmrk-ensure-you-use-a-nam">Ensure you use a naming practice like ag.&lt;name&gt; for groups (where ag is access group)</p>
<p id="bkmrk-%C2%A0-0"> </p>
<p id="bkmrk-%C2%A0-1"> </p>
<h4 id="bkmrk-service-release-trac">Service Release Track</h4>
<p id="bkmrk-google-has-2-release">Google has 2 release tracks you can subscribe to:</p>
<ol id="bkmrk-rapid-release-this-i">
<li>Rapid release
<ol>
<li>This is the track where releases are rolled out as soon as they are released to the public. These products have gone through the same QC as other apps but your users will see them at the same time you do.</li>
</ol>
</li>
<li>Scheduled release
<ol>
<li>(Recommended and enabled by default) this gives you extra time to train your users on things that have been released. Releases are made only on Tuesdays at least a week after the rapid release</li>
</ol>
</li>
</ol>
<p id="bkmrk-for-most-gsuit-orgs%2C">For most gsuit orgs, you want the scheduled release track for stability. </p>
<p id="bkmrk-%28see-side-bar-for-ca">(see side bar for calendar)</p>
<p id="bkmrk-to-edit-this%2C-it%27s-a">To edit this, it's a global option so will be under profile for the company</p>
<p id="bkmrk-you-can-set-the-trac">You can set the track for both features and products</p>
<p id="bkmrk-%C2%A0-2"> </p>
<h4 id="bkmrk-configure-common-use" class="_1l2q8kho reading-header m-b-1s">Configure Common User Settings</h4>
<p id="bkmrk-%C2%A0-3"> </p>
<p id="bkmrk-you-are-able-to-set-">You are able to set (as usual) settings for Gmail on a OU based structure where you can disable and enable features. This would include features like:</p>
<ul id="bkmrk-confidential-mode-gm">
<li>Confidential mode</li>
<li>Gmail offline</li>
<li>Mail delegation</li>
<li>Smart compiose</li>
</ul>
<p id="bkmrk-as-usual-these-thing">As usual these things can be controlled at an OU level and can have over-rides</p>
<p id="bkmrk-you-can-enable-gmail">You can enable Gmail labs which has experimental features:</p>
<p id="bkmrk--1"><a href="/assets/h0o4TLba8od6YCyr-image-1606757098863.png" target="_blank" rel="noopener"><img src="/assets/h0o4TLba8od6YCyr-image-1606757098863.png" alt="image-1606757098863.png"></a></p>
<p id="bkmrk-%C2%A0-4"> </p>
<h4 id="bkmrk-enable-g-suite-sync-">Enable G Suite Sync for Outlook</h4>
<p id="bkmrk-%C2%A0-5">You are able to disable and enable Synch for Outlook per OU</p>
<p id="bkmrk-this-can-be-found-un">This can be found under 'End user access' and can be applied per OU</p>
<p id="bkmrk-%C2%A0-6"> </p>
<h4 id="bkmrk-compliance">Compliance</h4>
<p id="bkmrk-under-advanced-setti">Under Advanced settings you have the ability to create compliance settings for the users. This can be set per OU:</p>
<ul id="bkmrk-auto-deletion-ocr-ar">
<li>Auto deletion</li>
<li>OCR</li>
<li>Archiving </li>
<li>Appending footer</li>
<li>Restricting domains</li>
<li>Attachment compliance</li>
<li>TLS</li>
<li>MTS-STS</li>
<li>Email routing</li>
</ul>
<p id="bkmrk-here-you-can-set-rul">Here you can set rules on what to do with emails that contain certain files.</p>
<p id="bkmrk-you-can%3A">You can:</p>
<ul id="bkmrk-modify-add-headers-a">
<li>Modify
<ul>
<li>Add headers</li>
<li>Add subject</li>
<li>Change route</li>
<li>Change Recipient</li>
<li>Bypass spam filter</li>
<li>Remove attachments</li>
<li>Deliver to more people</li>
<li>Encrypt</li>
</ul>
</li>
<li>Reject</li>
<li>Quarantine</li>
</ul>
<p id="bkmrk-from-the-gmail-sergi">From the gmail sergice settings page you cant set default language. This is set globally</p>
<p id="bkmrk-users-set%3A">Users set:</p>
<p id="bkmrk-display-language-for">Display language for their inbox<br>pop3 accounts</p>
<p id="bkmrk-%C2%A0-7"> </p>
<hr id="bkmrk--2">
<p id="bkmrk-%C2%A0-8">Sharing calendars</p>
<p id="bkmrk-%C2%A0-9">You will want to ensure that only free and busy info is enabled for external users.</p>
<p id="bkmrk--3"><img src="/assets/AooTYe4QwdbFLMru-image-1606764758712.png" alt="image-1606764758712.png"></p>
<p id="bkmrk-%C2%A0-10">To manage sharing you will need to edit the calendar from your account. Invite people from there and then set their permissions from that tab. </p>
<p id="bkmrk--4"><a href="/assets/80eCCMAfHz1QGsR0-image-1606765018828.png" target="_blank" rel="noopener"><img src="/assets/80eCCMAfHz1QGsR0-image-1606765018828.png" alt="image-1606765018828.png"></a></p>
<p id="bkmrk-%C2%A0-12"> </p>
<ul id="bkmrk-as-as-admin-in-calen">
<li>As as admin in calendar control you can set:<br>
<ul>
<li>Highest level of sharing for externals</li>
<li>Default level of internal sharing</li>
</ul>
</li>
</ul>
<hr id="bkmrk--5">
<h4 id="bkmrk-google-drive">Google Drive</h4>
<p id="bkmrk-%C2%A0-11"> </p>
<p id="bkmrk-you-will-want-to-set">You will want to set the best sharing permissions for Drive. As usual this can be done at an OU level.</p>
<p id="bkmrk-you-can-set-an-optio">You can set an option where you can share externally, but only with whitelisted domains. This is important if you run a secretive business. </p>
<p id="bkmrk-these-options-overri">These options override all options for shared drives. </p>
<p id="bkmrk-%C2%A0-13"> </p>
<p id="bkmrk-you-have-the-ability">You have the ability to transfer ownership of all documents. This is under settings for Drive and docs &gt; transfer ownership. This can also be done under the drive API</p>
<p id="bkmrk-%C2%A0-14"> </p>
<hr id="bkmrk--6">
<p id="bkmrk-%C2%A0-15"> </p>
<h4 id="bkmrk-restore-deleted-file" class="_1l2q8kho reading-header m-b-1s">Restore Deleted Files</h4>
<p id="bkmrk-google-keeps-files-f">Google keeps files for 25 days, in which you're able to restore them.</p>
<p id="bkmrk-go-to-the-user%27s-tab">Go to the user's tab and select 'Restore data' then pick the date window and then the Application.</p>
<p id="bkmrk-once-done-the-files-">Once done the files will appear again. </p>
<hr id="bkmrk--7">
<h4 id="bkmrk-%C2%A0-16"> </h4>
<h4 id="bkmrk-offline-access-to-do">Offline access to documents</h4>
<p id="bkmrk-users-can-be-granted">Users can be granted access to 'Offline access to documents' via OU or group as usual.</p>
<p id="bkmrk-this-can-be-found-un-0">This can be found under Apps &gt; google workspace &gt; Settings for drive and docs &gt; Feature and Applications &gt; offline</p>
<p id="bkmrk-enable-this-for-user">Enable this for users under an OU or group. </p>
<p id="bkmrk-you-will-require-goo" class="callout info">You will require google chrome and the offline sync plugin for this to work</p>
<hr id="bkmrk--8">
<p id="bkmrk-%C2%A0-17"> </p>
<h4 id="bkmrk-stream-or-sync-files">Stream or Sync files</h4>
<p id="bkmrk-there-are-2-ways-you">There are 2 ways you can access files in drive:</p>
<ul id="bkmrk-drive-file-stream-th">
<li>Drive file stream
<ul>
<li>This streams the files from the cloud to your computer</li>
</ul>
</li>
<li>Backup and Sync
<ul>
<li>This is the software you've installed for google backup</li>
</ul>
</li>
</ul>
<p id="bkmrk-this-is-enabled-unde">This is enabled under Features and Applications </p>
<p id="bkmrk-things-to-note%3A">Things to note:</p>
<p id="bkmrk-you-can-allow-file-s">You can allow file stream and backup for users. If they are running a backup whilst streaming it will ask them to stop.</p>
<p id="bkmrk-if-you-enable-downlo">If you enable download links for both, then only file stream link is allowed</p>
<hr id="bkmrk--9">
<p id="bkmrk-%C2%A0-18"> </p>
<h4 id="bkmrk-shared-drive-creatio">Shared Drive Creation</h4>
<p id="bkmrk-%C2%A0-19"> </p>
<p id="bkmrk-shared-drive-creatio-0">Shared drive creation needs to be enabled from Sharing centre in Drive and Docs.</p>
<p id="bkmrk-login-as-a-user-then">Login as a user then create the shared drive. </p>
<p id="bkmrk-you-then-can-add-use">You then can add users to the shared drive from their user profile or by creating a group and adding them there</p>
<p id="bkmrk-once-created%2C-you-wi">Once created, you will want to remove access for users with full access to modify permissions</p>
<p id="bkmrk--10"><a href="/assets/nzcVoSkDoOg3V3D9-image-1606769464676.png" target="_blank" rel="noopener"><img src="/assets/nzcVoSkDoOg3V3D9-image-1606769464676.png" alt="image-1606769464676.png"></a></p>
<p id="bkmrk-%C2%A0-20"> </p>
<p id="bkmrk-%C2%A0-21"> </p>
<p id="bkmrk-%C2%A0-22"> </p>
