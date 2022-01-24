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

export PYTHONSTARTUP=${HOME}/.pythonrc
export QUOTING_STYLE=literal

# hstr config
if [ -f ~/.hstr ]; then
    . ~/.hstr
fi

# starship
eval "$(starship init bash)"
