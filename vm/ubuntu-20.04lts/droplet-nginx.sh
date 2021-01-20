#!/bin/bash

# Example. Provide a non-www domain.
# sh droplet-nginx.sh 'example.com'

# WARNING: Don't run this script. It's just a summary of the steps needed and hasn't been tested or configured.

# AFTER droplet init and DNS setup, get nginx running and then secured with Let's Encrypt.
# ref: https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04
# ref: https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-20-04

if [ $1 ]
  then DOMAIN=$1
  else read -p "Provide your_domain :" DOMAIN
fi

sudo apt update && sudo apt install nginx -y
sudo ufw app allow 'Nginx HTTP'
sudo systemctl restart nginx

# Setting up server blocks.
sudo mkdir -p /var/www/$DOMAIN/html
sudo chmod -R 755 /var/www/$DOMAIN
echo "<h1>Success! The $DOMAIN server block is working!</h1>" > /etc/nginx/sites-available/$DOMAIN

# paste in the configuration block for the server, then enable.
sudo ln -s /etc/nginx/sites-available/$DOMAIN /etc/nginx/sites-enabled/

# NOTE: for multiple servers, update the server_names_hash_bucket_size to 64 in /etc/nginx/nginx.conf

# This needs to be conditional. Only restart nginx if there aren't problems in the config.
sudo nginx -t && sudo systemctl restart nginx

## Securing Nginx with Let's Encrypt

# Install Certbot
sudo apt install certbot python3-certbot-nginx
sudo nginx -t && sudo systemctl reload nginx

# Allowing HTTPS
sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'

# Obtaining SSL Cert
sudo certbot --nginx -d $DOMAIN -d www.$DOMAIN

# Verify Certbot
sudo systemctl status certbot.timer
sudo certbot renew --dry-run
