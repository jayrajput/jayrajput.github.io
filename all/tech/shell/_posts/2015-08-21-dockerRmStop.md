---
title: Different between docker remove and stop
---

Docker provide both stop and rm command. I imagined Docker containers as
running processes, so had trouble understanding the difference beween stop and
rm.

Command 'docker stop' will just stop the running container but will not remove
any resources attached to it. Here resource means things like shared volumes or
forwared port.

For example, if you start a jekyll docker with local port 9300 forwarded to the
9300 port on the container

    docker run --rm --label=jekyll --label=stable --volume=$(pwd):/srv/jekyll -t -p 127.0.0.1:9300:9300 jekyll/stable jekyll s

Even if you stop the docker

     docker stop $(docker ps -a -q)

The port forwarded on the host will not be available to be used on the docker host. 
For example try running python SimpleHTTPServer on the port 9300

     python -m SimpleHTTPServer 9300

You have to remove the IP

     docker rm $(docker ps -a -q)

Once you remove the docker, you shall be able to use the local port 9300.

Note
- Since I have just one container running, I am stopping and removing all the
  docker container. You might have to remove/stop a respective docker container.
