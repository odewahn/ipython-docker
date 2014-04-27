# Shipyard

[Shipyard](https://github.com/shipyard/shipyard) and the [shipyard-agent](https://github.com/shipyard/shipyard-agent) are tools for managing docker images, containers, and hosts.  It will server the same role that pyxie-workers solves, but with a much better UI.  There are two parts:

* The shipyard web UI.  This is the web-based UI that shows the images, containers, and hosts.  It also provides an API that I need to explore that will allow you to launch new containers on the host machines.  There also appears to be some sort of proxying/routing capability.
* The shipyard-agent.  This is a piece of client software that runs on the host machine.  Each one "registers" with the main web-ui, and it then falls under the monitoring and API infrastructure.

The agent doesn't seem to run under boot2docker, so if you want to run this locally, do it under a vagrant image.  Bummer!

## Install shipyard interface

The shipyard web interface is easy to install, as it's all done via docker.  The instructions are at the [shipyard page](https://github.com/shipyard/shipyard).

## shipyard-agent

The shipyard-agent should run as a daemon process that both accepts requests from the web UI and returns information about running containers.  Here's how you install it:

```
sudo curl https://github.com/shipyard/shipyard-agent/releases/download/v0.3.1/shipyard-agent -L -o /usr/local/bin/shipyard-agent
sudo chmod +x /usr/local/bin/shipyard-agent
```

### Initial registration

Once it's installed, you have to register the host for the first time.  Here's the command:

```
shipyard-agent -url http://localhost:8000 -register
```

Here's a log:

```
vagrant@precise64:~$ shipyard-agent -url http://localhost:8000 -register
2014/04/25 21:08:53 Using 10.0.2.15 for the Docker Host IP for Shipyard
2014/04/25 21:08:53 If this is not correct or you want to use a different IP, please update the host in Shipyard
2014/04/25 21:08:53 Registering at http://localhost:8000
2014/04/25 21:08:54 Agent Key:  12fbd29312074d0785ac2f48aab1ce5c
vagrant@precise64:~$ 
```

Once you run this, you'll get an agent key that is used each time you start the agent, like this:

```
shipyard-agent -url http://localhost:8000 -key 12fbd29312074d0785ac2f48aab1ce5c
```

You can also run the agent in docker container, like this:

```
docker run -i -t --rm -v /var/run/docker.sock:/docker.sock -e URL=http://localhost:8000 -p 4500:4500 shipyard/agent
```