Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  # Configurate the virtual machine to use 4GB of RAM
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # Forward the Rails server default port to the host
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  # Forward the Spring boot default port to the host
  config.vm.network :forwarded_port, guest: 8080, host: 8080

  # Forward a second port for multi app usage
  config.vm.network :forwarded_port, guest: 8081, host: 8081

  # postgresql
  config.vm.network :forwarded_port, guest: 5432, host: 5432
  # mongodb
  config.vm.network :forwarded_port, guest: 27017, host: 27017
  config.vm.network :forwarded_port, guest: 28017, host: 28017
  # redis
  config.vm.network :forwarded_port, guest: 6379, host: 6379
  # rabbitmq
  config.vm.network :forwarded_port, guest: 5672, host: 5672
  config.vm.network :forwarded_port, guest: 15671, host: 15671
  config.vm.network :forwarded_port, guest: 25672, host: 25672

  # synced folders
  config.vm.synced_folder "workspace/", "/vagrant/workspace"

  # provisioning script execution
  config.vm.provision "shell", path: "scripts/initial_setup.sh"
  config.vm.provision "shell", path: "scripts/install_postgres.sh"
  config.vm.provision "shell", path: "scripts/install_rabbitmq.sh"
  config.vm.provision "shell", path: "scripts/install_java.sh"
end
