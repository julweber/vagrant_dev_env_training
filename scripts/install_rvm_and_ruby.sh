set -e

RUBY_VERSION_TO_INSTALL="2.4.2"
echo "Installing rvm ..."

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash

chown -R vagrant /usr/local/rvm/

echo "Finished installing rvm!"

echo "Installing ruby $RUBY_VERSION_TO_INSTALL ..."
source $HOME/.rvm/scripts/rvm || source /etc/profile.d/rvm.sh
rvm install "$RUBY_VERSION_TO_INSTALL"
rvm use "$RUBY_VERSION_TO_INSTALL" --default
gem install bundler

echo "Finished installing ruby $RUBY_VERSION_TO_INSTALL"
