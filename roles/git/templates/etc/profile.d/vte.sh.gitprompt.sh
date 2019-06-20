#!/bin/bash

if [ -f "/usr/lib/bash-git-prompt/gitprompt.sh" ]; then
    source /usr/lib/bash-git-prompt/prompt-colors.sh
    GIT_PROMPT_BRANCH="${BoldCyan}"
    GIT_PROMPT_MASTER_BRANCH="${BoldMagenta}"
    GIT_PROMPT_UNTRACKED="${Magenta}…"
    GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_ ${Green}\\u@\\h ${Yellow}\\w${ResetColor}"
    GIT_PROMPT_END_USER=" \n\$ "
    GIT_PROMPT_END_ROOT=" \n${Magenta}#${ResetColor} "

    GIT_PROMPT_ONLY_IN_REPO=0
    GIT_PROMPT_FETCH_REMOTE_STATUS=0
    GIT_PROMPT_IGNORE_SUBMODULES=1
    source /usr/lib/bash-git-prompt/gitprompt.sh
fi
