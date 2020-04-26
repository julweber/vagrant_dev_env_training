set -e

MYSQL_VERSION="5.5"
ROOT_PASSWORD="vagrant"

echo "Installing mysql version: $MYSQL_VERSION ..."

# set root user password
echo "mysql-server-$MYSQL_VERSION mysql-server/root_password password $ROOT_PASSWORD" | sudo debconf-set-selections
echo "mysql-server-$MYSQL_VERSION mysql-server/root_password_again password $v" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password password $ROOT_PASSWORD" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $ROOT_PASSWORD" | sudo debconf-set-selections

# install package
export DEBIAN_FRONTEND=noninteractive
sudo apt-get -y -q install mysql-server-$MYSQL_VERSION libmysqlclient-dev

sudo sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/mysql/my.cnf
sudo service mysql restart
sudo mysql -uroot -p${ROOT_PASSWORD} -e 'USE mysql; UPDATE `user` SET `Host`="%" WHERE `User`="root" AND `Host`="localhost"; DELETE FROM `user` WHERE `Host` != "%" AND `User`="root"; FLUSH PRIVILEGES;'
sudo service mysql restart


echo "Finished installing mysql!"
