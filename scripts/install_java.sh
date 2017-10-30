set -e
echo "Installing Java and Gradle..."
sudo apt-get install -y software-properties-common
sudo echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
sudo echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections

sudo apt-get install -y oracle-java8-installer
sudo apt-get -y install gradle

if sudo grep -Fxq "/usr/lib/jvm/java-8-oracle" /etc/environment
then
  echo "Setting JAVA_HOME in /etc/environment"
  sudo echo "JAVA_HOME=\"/usr/lib/jvm/java-8-oracle\"" >> /etc/environment
fi
source /etc/environment
echo "JAVA_HOME now set to: $JAVA_HOME"

echo "Finished installing Java and Gradle!"
