#!/bin/bash

alias pull-masters='find -name .git -type d -printf "\033[0;33m%h:\033[0m\n" -execdir bash -c "git fetch --quiet origin && git --no-pager diff --color=always --stat master origin/master && git update-ref refs/heads/master origin/master && if [[ \$(git symbolic-ref --short HEAD) == master ]] ; then git reset --hard HEAD ; fi" \;'
alias pull-masters-parallel=$'find -name .git -type d -printf "%h\\0" | xargs -0 -P 0 -I {} bash -c "(cd {} && git fetch --quiet origin && git --no-pager diff --color=always --stat master origin/master && git update-ref refs/heads/master origin/master && if [[ \$(git symbolic-ref --short HEAD) == master ]] ; then git reset --hard HEAD ; fi) > >(awk \'\$0=\\"\x1b[0;33m{}: \x1b[0m\\"\$0\') 2> >(awk \'\$0=\\"\x1b[0;31m{}: \x1b[0m\\"\$0\' >&2)"'
