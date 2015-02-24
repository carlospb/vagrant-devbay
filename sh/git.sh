#!/bin/bash

sudo apt-add-repository ppa:git-core/ppa
sudo apt-get update
echo "######################################"
echo "Installing GIT-CORE & POSH-GIT-BASH..."
echo "######################################"
sudo apt-get install -y git-core

# copy and config posh-git-bash
sudo cp /vagrant/sh/.git-prompt.sh /home/vagrant/
cat /vagrant/sh/posh-git-config.sh >> /home/vagrant/.bashrc