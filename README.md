# iPython Docker

This project provides a Docker container for running Atlas projects as iPython Notebooks.  It's based on 

## Building the base docker image

To build this into an image, start boot2docker (see below) and run:

```
sudo docker build -t odewahn/ipython-docker .
```

This will create a base image that you can install content on.  Note that if you want to rebuild the image from scratch, you should use the "--no-cache" option, like this:

```
sudo docker build -t odewahn/ipython-docker .
```

## Building a content image

Use the Dockerfile.content repo to actually put content onto the base-box so that someone can view the project.  

```
docker build --no-cache -t odewahn/test2 .
docker run -i -t -p 8888:8888 odewahn/test2 /home/docker/content/start.sh
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



