---
title: "Docker: Intro and notes"
reviewdate: '2022-01-01'
---

#### What are containers?

completely isolated environment. They can have their own mounts, networks and applications.
Docker runs off of lxc containers and provides a high level management interface.
Docker containers share the kernal. They can run anything on top of it (even an os) but it will have the same kernel version.

#### Why do you need it?

Allows for running services that require different versions of prereqs. Allows for cross os compatibility.

Alot of companies and programs have got their software published to [docker hub](https://bookstack.breadnet.co.uk/hub.docker.com/)

#### Install docker

    $ curl -fsSL https://get.docker.com -o get-docker.sh
    $ sudo sh get-docker.sh

     sudo usermod -aG docker your-user

Done!

You can check the docker verson using
`sudo docker version`

Nhow we can see if it works by running:

    docker pull docker/whalesay

Which pulls a docer image from the previous mentioned docker hub. called Whale say.

    sudo docker run docker/whalesay cowsay hello

which looks like this!

    root@DocketHost:~/docker/graphhopper# sudo docker run docker/whalesay cowsay hello
     _______
    < hello >
     -------
        \
         \
          \
                        ##        .
                  ## ## ##       ==
               ## ## ## ##      ===
           /""""""""""""""""___/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
           \______ o          __/
            \    \        __/
              \____\______/

now we know docker is working

#### Run docker containers

Running `docker run <name>` runs a docker container.

If the image is not found, it will find and pull the docker but the next time, it will use the same image you're already pulled

`docker ps` will show you info about the docker container.

To see all containers, use -a `docker ps -a`

Stopping a container

`docker stop <name or id>`

to remote a docker, `docker rm <name or id>`

To view a list of images we have on the server, run `docker images`

to remove images, use `docker rmi -f <id>`

To run a command on a docker, run `docker exec <name> command`

Running a docker image in interactive mode is achived using `docker run -i container`

and to interact with it, use `docker run -ti container`

#### Data persistance

In order to ensure that the data persists, you need to map an external folder to the docker container

    docker run -V /opt/data:/var/lib/mysql mysql

#### Create docker Image

#### Networks in docker

All containers get an internal IP address that other containers can connect to. This is all good and well for internal applications but useless for external applicaitons. In order to access the port and network of the container, we must use the  -p command which maps the port to the container

Example:

`docker run -p 80:5000 kodekloud/simple-webapp`

This maps external port 80 to internal port 5000
Seurprisingly you cant map to the same port the same time.

#### Docker compose

#### Docker concepts in depth

#### Docker for windows/ mac

#### Docker swarm

#### Docker vs k8
