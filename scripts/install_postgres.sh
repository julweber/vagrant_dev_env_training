set -e
echo "Installing postgres..."
sudo apt-get -y install postgresql postgresql-contrib

# create vagrant user
sudo -u postgres bash -c "psql -c \"CREATE USER vagrant WITH SUPERUSER PASSWORD 'vagrant';\"" || true

# configure access
echo "Configuring access"
sudo echo "host    all             all             0.0.0.0/0            password" > /etc/postgresql/9.3/main/pg_hba.conf
sudo echo "local   all             all                                     peer" >> /etc/postgresql/9.3/main/pg_hba.conf

if sudo grep -Fxq "listen_addresses='*'" /etc/postgresql/9.3/main/postgresql.conf
then
  echo "Setting listen_addresses to *"
  sudo echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf
fi

# restart postgres
sudo /etc/init.d/postgresql restart

echo "Finished installing postgres: Added user superuser vagrant"
