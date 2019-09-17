# Ubuntu Dev Box for training/dev purposes

This vagrant setup serves as a starting point for development trainings.
It sets up a ubuntu development vm with preinstalled software packages.

# Services

The current version installs the following services on the VM:
* PostgreSQL - [Documentation](http://www.postgresql.org/docs/)
    * User: vagrant
    * Password: vagrant
* RabbitMQ - [Documentation](https://www.rabbitmq.com/documentation.html)
* MySQL - [Documentation](https://dev.mysql.com/doc/)
    * User: root
    * Password: vagrant

All services can be accessed from the host system using their default ports and the host 127.0.0.1. For a list of forwarded ports please refer to the [Vagrantfile](Vagrantfile).

For a general description about database technologies and choice please have a look [here](https://www.digitalocean.com/community/tutorials/understanding-sql-and-nosql-databases-and-different-database-models).

!!! And please never use Redis to store persistent data. Redis should be used only as a cache !!!

# Provisioned Software

* git
* Java
* Gradle
* Utilities (curl, jq, ...)

# Prerequisites

* [Install Virtualbox](https://www.virtualbox.org/wiki/Downloads) **or** [install VmWare](http://www.vmware.com/de/products/player)
* [Install Vagrant](https://www.vagrantup.com/downloads.html)

# Setup
```
# clone the repo
git clone TODO

# enter the directory
cd dev_env_training

# start the vagrant machine & provision software
vagrant up && vagrant provision

# ssh into the machine when the provisioning process has finished
vagrant ssh

# stop the machine at the end of a working day
vagrant halt
```

# Reprovisioning

When making changes to the Cheffile and Vagrantfile please reprovision the VM using the following commands:
```
vagrant up
vagrant provision
```

# Shared folders

The workspace folder is mounted to the VM under /vagrant/workspace.
Put your files (sources, ...) in this folder to be able to access the files from your guest and host systems.

# Example repository submodules

Example repositories can be cloned automatically to the workspace/examples directory.

```
# display status for submodules
git submodule status

# initialize git submodules
git submodule init
git submodule update
```

# Troubleshooting

## Errors on reprovisioning

Error message: "Shared folders that chef requires are missing ...."

    rm .vagrant/machines/default/virtualbox/synced_folders
    vagrant reload --provision

## Operating behind a Proxy

### Install the vagrant-proxyconf plugin


    # if using a proxy:
    # important: url encode user and password
    export https_proxy="http://<user>:<password>@proxy_host:proxy_port"
    export http_proxy="http://<user>:<password>@proxy_host:proxy_port"

    $> vagrant plugin install vagrant-proxyconf

### Add the proxy configuration to your Vagrantfile

    if Vagrant.has_plugin?("vagrant-proxyconf")
      config.proxy.http     = "http://192.168.0.2:3128/" # exchange correct http proxy here
      config.proxy.https    = "http://192.168.0.2:3128/" # exchange correct https proxy here
      config.proxy.no_proxy = "localhost,127.0.0.1,.example.com"
    end

### Configure gradle to use the proxy
You need to configure the gradle.properties file in ~/.gradle.
You can find an example configuration in the gradle.properties file.

## Windows Command log_filename

Please execute the commands above in a command line instance with administrator rights.

## SSH into the machine without using the vagrant client

You can use a normal ssh client (command line, putty, ...) to ssh into the virtual machine. The user and password is vagrant.

    ssh -p 2222  vagrant@127.0.0.1 # pw: vagrant