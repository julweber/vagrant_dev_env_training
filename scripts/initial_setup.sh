set -e
echo "Updating System packages..."
echo "Adding webupd8team repo for java installation"
sudo add-apt-repository -y ppa:linuxuprising/java

echo "Adding cwchien repo for gradle installation"
sudo add-apt-repository -y ppa:cwchien/gradle

echo "Adding cf cli repo"
# Add the Cloud Foundry Foundation public key and package repository to your system
wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo apt-key add -

cf_source_dir="/etc/apt/sources.list.d/cloudfoundry-cli.list"
if [ ! -f $cf_source_dir ]
then
  echo "deb http://packages.cloudfoundry.org/debian stable main" | sudo tee $cf_source_dir
fi

apt-get update
echo "Finished updating system packages!"
