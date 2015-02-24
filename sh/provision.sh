#!/usr/bin/env bash

if [ -e "/etc/vagrant-provisioned" ];
then
    echo "Vagrant provisioning already completed. Skipping..."
    exit 0
else
    echo "Starting Vagrant provisioning process..."
fi

# Change the hostname so we can easily identify what environment we're on:
echo "nodejs-vagrant" > /etc/hostname
# Update /etc/hosts to match new hostname to avoid "Unable to resolve hostname" issue:
echo "127.0.0.1 nodejs-vagrant" >> /etc/hosts
# Use hostname command so that the new hostname takes effect immediately without a restart:
hostname nodejs-vagrant

echo "######################################"
echo "Installing CORE ......................"
echo "######################################"
# Install core components
/vagrant/sh/core.sh

echo "######################################"
echo "Installing NODEJS & NPM .............."
echo "######################################"
# Install NODEJS & NPM ( VERSION RAPIDA )
/vagrant/sh/nodejs.sh

echo "######################################"
echo "Installing BOWER & GRUNTJS & YEOMAN .."
echo "######################################"
# Install BOWER & GRUNTJS & YEOMAN
/vagrant/sh/yeoman.sh

echo "######################################"
echo "Installing MONGODB ..................."
echo "######################################"
# Install MongoDB
echo "SKIPPING MONGODB-------"
# /vagrant/sh/mongodb.sh

# Install Redis
#/vagrant/sh/redis.sh

# GitHub repositories:
#/vagrant/sh/github.sh

# Travis-CI toolbelt:
#/vagrant/sh/travis.sh

# Heroku toolbelt (NOTE: after Travis-CI due to Ruby removal/reinstall):
#/vagrant/sh/heroku.sh


echo "######################################"
echo "Config VIM ..........................."
echo "######################################"
# Vim settings:
/vagrant/sh/vim.sh


#echo "######################################"
#echo "Installing LAMPP ....................."
#echo "######################################"
# LAMPP
#/vagrant/sh/lampp.sh

# GIT-CORE & POSH-GIT-BASH
/vagrant/sh/git.sh

touch /etc/vagrant-provisioned

echo "--------------------------------------------------"
echo "Your vagrant instance is running at: 192.168.33.10"
