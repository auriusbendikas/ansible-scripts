#!/bin/bash

# Create user and group
groupadd --gid {{ user_gid }} {{ user_group }}
useradd --uid {{ user_uid }} --gid {{ user_group }} --groups users,wheel,storage,input,kvm --create-home --comment "{{ user_fullname }}" {{ user_name }}
echo -e "{{ user_password }}\n{{ user_password }}" | passwd {{ user_name }}

# Setting no password sudo for wheel user group
cat << EOF > /etc/sudoers.d/wheel
%wheel ALL=(ALL) {{ 'NOPASSWD: ALL' if not user_sudo_with_password else 'ALL'}}
EOF
chmod 440 /etc/sudoers.d/wheel

# Lock root account
passwd --lock root
