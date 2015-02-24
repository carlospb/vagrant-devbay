#!/bin/bash

sudo apt-add-repository ppa:git-core/ppa
sudo apt-get update
# Install build tools
sudo apt-get install -y make g++ curl vim libcairo2-dev libav-tools nfs-common portmap