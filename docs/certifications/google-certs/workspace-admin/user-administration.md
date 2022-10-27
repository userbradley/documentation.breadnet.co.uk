---
title: Gsuit - User administration
outdated: true
---

# Gsuit - User administration

<p id="bkmrk-global-info-can-be-s">Global info can be set under `Account settings` but this has changed from `Company profile` </p>
<p id="bkmrk-%C2%A0"> </p>
<h5 id="bkmrk-users">Users</h5>
<p id="bkmrk-creating-users-can-b">Creating users can be done using:</p>
<ul id="bkmrk-csv-upload-click-and">
<li>CSV upload</li>
<li>Click and point</li>
<li>SDK API</li>
<li>Google cloud directory sync (GCDS)</li>
</ul>
<p id="bkmrk-for-the-csv-upload-i">For the CSV upload it can take up to 24 hours for the users to appear as being searchable</p>
<p id="bkmrk-if-you-are-uploading">If you are uploading more than 500 users, you should split the files in to smaller lots of around 300 give or take users for concurrent processing</p>
<p id="bkmrk----">---</p>
<h5 id="bkmrk-sync-users-with-gsui">Sync users with GSuit using GCDS</h5>
<p id="bkmrk-you-are-able-to-sync">You are able to sync gsuit with Microsoft active directory, or ldap server. it allows you to ensure that gsuit groups and contacts and users remain in sync</p>
<p id="bkmrk-updates-only-flow-up">Updates only flow up to google. Google does not make changes to a local directory</p>
<p id="bkmrk-configuration-files-">Configuration files are stored as XML</p>
<p id="bkmrk-you-need-to-download">You need to download software on the microsoft server</p>
<p id="bkmrk-%C2%A0-0"> </p>
<p id="bkmrk-under-google-domain-">Under google domain config, you add the primary domain name, then select to replace users emails and domains </p>
<p id="bkmrk-if-it-fails%3A">If it fails:</p>
<p id="bkmrk-ensure-code-is-corer">Ensure code is corerct</p>
<p id="bkmrk-no-spaces">No spaces</p>
<p id="bkmrk-computer%27s-time-zone">Computer's time zone is correct</p>
<p id="bkmrk-%C2%A0-1"> </p>
<p id="bkmrk-you%27re-able-to-limit">You're able to limit users by adding an exclusion rule. </p>
<p id="bkmrk-ldap-is-the-single-s"><span style="background-color: #ff0000;">Ldap is the single source of truth so exclude admin </span></p>
<p id="bkmrk-chose-what-to-sync.-">Chose what to sync. E</p>
<p id="bkmrk-ensure-that-you-sele">Ensure that you select 'Dont suspend or delete google domain admins not found in ldap'</p>
<p id="bkmrk-you-can-now-synch-pa">You can now synch passwords with AD, but can use Gsuit password synch </p>
<p id="bkmrk-%C2%A0-2"> </p>
<p id="bkmrk-you-can-setup-a-sear">You can setup a search rule, but with AD you can select to use defaults. </p>
<p id="bkmrk-if-your-delete-and-s">If your delete and suspend limits excheed you will get an error</p>
<p id="bkmrk-%C2%A0-3"> </p>
<p id="bkmrk-%60sync--c-file.xml%60-d">`sync -c file.xml` does a dry run</p>
<p id="bkmrk-%60sync--c-file.xma--a">`sync -c file.xma -a` runs a full sync</p>
<p id="bkmrk-%C2%A0-4"> </p>
<p id="bkmrk-----0">---</p>
<h5 id="bkmrk-groups">Groups</h5>
<p id="bkmrk-%C2%A0-5"> </p>
<p id="bkmrk-there-are-2-types-of">There are 2 types of groups:</p>
<ul id="bkmrk-admin-console-groups">
<li>Admin console groups : Groups used from collaboration, communiation and administratiom
<ul>
<li>Only managed by admins</li>
</ul>
</li>
<li>Groups for business : Groups for communication and collab (managed from groups.google.com)
<ul>
<li>Managed by users and admins</li>
</ul>
</li>
</ul>
<p id="bkmrk-for-a-user-to-be-abl">For a user to be able to email a group, you need to have the users who will want to email people set as a maanger:</p>
<p id="bkmrk-"><a href="/assets/2mznsOlbTSNaaAcI-image-1604671927789.png" target="_blank" rel="noopener"><img src="/assets/2mznsOlbTSNaaAcI-image-1604671927789.png" alt="image-1604671927789.png"></a></p>
<p id="bkmrk-----1">---</p>
<h5 id="bkmrk-licensing%C2%A0">Licensing </h5>
<p id="bkmrk-you-must-assign-a-li">You must assign a license to a use, how ever if you use gsuit enterprise it's automatic</p>
<p id="bkmrk-suspended-users-will">Suspended users will not be able to login and will not get emails or calendar invites</p>
<p id="bkmrk-----2">---</p>
<h5 id="bkmrk-organisational-units">Organisational units </h5>
<p id="bkmrk-you-are-able-to-assi">You are able to assign users to an OU much like how you would in Active Directiory</p>
<p id="bkmrk-you-need-tos-et-the-">You need tos et the top level to off then maange per OU</p>
<p id="bkmrk-----3">---</p>
<h5 id="bkmrk-directory-overview">Directory overview</h5>
<p id="bkmrk-directories-allow-ad">Directories allow adding custom fields to users as well as a 'virtual card' about that user so people can see stuff like location etc</p>
<p id="bkmrk-this-can-also-be-man">This can also be managed per OU</p>
<p id="bkmrk-you-can-populate-use">You can populate users profiles as well as create custom directories </p>
<p id="bkmrk-you-can-add-external">You can add external vendors as well</p>
<p id="bkmrk-this-is-used-for-use">This is used for users cards to help with booking meeting rooms</p>
<p id="bkmrk-you-can-populate-inf">You can populate info through:</p>
<ul id="bkmrk-cloud-sync-google-us">
<li>Cloud sync</li>
<li>Google user management</li>
<li>Admin SDK</li>
</ul>
<p id="bkmrk-to-set-different-acc">To set different access to directories you can use OU's:</p>
<p id="bkmrk-you-can-contain-cust">You can contain custom directories, create a google group, then add the group to the directories.</p>
<p id="bkmrk--0"><a href="/assets/rG2Sxc83fg9oyJVi-image-1605010726509.png" target="_blank" rel="noopener"><img src="/assets/rG2Sxc83fg9oyJVi-image-1605010726509.png" alt="image-1605010726509.png"></a></p>
<p id="bkmrk-%C2%A0-6"> </p>
<p id="bkmrk-%C2%A0-7"> </p>
<p id="bkmrk-%C2%A0-8">Enable direcotry editing by going to Directory &gt; directory settings </p>
<p id="bkmrk-here-you-can-enable-">Here you can enable things that people are able to edit. </p>
<p id="bkmrk-%C2%A0-9"> </p>
<p id="bkmrk-%C2%A0-10"> </p>
<p id="bkmrk-as-usual-you-can-ass">As usual you can assign this based on an OU system<a href="/assets/GJIc7rJptYTmXzfh-image-1606735635793.png" target="_blank" rel="noopener"><img src="/assets/GJIc7rJptYTmXzfh-image-1606735635793.png"></a></p>
<p id="bkmrk-%C2%A0-11"> </p>
<p id="bkmrk-you-should-add-work-">You should add work location so GCal can see where they are and suggest meeting rooms for users.</p>
<p id="bkmrk-if-you-add-in-the-em">If you add in the employee ID then you can use this as a login verification </p>
<p id="bkmrk-%C2%A0-12"> </p>
<p id="bkmrk-if-you-are-creating-">If you are creating a user that should not be able to see the whole directory, you will need to add them to an OU (create one if not already done) then a group, then your custom directory.</p>
<p id="bkmrk-%C2%A0-13"> </p>
<p id="bkmrk-first-create-a-new-o">First create a new OU</p>
<p id="bkmrk-create-the-group-for">Create the group for the OU</p>
<p id="bkmrk-create-the-users">Create the users</p>
<p id="bkmrk-add-the-users-to-the">Add the users to the group as a manager</p>
<p id="bkmrk-go-to-the-ou-under-d">Go to the OU under Directory Settings &gt; visibility settings </p>
<p id="bkmrk-set-it-as-%60users-in-">Set it as `Users in a custom directory` then create new and name it then add a group to it:</p>
<p id="bkmrk--1"><a href="/assets/qtFenCGbLvRUVQqs-image-1606738550809.png" target="_blank" rel="noopener"><img src="/assets/qtFenCGbLvRUVQqs-image-1606738550809.png" alt="image-1606738550809.png"></a></p>
<p id="bkmrk-this-is-a-change-tha">This is a change that takes up to 24 hours to process</p>
<p id="bkmrk-%C2%A0-14">---</p>
<p id="bkmrk-%C2%A0-15"> </p>
<p id="bkmrk-shared-contacts">Shared contacts</p>
<p id="bkmrk-during-business-oper">During business operations you will deal with external vendors frequently and can add them to your directory for all users that can see that directory, to be able to see details about them.</p>
<p id="bkmrk-users-have-their-own">Users have their own contacts that are not shared with the org.</p>
<p id="bkmrk-----4">---</p>
<p id="bkmrk-%C2%A0-16"> </p>
<p id="bkmrk-admin-roles%3A">Admin roles:</p>
<p id="bkmrk-admin-roles-are-role">Admin roles are roles given to an admin that allows them to perform actions in the gsuit org. You can give a user roles to manage users or to the whole domain</p>
<p id="bkmrk-to-assign-an-admin-r">To assign an admin role you can select the user's account under admin.google.com then assign roles.</p>
<p id="bkmrk--2"><a href="" target="_blank" rel="noopener"><img src="/assets/lHFWdtVTkMX6AX5G-image-1606740965114.png" alt="image-1606740965114.png"></a></p>
<p id="bkmrk-you-can-not-edit-the">You can not edit the pre-set roles, but you can create custom roles based off of the pre-defined options</p>
<p id="bkmrk-super-admin-can-do-a">Super admin can do all operations</p>
<p id="bkmrk-help-desk-admin-can-">Help desk admin can reset passwords for the users</p>
<p id="bkmrk-things-to-note%3A">Things to note:</p>
<ol id="bkmrk-the-more-administrat">
<li>The more administrators you have, the more it affects your account recovery options</li>
<li>Ensure you trust the users you are giving access to admin and ensure 2fa is enforced</li>
</ol>
<p id="bkmrk-%C2%A0-17"> </p>
<p id="bkmrk-like-previously-ment">Like previously mentioned you are able to create custom roles. To do so, go to the admin page then users then roles, then create new role:</p>
<p id="bkmrk--3"><a href="/assets/goQwxsbjB33Z1ZN1-image-1606741677022.png" target="_blank" rel="noopener"><img src="/assets/goQwxsbjB33Z1ZN1-image-1606741677022.png" alt="image-1606741677022.png"></a></p>
<p id="bkmrk-%C2%A0-18"> </p>
<p id="bkmrk-you-from-here-can-se">You from here can select what roles to assign to the role. </p>
<p id="bkmrk-you-want-to-create-m">You want to create more roles with less privileges to assign to a user than one fat rule.</p>
<p id="bkmrk-%C2%A0-19"> </p>
<p id="bkmrk-%C2%A0-20"> </p>
<p id="bkmrk-%C2%A0-21"> </p>