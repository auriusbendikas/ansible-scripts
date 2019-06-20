#!/bin/bash

# Install network-manager packages
pacman --noconfirm --sync network-manager-applet

# Disable systemd-networkd service
systemctl disable systemd-networkd

# Enable network service
systemctl enable systemd-resolved NetworkManager

# Setting NetworkManager to use systemd-resolved as a DNS resolver and cache
cat << EOF > /etc/NetworkManager/conf.d/dns.conf
[main]
dns=systemd-resolved
EOF
