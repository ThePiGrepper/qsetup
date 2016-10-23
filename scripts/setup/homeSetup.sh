#!/bin/bash
srcdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
QSETUPDIR=$(git -C ${srcdir} rev-parse --show-toplevel)
if test ! $? -eq 0; then
  echo "error: missing qsetup repo directory at '$(dirname ${QSETUPDIR})'.abort"
  exit 1
fi

#TODO check if its an arch-base system an checkout the arch branch.

#Check if all the tools are installed
which vim > /dev/null 2>&1
if test $? -ne 0; echo "install vim.abort"; exit 1; fi
which tmux > /dev/null 2>&1
if test $? -ne 0; echo "install tmux.abort"; exit 1; fi
which git > /dev/null 2>&1
if test $? -ne 0; echo "install git.abort"; exit 1; fi

#create symbolic links to dot script at home.
cd - #going home
ln -sf ${QSETUPDIR}/home_scripts/.bash_aliases .
ln -sf ${QSETUPDIR}/home_scripts/.bash_logout .
ln -sf ${QSETUPDIR}/home_scripts/.bash_user .
ln -sf ${QSETUPDIR}/home_scripts/.bashrc .
ln -sf ${QSETUPDIR}/home_scripts/.profile .
ln -sf ${QSETUPDIR}/home_scripts/.tmux.conf .
ln -sf ${QSETUPDIR}/home_scripts/.vimrc .

#setup for vim
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/undo
#download Vundle and every other plugin
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c 'PluginInstall' -c 'qa!'
