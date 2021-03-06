#!/bin/bash

alias pull-masters="find -name .git -type d -printf '\033[0;33m%h:\033[0m\n' -execdir git fetch origin \; -execdir git --no-pager diff --stat master origin/master \; -execdir git update-ref refs/heads/master origin/master \; -execdir bash -c 'if [[ \$(git symbolic-ref --short HEAD) == master ]] ; then git reset --hard HEAD ; fi' \;"
