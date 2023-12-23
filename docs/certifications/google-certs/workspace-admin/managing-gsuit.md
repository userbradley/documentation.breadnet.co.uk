---
title: Managing Gsuit
reviewdate: '2022-01-01'
---

#### Enabling services for everyone

You are able to enable and disable services for everyone under the apps section. This can be configured per OU

[![image-1606743820345.png](/assets/iqQ48KLKrC2hNJ1k-image-1606743820345.png)](/assets/iqQ48KLKrC2hNJ1k-image-1606743820345.png)

This is much like AD where permissions and status is inherited from the top level.

To enable/ disable a service you select the OU and then disable it there

If only one user requires access to a service, you should add them to a group. 

You will want to create that group to have access:restricted then under the service you will need to search for it:

[![image-1606744736955.png](/assets/b7eY4DH3O7l5mvGO-image-1606744736955.png)](/assets/b7eY4DH3O7l5mvGO-image-1606744736955.png)

When creating groups:

It can and will take up to 24 hours

Groups cant be used to deny access, the order of presidence is OU then group

Access groups can contain users from any OU

Ensure you use a naming practice like ag.<name> for groups (where ag is access group)

#### Service Release Track

Google has 2 release tracks you can subscribe to:

1.  Rapid release
    1.  This is the track where releases are rolled out as soon as they are released to the public. These products have gone through the same QC as other apps but your users will see them at the same time you do.
2.  Scheduled release
    1.  (Recommended and enabled by default) this gives you extra time to train your users on things that have been released. Releases are made only on Tuesdays at least a week after the rapid release

For most gsuit orgs, you want the scheduled release track for stability. 

(see sidebar for calendar)

To edit this, it's a global option so will be under profile for the company

You can set the track for both features and products

#### Configure Common User Settings

You are able to set (as usual) settings for Gmail on a OU based structure where you can disable and enable features. This would include features like:

*   Confidential mode
*   Gmail offline
*   Mail delegation
*   Smart compiose

As usual these things can be controlled at an OU level and can have over-rides

You can enable Gmail labs which has experimental features:

[![image-1606757098863.png](/assets/h0o4TLba8od6YCyr-image-1606757098863.png)](/assets/h0o4TLba8od6YCyr-image-1606757098863.png)

#### Enable G Suite Sync for Outlook

You are able to disable and enable Synch for Outlook per OU

This can be found under 'End user access' and can be applied per OU

#### Compliance

Under Advanced settings you have the ability to create compliance settings for the users. This can be set per OU:

*   Auto deletion
*   OCR
*   Archiving 
*   Appending footer
*   Restricting domains
*   Attachment compliance
*   TLS
*   MTS-STS
*   Email routing

Here you can set rules on what to do with emails that contain certain files.

You can:

*   Modify
    *   Add headers
    *   Add subject
    *   Change route
    *   Change Recipient
    *   Bypass spam filter
    *   Remove attachments
    *   Deliver to more people
    *   Encrypt
*   Reject
*   Quarantine

From the gmail sergice settings page you cant set default language. This is set globally

Users set:

Display language for their inbox
pop3 accounts

* * *

Sharing calendars

You will want to ensure that only free and busy info is enabled for external users.

![image-1606764758712.png](/assets/AooTYe4QwdbFLMru-image-1606764758712.png)

To manage sharing you will need to edit the calendar from your account. Invite people from there and then set their permissions from that tab. 

[![image-1606765018828.png](/assets/80eCCMAfHz1QGsR0-image-1606765018828.png)](/assets/80eCCMAfHz1QGsR0-image-1606765018828.png)

*   As as admin in calendar control you can set:
    *   Highest level of sharing for externals
    *   Default level of internal sharing

* * *

#### Google Drive

You will want to set the best sharing permissions for Drive. As usual this can be done at an OU level.

You can set an option where you can share externally, but only with whitelisted domains. This is important if you run a secretive business. 

These options override all options for shared drives. 

You have the ability to transfer ownership of all documents. This is under settings for Drive and docs > transfer ownership. This can also be done under the drive API

* * *

#### Restore Deleted Files

Google keeps files for 25 days, in which you're able to restore them.

Go to the user's tab and select 'Restore data' then pick the date window and then the Application.

Once done the files will appear again. 

* * *

#### Offline access to documents

Users can be granted access to 'Offline access to documents' via OU or group as usual.

This can be found under Apps > google workspace > Settings for drive and docs > Feature and Applications > offline

Enable this for users under an OU or group. 

You will require google chrome and the offline sync plugin for this to work

* * *

#### Stream or Sync files

There are 2 ways you can access files in drive:

*   Drive file stream
    *   This streams the files from the cloud to your computer
*   Backup and Sync
    *   This is the software you've installed for google backup

This is enabled under Features and Applications 

Things to note:

You can allow file stream and backup for users. If they are running a backup whilst streaming it will ask them to stop.

If you enable download links for both, then only file stream link is allowed

* * *

#### Shared Drive Creation

Shared drive creation needs to be enabled from Sharing centre in Drive and Docs.

Login as a user then create the shared drive. 

You then can add users to the shared drive from their user profile or by creating a group and adding them there

Once created, you will want to remove access for users with full access to modify permissions

[![image-1606769464676.png](/assets/nzcVoSkDoOg3V3D9-image-1606769464676.png)](/assets/nzcVoSkDoOg3V3D9-image-1606769464676.png)
