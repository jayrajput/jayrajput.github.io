---
title: Jekyll on Docker
---

My company provides a really old linux OS which does not have the latest and
the greatest software on it.  Installing something on jekyll is also pain on it
because of the dependencies. So I switched to using docker. Here are the steps
to install a jekyll container. These steps are for ubuntu.

Install Docker first. Do not sudo apt-get as the Docker in the repo is old

    wget -qO- https://get.docker.com/ | sh

Clone the jekyll docker repo: 

    git clone https://github.com/jekyll/docker-jekyll.git

Build the jekyll stable image:  

    cd docker-jekyll && ./script/build stable

Run docker images to see your image:

    root@homestead:/home/vagrant/jayrajput.github.io# docker images
    REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
    jekyll/stable       latest              e48b648f89c5        10 hours ago        147.1 MB
    envygeeks/alpine    latest              864c2ab00ff6        5 days ago          17.15 MB

Run the docker daemon on your ubuntu (This needs to be run as root)

    service docker start

Run docker ps command to quick sanity check that things are fine. There will be
no output, but the command shall run fine

    root@homestead:~# docker ps
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    root@homestead:~#

Run the docker image

    docker run --rm --label=jekyll --label=stable --volume=$(pwd):/srv/jekyll jekyll/stable jekyll build

The above command maps the local directory to the /srv/jekyll in the container
and executes the 'jekyll build' command




Note

- Execute all docker command as root.


References

- http://docs.docker.com/linux/step_one/
