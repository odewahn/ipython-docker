# iPython Docker

This project provides a Docker container for running Atlas projects as iPython Notebooks.  It's based on the [ipython-notebox VM](https://github.com/odewahn/ipython-notebox).

## Overview

The goal of this project is to create a smooth way to deploy [Atlas](https://atlas.oreilly.com) projects into a live coding environment.  The approach is:

* You create a project in Atlas
* You mark a code sample as "executable"
* The project is converted into an ipython-notebook using the [atlas2ipynb](https://github.com/odewahn/atlas2ipynb) gem
* The content is packaged onto a Docker base image to make a new "content" image

This repo has the Dockerfiles required for this to work.  There are two folders:

* The *base* folder.  This folder contains a Dockerfile that installs the ipyhton notebook server and its dependencies, the atlas-api and atlas2ipynb gems, and the various other tools.
* The *content* folder.  This folder contains a Dockerfile that will build a content image.  It inherits from the base box, and then installs a content project on the image using the atlas2ipynb gem.  You can also add additional dependencies here that might be specifically required by the project.  

You build the content image for your Atlas project, and then run it locally (see boot2docker below) or push it to a cloud system like [pyxie](http://www.pyxie.io).

## Building the base docker image

To build this into an image, start boot2docker (see below) and run:

```
git clone https://github.com/odewahn/ipython-docker.git
cd ipython-docker/base
sudo docker build -t odewahn/ipython-docker .
```

This will create a base image that you can install content on.  Note that if you want to rebuild the image from scratch, you should use the "--no-cache" option, like this:

```
sudo docker build --no-cache -t odewahn/atlas-base .
```

## Building a content image

Use the Dockerfile.content repo to actually put content onto the base-box so that someone can view the project.  

```
git clone https://github.com/odewahn/ipython-docker.git
cd ipython-docker/content
docker build --no-cache -t odewahn/test2 .
docker run -i -t -p 8888:8888 odewahn/test2 /home/atlas/content/start.sh
```


## Running under boot2docker

The first step is to install or upgrade boot2docker.  

https://github.com/boot2docker/boot2docker

Installation is pretty simple, but upgrading is a bit of a pain.  This is a great post on how to do it:

http://blog.javabien.net/2014/03/17/upgrade-docker-and-boot2docker-on-osx/

## Starting boot2docker for the first time

Use the following command to start the VM.  

```
boot2docker up
```

Once the VM starts (it takes about a minute or so), you also need to expose port 8888 in Virtualbox so that the user will be able to access the machine from his or her browser.  Here's the command to use: 

```
VBoxManage controlvm boot2docker-vm natpf1 "ipython-notebook,tcp,127.0.0.1,8888,,8888"
```

You can also expose the port from the Virtualbox GUI by going to the VMs "Settings -> Network -> Advanced -> Port Forwarding".  There's a little "+" icon you can click to enter the same info.

## Logging into the box

```
boot2docker ssh
```

The default password for the boot2docker machine is *tcuser*.

Once you're in, you can log into the docker index and pull down some images:

```
docker login
docker pull username/image-name
```

Then, once you're at a command prompt, you can start a container, like this:

```
docker run -i -t -p 8888:8888 odewahn/ipython-docker /bin/bash
```



