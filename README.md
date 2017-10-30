# Ubuntu Dev Box for training/dev purposes

This vagrant setup serves as a starting point for development trainings.
It sets up a ubuntu development vm with preinstalled software packages.

# Services

The current version installs the following services on the VM:
* PostgreSQL - [Documentation](http://www.postgresql.org/docs/)
* RabbitMQ - [Documentation](https://www.rabbitmq.com/documentation.html)

All services can be accessed from the host system using their default ports and the host 127.0.0.1. For a list of forwarded ports please refer to the [Vagrantfile](Vagrantfile).

For a general description about database technologies and choice please have a look [here](https://www.digitalocean.com/community/tutorials/understanding-sql-and-nosql-databases-and-different-database-models).

!!! And please never use Redis to store persistent data. Redis should be used only as a cache !!!

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
