#!/bin/bash

srcdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. ${srcdir}/lib.sh

#handles options
if test ! -z $1 && test "$1" == "-i"; then finstall=1; fi

QSETUPDIR=$(git -C ${srcdir} rev-parse --show-toplevel)
if test ! $? -eq 0; then
  echo "error: missing qsetup repo directory at '$(dirname ${srcdir})'.abort"
  exit 1
fi

#Install step (optional)
if test $(getDistro) == 'arch'; then
  echo "Setup for Arch Linux"
  if test ! -z $finstall && test -f ${srcdir}/pacman-pkgs ; then
    echo "Installing Packages..."
    sudo pacman -S $(< ${srcdir}/pacman-pkgs ) --needed
  fi
else
  if test $(getDistro) == 'debian'; then
    echo "Setup for Debian-based Distros"
    if test ! -z $finstall && test -f ${srcdir}/apt-pkgs ; then
      echo "Installing Packages..."
      xargs -a <(awk '/^\s*[^#]/' ${srcdir}/apt-pkgs ) -r -- sudo apt-get install
    fi
  else
    echo "No distro-specific setup"
  fi
fi

#Check if all the tools are installed
if test $(isInstalled vim) -eq 0 ; then echo "install vim.abort"; exit 1; fi
if test $(isInstalled tmux) -eq 0 ; then echo "install tmux.abort"; exit 1; fi
#check tmux dependencies
. ${srcdir}/tmux_depCheck.sh
if test $(isInstalled git) -eq 0 ; then echo "install git.abort"; exit 1; fi

#create symbolic links to dot script at home.
cd ~ #going home
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
