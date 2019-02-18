#!/bin/bash

SCRIPT_DIR=$(readlink -f $0 | xargs dirname)
env ANSIBLE_CONFIG=$SCRIPT_DIR/ansible.cfg ansible-playbook --inventory $SCRIPT_DIR/inventory.yaml --connection=local $1
