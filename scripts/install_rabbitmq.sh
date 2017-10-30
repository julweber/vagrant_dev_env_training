set -e
echo "Installing rabbitmq..."

sudo apt-get -y install rabbitmq-server

echo "Configuring rabbitmq plugins"
sudo rabbitmq-plugins enable rabbitmq_management
sudo service rabbitmq-server restart

echo "Finished installing rabbitmq!"
