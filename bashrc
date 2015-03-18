# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias rm='rm -i'
alias cp='cp -i'
alias rt='su -'
alias emacs='emacs -nw'
alias vi='vim'
#alias yum='sudo yum'
#alias apt-get='sudo apt-get'
#alias lein='~/bin/lein'

function parse_git_branch {
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
}

function proml {
local BLUE="\[\033[0;34m\]"
# OPTIONAL - if you want to use any of these other colors:
local RED="\[\033[0;31m\]"
local LIGHT_RED="\[\033[1;31m\]"
local GREEN="\[\033[0;32m\]"
local LIGHT_GREEN="\[\033[1;32m\]"
local WHITE="\[\033[1;37m\]"
local LIGHT_GRAY="\[\033[0;37m\]"
# END OPTIONAL
local DEFAULT="\[\033[0m\]"
#PS1="\h:\W \u$LIGHT_RED\$(parse_git_branch) $DEFAULT\$"
PS1="\u::\W$LIGHT_RED\$(parse_git_branch) $DEFAULT\$"
}
proml

# User specific aliases and functions
