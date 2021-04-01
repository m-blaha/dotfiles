alias l='ls -lhF'
alias grep='grep --color=auto'
alias vim="vim -p"
alias vi="vim -p"
alias nvim="nvim -p"

alias gitprrm="git br | grep '^\s*p[0-9]\+' | xargs git br -D"

_git_rebase_upstream() {
    git fetch upstream
    git rebase upstream/$(git symbolic-ref --short HEAD)
}
alias gitrebase=_git_rebase_upstream

_git_fetch_pr() {
    git fetch upstream pull/$1/head:p$1
    git co p$1
}
alias gitpr=_git_fetch_pr

_gitstat() {
for gitdir in "$@"
do
    if  [ -d "${gitdir}" ] ; then
        echo -e "\033[1m$gitdir\033[0m"
        git --git-dir=$gitdir/.git --work-tree=$gitdir status -s;
        echo '-------------';
    fi
done
}
alias gitstat=_gitstat

_gitpull() {
for gitdir in "$@"
do
    if  [ -d "${gitdir}" ] ; then
        echo -e "\033[1m$gitdir\033[0m";
        cd $gitdir;
        git pull;
        cd ..;
        echo '-------------';
    fi
done
}
alias gitpull=_gitpull

eval "$(hub alias -s)"
