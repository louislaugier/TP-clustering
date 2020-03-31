#!/bin/bash

#
# Usage:
#   $ /TP-clustering/scripts/consul/install.sh
#

# Set Consul version.
CONSUL_VERSION="1.7.2"

# Set OS details.
OS_KIND="linux"
OS_DISTRO="ubuntu"
OS_ARCH="amd64"

# Download and install Consul.
echo "==> Installing Consul v${CONSUL_VERSION}..."
curl -sSL https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_${OS_KIND}_${OS_ARCH}.zip > /tmp/consul.zip
sudo unzip /tmp/consul.zip -d /tmp/
sudo install /tmp/consul /usr/local/bin/consul
sudo rm /tmp/consul /tmp/consul.zip

# Enable autocompletion on Consul CLI.
consul -autocomplete-install
complete -C /usr/local/bin/consul consul

# Add the appropriate Consul systemd service.
sudo cp /TP-clustering/services/consul.service /etc/systemd/system/consul.service

# If we made it here, we're done!
echo "==> Successfully installed Consul"
