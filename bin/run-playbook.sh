#!/bin/bash

SCRIPT_DIR=$(readlink -f $0 | xargs dirname)

export ANSIBLE_CONFIG=$SCRIPT_DIR/ansible.cfg
export ANSIBLE_ROLES_PATH=$(readlink -f $SCRIPT_DIR | xargs dirname)/roles

if [ $EUID != 0 ]; then
    ASK_BECOME_PASSWORD=--ask-become-pass
else
    ASK_BECOME_PASSWORD=
fi

env ansible-playbook --inventory $SCRIPT_DIR/inventory.yaml $ASK_BECOME_PASSWORD $2 $1
