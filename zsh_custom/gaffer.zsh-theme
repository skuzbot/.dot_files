# :::::::::::::
# :::gaffer::::::::::::::::
# ::::::::::::::::::::::::::::::::
#    ________
#  / \        \
#  /   \        \
#  /     \        \
#  /        \_______\
#  \        /       /
#  \____  /    ____/__
# /\          /\      \
# /  \   \___/   \      \
# /    \       \   \      \
# /      \_______\   \______\
# \      /       /   /      /
# \    /       /   /      /
# \  /       /\  /      /
# \/_______/  \/______/                                             ♺

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# : https://github.com/skuzbot/.dot_files:::::::::::::::::::::::::::::
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# vim:ft=zsh ts=2 sw=2 sts=2

local ret_status="%(?:%{$fg_bold[cyan]%} ❮ %{$fg[blue]%}▢ ▢ ▢%{$fg[cyan]%} ❯:%{$fg[red]%} ❮ %{$fg[yellow]%}▢ ▢ ▢%{$fg[red]%} ❯)"
local left_status_1="%(?:%{$fg_bold[cyan]%}◢:%{$fg[red]%}◢)"
local left_status_2="%(?:%{$fg_bold[cyan]%}◥:%{$fg[red]%}◥)"
local right_status_1="%(?:%{$fg_bold[cyan]%}◣:%{$fg[red]%}◣)"
local right_status_2="%(?:%{$fg_bold[cyan]%}◤:%{$fg[red]%}◤)"

PROMPT='
${left_status_1}%{$fg_bold[blue]%} %D{%m-%d-%y} %D{%I:%M %p} %{$reset_color%}${right_status_1} ${left_status_1}$(git_prompt_info)%{$reset_color%}${right_status_1}
${left_status_2}%{$fg[magenta]%} %c %{$reset_color%}${right_status_2}${ret_status}%{$reset_color%} '
RPROMPT=$'%b%{$reset_color%}%{$fg_bold[white]%}${${KEYMAP/vicmd/--NORMAL--}/(main|viins)/--INSERT--}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[red]%} ♥"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]% ✘"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[red]% ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]% ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]% ✖"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$fg[yellow]%➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[white]% ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]% ?"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[yellow]% ⬆"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[yellow]% ⬇"
ZSH_THEME_GIT_PROMPT_DIVERGED="%{$fg[yellow]% ⬍"
