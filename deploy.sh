#!/bin/bash
# chmod +x deploy.sh

##provision server
## install nvm then log out and back in
#curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash



## install git
# apt-get install git

## add a git ssh key
# echo "<key content>" > ~/.ssh/id_rsa

## clone inital repo
# git clone git@github.com:willrstern/semaphore-test.git current
# cd current && nvm install
# npm i -g pm2
ssh-keyscan -H -p 22 159.203.81.98 >> ~/.ssh/known_hosts
ssh -t -t root@159.203.81.98 << 'EOF'
  cd app
  mv current backup
  git clone git@github.com:willrstern/semaphore-test.git current
  cd current && nvm install && nvm use && npm install
  pm2 stop app && pm2 start app.js --name app
  rm -rf ../backup
  exit
EOF
