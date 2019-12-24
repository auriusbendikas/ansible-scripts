#!/bin/bash -xe

# Install network-manager packages
pacman --noconfirm --sync network-manager-applet bind-tools

# Disable systemd-networkd service
systemctl disable systemd-networkd

# Configure systemd-resolved as a DNS resolver
declare -A resolved
resolved['DNS']='1.1.1.1 1.0.0.1 2606:4700:4700::1111 2606:4700:4700::1001'
resolved['FallbackDNS']='9.9.9.10 8.8.8.8 2620:fe::10 2001:4860:4860::8888'
resolved['Domains']='~.'
resolved['LLMNR']='yes'
resolved['MulticastDNS']='yes'
resolved['DNSSEC']='yes'
resolved['DNSOverTLS']='yes'
resolved['Cache']='yes'
resolved['DNSStubListener']='yes'
resolved['ReadEtcHosts']='yes'

for key in "${!resolved[@]}"; do
    sed --in-place --expression="/^#\?$key=.*/c\\$key=${resolved[$key]}" /etc/systemd/resolved.conf
done

# Setting NetworkManager to use systemd-resolved as a DNS resolver and cache
cat << EOF > /etc/NetworkManager/conf.d/dns.conf
[main]
dns=systemd-resolved
EOF

# Enable network service
systemctl enable systemd-resolved NetworkManager
