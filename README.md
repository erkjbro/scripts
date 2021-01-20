# SCRIPTS
A collection of scripts that are stored together for easy access. Mainly for env setups.

## MISC

1) vars.sh

Just testing an option for handling vars.

## VM

### Amazon Linux 2

1) basic-httpd.sh

This script was in an AWS course that I'm taking on Udemy. It's a simple way to get something running
on the ec2 instance that can help with testing load balancing, acs, alb, etc. Nothing fancy.

### Ubuntu 20.04 LTS

1) droplet-init.sh

Getting a new droplet setup on Digital Ocean by adding a user and granting admin privileges with access.
This isn't really necessary with EC2.

2) droplet-nginx.sh

Nginx installation and then configured with SSL using Let's Encrypt certificates.

3) droplet-nodejs.sh

Basic overall config to install node & pm2, configure systemd, update nginx, and get the app running.
