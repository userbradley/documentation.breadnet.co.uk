---
title: Gsuit - User administration
reviewdate: '2022-01-01'
---

Global info can be set under `Account settings` but this has changed from \`Company profile\` 

##### Users

Creating users can be done using:

*   CSV upload
*   Click and point
*   SDK API
*   Google cloud directory sync (GCDS)

For the CSV upload it can take up to 24 hours for the users to appear as being searchable

If you are uploading more than 500 users, you should split the files in to smaller lots of around 300 give or take users for concurrent processing

\---

##### Sync users with GSuit using GCDS

You are able to sync gsuit with Microsoft active directory, or ldap server. it allows you to ensure that gsuit groups and contacts and users remain in sync

Updates only flow up to google. Google does not make changes to a local directory

Configuration files are stored as XML

You need to download software on the microsoft server

Under google domain config, you add the primary domain name, then select to replace users emails and domains 

If it fails:

Ensure code is correct

No spaces

Computer's time zone is correct

You're able to limit users by adding an exclusion rule. 

Ldap is the single source of truth so exclude admin 

Chose what to sync. E

Ensure that you select 'Dont suspend or delete google domain admins not found in ldap'

You can now synch passwords with AD, but can use Gsuit password synch 

You can setup a search rule, but with AD you can select to use defaults. 

If your delete and suspend limits excheed you will get an error

\`sync -c file.xml\` does a dry run

\`sync -c file.xma -a\` runs a full sync

\---

##### Groups

There are 2 types of groups:

*   Admin console groups : Groups used from collaboration, communiation and administratiom
    *   Only managed by admins
*   Groups for business : Groups for communication and collab (managed from groups.google.com)
    *   Managed by users and admins

For a user to be able to email a group, you need to have the users who will want to email people set as a maanger:

[![image-1604671927789.png](/assets/2mznsOlbTSNaaAcI-image-1604671927789.png)](/assets/2mznsOlbTSNaaAcI-image-1604671927789.png)

\---

##### Licensing 

You must assign a license to a use, however if you use gsuit enterprise it's automatic

Suspended users will not be able to login and will not get emails or calendar invites

\---

##### Organisational units 

You are able to assign users to an OU much like how you would in Active Directiory

You need tos et the top level to off then maange per OU

\---

##### Directory overview

Directories allow adding custom fields to users as well as a 'virtual card' about that user so people can see stuff like location etc

This can also be managed per OU

You can populate users profiles as well as create custom directories 

You can add external vendors as well

This is used for users cards to help with booking meeting rooms

You can populate info through:

*   Cloud sync
*   Google user management
*   Admin SDK

To set different access to directories you can use OU's:

You can contain custom directories, create a google group, then add the group to the directories.

[![image-1605010726509.png](/assets/rG2Sxc83fg9oyJVi-image-1605010726509.png)](/assets/rG2Sxc83fg9oyJVi-image-1605010726509.png)

Enable direcotry editing by going to Directory > directory settings 

Here you can enable things that people are able to edit. 

As usual you can assign this based on an OU system[![](/assets/GJIc7rJptYTmXzfh-image-1606735635793.png)](/assets/GJIc7rJptYTmXzfh-image-1606735635793.png)

You should add work location so GCal can see where they are and suggest meeting rooms for users.

If you add in the employee ID then you can use this as a login verification 

If you are creating a user that should not be able to see the whole directory, you will need to add them to an OU (create one if not already done) then a group, then your custom directory.

First create a new OU

Create the group for the OU

Create the users

Add the users to the group as a manager

Go to the OU under Directory Settings > visibility settings 

Set it as \`Users in a custom directory\` then create new and name it then add a group to it:

[![image-1606738550809.png](/assets/qtFenCGbLvRUVQqs-image-1606738550809.png)](/assets/qtFenCGbLvRUVQqs-image-1606738550809.png)

This is a change that takes up to 24 hours to process

\---

Shared contacts

During business operations you will deal with external vendors frequently and can add them to your directory for all users that can see that directory, to be able to see details about them.

Users have their own contacts that are not shared with the org.

\---

Admin roles:

Admin roles are roles given to an admin that allows them to perform actions in the gsuit org. You can give a user roles to manage users or to the whole domain

To assign an admin role you can select the user's account under admin.google.com then assign roles.

![image-1606740965114.png](/assets/lHFWdtVTkMX6AX5G-image-1606740965114.png)

You can not edit the pre-set roles, but you can create custom roles based off of the pre-defined options

Super admin can do all operations

Help desk admin can reset passwords for the users

Things to note:

1.  The more administrators you have, the more it affects your account recovery options
2.  Ensure you trust the users you are giving access to admin and ensure 2fa is enforced

Like previously mentioned you are able to create custom roles. To do so, go to the admin page then users then roles, then create new role:

[![image-1606741677022.png](/assets/goQwxsbjB33Z1ZN1-image-1606741677022.png)](/assets/goQwxsbjB33Z1ZN1-image-1606741677022.png)

You from here can select what roles to assign to the role. 

You want to create more roles with less privileges to assign to a user than one fat rule.
