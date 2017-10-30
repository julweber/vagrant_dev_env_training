set -e
echo "Updating System packages..."
echo "Adding webupd8team repo for java installation"
sudo add-apt-repository ppa:webupd8team/java

echo "Adding cwchien repo for gradle installation"
sudo add-apt-repository ppa:cwchien/gradle

apt-get update
echo "Finished updating system packages!"
