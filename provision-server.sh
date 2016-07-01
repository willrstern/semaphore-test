#provision server
# ssh into server
# install nvm then log out
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

# ssh with -A flag to forward our ssh keys
# install git
apt-get install -y git

# clone inital repo
mkdir app && cd app
git clone git@github.com:willrstern/semaphore-test.git app/current

# install current .nvmrc version of node
cd current && nvm install
# install pm2
npm i -g pm2

# add your private ssh key to semaphore and run these commands for deployment
ssh-keyscan -H -p 22 <ip address> >> ~/.ssh/known_hosts
ssh -A -t -t root@<ip address> 'bash -s' < deploy.sh
