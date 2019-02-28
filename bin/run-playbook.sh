#!/bin/bash

SCRIPT_DIR=$(readlink -f $0 | xargs dirname)
PROPERTIES_FILE=$(readlink -f $SCRIPT_DIR | xargs dirname)/properties/$(basename -- $1)

if [ $EUID != 0 ]; then
    ASK_BECOME_PASSWORD=--ask-become-pass
else
    ASK_BECOME_PASSWORD=
fi

env ANSIBLE_CONFIG=$SCRIPT_DIR/ansible.cfg ansible-playbook --inventory $SCRIPT_DIR/inventory.yaml $ASK_BECOME_PASSWORD $2 $1
