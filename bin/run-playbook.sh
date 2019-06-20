#!/bin/bash

SCRIPT_DIR=$(readlink -f $0 | xargs dirname)

export ANSIBLE_CONFIG=$SCRIPT_DIR/ansible.cfg
export ANSIBLE_ROLES_PATH=$(readlink -f $SCRIPT_DIR | xargs dirname)/roles

ansible-playbook --inventory $SCRIPT_DIR/inventory.yaml "$@"
