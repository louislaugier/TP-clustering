#!/bin/bash

#
# Usage:
#   $ /TP-clustering/scripts/vault/install.sh
#

# Set Vault version.
VAULT_VERSION="1.3.4"

# Set OS details.
OS_KIND="linux"
OS_DISTRO="ubuntu"
OS_ARCH="amd64"

# Download and install Vault.
echo "==> Installing Vault v${VAULT_VERSION}..."
curl -sSL https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_${OS_KIND}_${OS_ARCH}.zip > /tmp/vault.zip
sudo unzip /tmp/vault.zip -d /tmp/
sudo install /tmp/vault /usr/local/bin/vault
sudo rm /tmp/vault /tmp/vault.zip

# Enable autocompletion on Vault CLI.
vault -autocomplete-install
complete -C /usr/local/bin/vault vault

# Add the appropriate Vault systemd service.
sudo cp /TP-clustering/services/vault.service /etc/systemd/system/vault.service

# If we made it here, we're done!
echo "==> Successfully installed Vault"
