# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# prompt
. /usr/share/git-core/contrib/completion/git-prompt.sh
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    host="@\[\033[1;34m\]\h\[\033[00m\]"
else
    host=""
fi
GIT_PS1_STATESEPARATOR=""
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUNTRACKEDFILES=1
#PROMPT_COMMAND='__git_ps1 "[\u${host}:\W" "]\\\$ "'
PROMPT_COMMAND='__git_ps1 "" "[\u${host}:\W]\\\$ " "%s";printf "\033]0;%s\007" "${PWD/#$HOME/\~}"'
#PS1='[\u@\h \W\[\033[0;32m\]$(__git_ps1 " (%s)")\[\033[0m\]]\$ '

export PYTHONSTARTUP=${HOME}/.pythonrc
export QUOTING_STYLE=literal

# hstr config
if [ -f ~/.hstr ]; then
    . ~/.hstr
fi


# added by travis gem
[ -f /home/mblaha/.travis/travis.sh ] && source /home/mblaha/.travis/travis.sh
[[ -f ~/.resh/shellrc ]] && source ~/.resh/shellrc
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
