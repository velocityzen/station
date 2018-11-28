source /etc/os-release
export APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=yes
apt-get update && apt-get -y upgrade

# create deployer user
export passhash=$(perl -e 'print crypt($ARGV[0], "password")' $PASSWORD)
useradd --shell /bin/bash --user-group --groups sudo -m -p $passhash deployer

# firewall
ufw allow ssh && ufw allow 80/tcp && ufw allow 443/tcp && ufw --force enable

# time sync
apt-get -y install ntp

# nginx
source /etc/lsb-release && echo -e "deb http://nginx.org/packages/ubuntu $VERSION_CODENAME nginx \ndeb-src http://nginx.org/packages/ubuntu $VERSION_CODENAME nginx" | tee /etc/apt/sources.list.d/nginx.list
curl -sL http://nginx.org/keys/nginx_signing.key | apt-key add -

# nodejs
curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -

# certbot
add-apt-repository -y ppa:certbot/certbot

# rethinkdb
# source /etc/lsb-release && echo "deb https://dl.bintray.com/rebirthdb/apt $VERSION_CODENAME main" | sudo tee /etc/apt/sources.list.d/rebirthdb.list
# wget -qO- https://dl.bintray.com/rebirthdb/keys/pubkey.gpg | sudo apt-key add -

# install
apt-get update && apt-get -y install build-essential nodejs git-core nginx python-certbot-nginx #rethinkdb
