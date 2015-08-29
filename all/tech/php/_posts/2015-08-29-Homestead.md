---
title: Homestead easy install
---

If you have cygwin on your windows and are comfortable with it, Homestead
installation can be supereasy. Here are the steps to do it.

Add a vagrant box

    vagrant box add laravel/homestead

Clone the homestead git repo on your windows box

    git clone https://github.com/laravel/homestead.git Homestead	

After cloning, create the Homestead.yaml by running

    cd Homestead && bash init.sh

Update the Homestead.yaml in the ~/.homestead/Homestead.yaml as needed.
Here is how mine looks like

    ---
    ip: "192.168.10.10"
    memory: 2048
    cpus: 1
    provider: virtualbox

    authorize: ~/.ssh/id_rsa.pub

    keys:
        - ~/.ssh/id_rsa
        - ~/.ssh/id_rsa.pub

    folders:
        - map: ~/Code
          to: /home/vagrant/Code

    sites:
        - map: homestead.app
          to: /home/vagrant/Code/OnlineClinik/public

    databases:
        - homestead

    variables:
        - key: APP_ENV
          value: local

    ports:
        - send: 9300
          to: 9300
        - send: 777
          to: 777
          protocol: udp
     
The sites section is important and that is the one which sets up the nginx
server.

You are all set, run vagrant up from the Homestead folder.

References
- http://laravel.com/docs/5.0/homestead
