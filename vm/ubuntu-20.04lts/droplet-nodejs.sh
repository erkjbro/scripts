#!/bin/bash

# Setting up a Node.js App for Production on Ubuntu 20.04 LTS
# ref: https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-ubuntu-20-04
# ref: https://github.com/nvm-sh/nvm#installing-and-updating

# Install Nodejs latest LTS version
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
nvm install --lts

# Some NPM packages need build-essential installed to complie code and etc.
sudo apt update && sudo apt upgrade -y && \
  sudo apt install build-essential

# Get your node app on the system. Either scp or git clone, whatever you need to do.

# Install PM2
sudo npm install pm2@latest -g

## Start the node app
# pm2 start index.js

# Get the app to launch on system sartup
pm2 startup systemd
sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u $USER --hp /home/$USER
pm2 save
sudo systemctl start pm2-$USER

# sudo reboot

## Set up Nginx as a Reverse Proxy Server
## Edit /etc/nginx/sites-available/$DOMAIN and then restart nginx.
# sudo nginx -t && sudo systemctl restart nginx