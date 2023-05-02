#!/bin/bash

# Install required packages
apt-get update && apt-get install -y hugo make

# Install 'curl'
apt-get install curl -y

# Download release of 'Hugo'
curl -Lo install_hugo.deb https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb

# Install version of 'Hugo'
apt-get install ./install_hugo.deb

# Build the website
make build
