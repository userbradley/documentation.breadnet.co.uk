---
title: Jellyfin using S3 and Docker
reviewdate: '2022-01-01'
---

!!! warning "DO NOT USE"
    THIS IS ONLY MIGRATED TO KEEP LINKS ALIVE, AND SHOULD NEVER BE USED. IT'S INSECURE AND DOES NOT FOLLOW BEST PRACTICES.



Comment: 3rd May 2020: After running this for a few days it's come to my attention that for this to be viable and be able to transcode you will need a slightly more powerful host. Whilst this does feel like a kick in the nuts, its not. There are lots of technologies that still work here.

##### You will need:

1.  S3 compatible bucket - I suggest wasabi, but you can also use Min.io if you're in to FOSS (wasabi has a 30 day free 1tb trial)
2.  Cloud vps somewhere with reasonable connection and sub 20ms ping to the bucket location. Not needed but is nice. Internet should be around 30mbps at min
3.  Ability to read and copy and paste.

##### The first step

First we will spin up a digital ocean droplet, but you can use what ever VPS provider you want. 

Once the VPs is up, and you're logged in run the below to update the sources and crap. should not take too long.

    sudo apt-get update && sudo apt-get upgrade

Once that's done, install rclone

    sudo apt-get install rclone

Now we need to configure the s3 bucket. I am using wasabi like I said to begin with, but some parts are universal to all s3 compatible storage options. 

Login to wasabi console at [https://console.wasabisys.com](https://console.wasabisys.com)  

Once logged in, go to buckets and create bucket - name it what you want. call it Jeff for all I care :)

Now that your bucket is created, we need to create a policy that will later be applied to a user. 

Go to policies on the left hand nav bar and create new policy (top right)

Name your policy something like jeff-RO (where the appending characters reference the permissions, here it's Read Only)

The below policy is full access to that bucket.

    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Principal": {
            "AWS": "*"
          },
          "Action": [
            "s3:GetBucketLocation",
            "s3:ListBucket",
            "s3:ListBucketMultipartUploads"
          ],
          "Resource": "arn:aws:s3:::jeff"
        },
        {
          "Effect": "Allow",
          "Principal": {
            "AWS": "*"
          },
          "Action": "s3:GetObject",
          "Resource": "arn:aws:s3:::jeff/*"
        }
      ]
    }

Below is full rw access

    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Action": "s3:ListAllMyBuckets",
          "Resource": "arn:aws:s3:::*"
        },
        {
          "Effect": "Allow",
          "Action": "s3:*",
          "Resource": [
            "arn:aws:s3:::jeff",
            "arn:aws:s3:::jeff/*"
          ]
        }
      ]
    }

Once your policy is created you can now move on to creating the user.


Go to users and then click 'create user' and follow though the prompts.

Click API access:

![](https://documentation.breadnet.co.uk/uploads/images/gallery/2020-04/scaled-1680-/eUOCt0FHrAKXglAR-image-1588290555247.png)

Now follow though the prompts till you get to the end. Don't click anything as it will then pop up with the keys. Click download. 

Now we can go to the vps we created (or pre-existed) and start with the docker setup and eventually rclone.

Install dooker with:


    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    sudo apt-get install docker-compose

Once that is installed pull the jellyfin docker image 

    docker pull jellyfin/jellyfin

Create 3 folders in a jellyfin folder. I like mine to be like the below

(don't worry about that file, that's next)

    .
    └── docker
        └── jellyfin
            ├── docker-compose.yml
            └── files
                ├── cache
                ├── config
                └── media

    6 directories, 1 file


Create a file called docker-compose.yml and paste the below in to it:
(anything encased in <> should be changed to map to your folders)

    version: "3"
    services:
     jellyfin:
      image: jellyfin/jellyfin
      user: 1000:1000
      network_mode: "host"
      volumes:
        - </path/to/config>:/config
        - </path/to/cache>:/cache
        - </path/to/media>:/media

Now we need to sort the rclone business out.

For this I suggest using screen.

It can be opened by typing screen in a shell session (over ssh to the server) 

![](https://documentation.breadnet.co.uk/uploads/images/gallery/2020-05/scaled-1680-/xqqlZDCLo7N0MB9f-image-1588291310783.png)
If it opens, close it with Ctrl + a + d (the `a` key followed by the `d` key)

If it gives you issues about not having it installed run
sudo apt-get install screen -y

Now we need to set up rclone

    cd ~/.config

    mkdir rclone

    cd rclone

    nano rclone.conf

    [media]
    type = s3
    env_auth =
    access_key_id = <first key in .csv file from user creation>
    secret_access_key = <second key from user creation>
    region =
    endpoint = https://s3.eu-central-1.wasabisys.com #if using a europe bucket, else; See below for specifics
    location_constraint =
    acl =
    server_side_encryption =
    storage_class =

    ####You don't need to copy this in to the file, it's in reference to line 7###
    #Wasabi US East 1 (N. Virginia): s3.wasabisys.com or s3.us-east-1.wasabisys.com
    #Wasabi US East 2 (N. Virginia): s3.us-east-2.wasabisys.com
    #Wasabi US West 1 (Oregon): s3.us-west-1.wasabisys.com
    #Wasabi EU Central 1 (Amsterdam): s3.eu-central-1.wasabisys.com

Test this by going to the wasabi interface and uploading something to the bucket.

then do

    rclone ls media:<bucket name, probably jeff>

Should return the file name.
If you have issues, contact me. You can email me at the webmaster email address and I'll be happy to help where I can.

Next we need to map the bucket to a folder.

Open screen by typing `screen   `Change directory to the media folder you created erlier and run:

    rclone mount media:<bucket name> media --allow-others

It may throw back an error about using --allow-others, but just do what the command says and edit the file, remove the # in from of the `allow_others` or what's closest in the file.

It should return nothing if it worked. Press ctrl + a + d

try ls on the media folder. We should see the file we uploaded from earlier. 

Now we can build the jellyfin docker image what's it. 

In the folder where the docker-compose.yml file exists, run:

    docker-compose up

If all went well it should spin up, and then you can visit the IP address for the vm you're working on with the jellyfin port number and then add the media like you would usually:

![](https://documentation.breadnet.co.uk/uploads/images/gallery/2020-05/scaled-1680-/9W1mq4mymSV0sKft-image-1588292228032.png)

I suggest you create the folders though wasabi webui and upload the files there if you're not 100% with rclone.

That should be it. Let it whir away and it should be all fine and dandy. 

This is the VPS status for usage and disk usage:

![](https://documentation.breadnet.co.uk/uploads/images/gallery/2020-05/scaled-1680-/gSzylkkvNrHlBaLC-image-1588292772671.png)

Like I said, if there's any issues or you're confused to me, reach out to me on Reddit or email!
