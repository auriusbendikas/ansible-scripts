#!/bin/bash

SCRIPT_DIR=$(readlink -f $0 | xargs dirname)
PROPERTIES_FILE=$(readlink -f $SCRIPT_DIR | xargs dirname)/properties/$(basename -- $1)
env ANSIBLE_CONFIG=$SCRIPT_DIR/ansible.cfg ansible-playbook --inventory $SCRIPT_DIR/inventory.yaml --extra-vars @$PROPERTIES_FILE --connection=local $1
