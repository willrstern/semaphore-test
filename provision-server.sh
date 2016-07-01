#provision server
# - ssh into server
# - make the project directory app/current
# - install nvm
# - install git
# - logout to finalize nvm installation

# - ssh in again
# - istall a node.js version
# - install pm2
ssh root@104.131.175.90 <<'EOF'
  mkdir app && mkdir app/current
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash
  apt-get update && apt-get install -y git
EOF

ssh -t -t root@104.131.175.90 <<'EOF'
  nvm install 6
  npm i -g pm2
  exit
EOF

## add your private ssh key to semaphore and run these commands for deployment
##    ssh-keyscan -H -p 22 <ip address> >> ~/.ssh/known_hosts
##    ssh -A -t -t root@<ip address> 'bash -s' < deploy.sh
