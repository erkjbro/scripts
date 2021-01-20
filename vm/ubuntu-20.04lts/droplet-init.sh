#!/bin/bash

# Basic idea of getting a digital ocean droplet configured for user 'ubuntu'.
# Make sure user ubuntu has access before disconnecting root.
# Ref: https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04

adduser ubuntu && usermod -aG sudo ubuntu
ufw allow OpenSSH && ufw enable
rsync --archive --chown=ubuntu:ubuntu ~/.ssh /home/ubuntu
