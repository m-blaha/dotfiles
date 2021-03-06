#!/usr/bin/env bash

# based on https://github.com/donls/dotfiles

############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old$$             # old dotfiles backup directory
# list of files/folders to symlink in homedir
files="bash_aliases bash_profile bashrc bash-preexec.sh hstr vimrc vim pythonrc gitconfig gitignore_global"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    if [ -f ~/.$file ] ; then
        echo "Moving previous version of $file from ~ to $olddir"
        mv ~/.$file $olddir
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
