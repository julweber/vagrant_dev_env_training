set -e

HOME=/home/vagrant
JAVA_VERSION="14"

echo "Installing Java and Gradle..."
echo "Installing Java version: $JAVA_VERSION ..."

sudo echo "oracle-java$JAVA_VERSION-installer shared/accepted-oracle-licence-v1-2 boolean true" | sudo debconf-set-selections
sudo echo "oracle-java$JAVA_VERSION-installer shared/accepted-oracle-license-v1-2 select true" | sudo debconf-set-selections

sudo apt-get install -y software-properties-common oracle-java${JAVA_VERSION}-installer gradle
sudo apt-get install -y oracle-java${JAVA_VERSION}-set-default

if ! sudo cat $HOME/.bashrc | grep "JAVA_HOME"
then
  echo "Setting JAVA_HOME in $HOME/.bashrc"
  sudo echo "JAVA_HOME=\"/usr/lib/jvm/java-${JAVA_VERSION}-oracle\"" >> $HOME/.bashrc
fi
source $HOME/.bashrc
echo "JAVA_HOME now set to: $JAVA_HOME"

echo "Finished installing Java and Gradle!"
