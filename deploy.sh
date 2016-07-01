#!/bin/bash
cd app
mv current backup
git clone git@github.com:willrstern/semaphore-test.git current
cd current && nvm install && nvm use && npm install
pm2 delete all || true
pm2 start app.js
rm -rf ../backup
exit
