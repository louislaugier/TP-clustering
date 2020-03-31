#!/bin/bash

#
# Usage:
#   $ /TP-clustering/scripts/install.sh
#

# Update `apt` package index.
echo "==> Updating `apt` package index..."
sudo apt-get update

# Install required and useful packages.
echo "==> Installing `apt` packages..."
sudo apt-get install -y \
  curl \
  unzip \
  vim \
  apt-transport-https \
  ca-certificates \
  gnupg-agent \
  software-properties-common

# Install Consul.
bash /TP-clustering/scripts/consul/install.sh

# Install Nomad.
bash /TP-clustering/scripts/nomad/install.sh

# Install Vault.
bash /TP-clustering/scripts/vault/install.sh

# Restart `systemctl` so we can then start the agents.
sudo systemctl daemon-reload

# If we made it here, we're done!
echo "==> Installation successfully completed!"
