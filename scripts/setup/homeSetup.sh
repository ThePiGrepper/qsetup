#!/bin/bash

srcdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. ${srcdir}/lib.sh

#handles options
if test ! -z $1 && test "$1" == "-i"; then finstall=1; fi

QSETUPDIR=$(git -C ${srcdir} rev-parse --show-toplevel)
QSETUP_DOTFILEDIR=${QSETUPDIR}/home_scripts
if test ! $? -eq 0; then
  echo "error: missing qsetup repo directory at '$(dirname ${srcdir})'.abort"
  exit 1
fi

#Check if all the tools are installed(tools needed to run this script!!)
if test $(isInstalled grep) -eq 0 ; then echo "install grep.abort"; exit 1; fi
if test $(isInstalled awk) -eq 0 ; then echo "install awk.abort"; exit 1; fi
if test $(isInstalled sed) -eq 0 ; then echo "install sed.abort"; exit 1; fi
if test $(isInstalled xargs) -eq 0 ; then echo "install xargs.abort"; exit 1; fi
#Install step (optional)
if test "$(getDistro)" == 'arch'; then
  echo "Setup for Arch Linux"
  if test ! -z $finstall && test -f ${srcdir}/pacman-pkgs ; then
    echo "Installing Packages..."
    sudo pacman -S $(sed -n '/^#/!p' ${srcdir}/pacman-pkgs ) --needed
  fi
else
  if test "$(getDistro)" == 'debian'; then
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
ln -sf ${QSETUP_DOTFILEDIR}/.bash_aliases .
ln -sf ${QSETUP_DOTFILEDIR}/.bash_logout .
ln -sf ${QSETUP_DOTFILEDIR}/.bash_user .
ln -sf ${QSETUP_DOTFILEDIR}/.bashrc .
ln -sf ${QSETUP_DOTFILEDIR}/.profile .
ln -sf ${QSETUP_DOTFILEDIR}/.tmux.conf .
ln -sf ${QSETUP_DOTFILEDIR}/.vimrc .

sed -i --follow-symlinks "s#QSETUP_PATH=#QSETUP_PATH=${QSETUPDIR}#" .bash_user
sed -i --follow-symlinks "s#QSETUP_DOTFILE_PATH=#QSETUP_DOTFILE_PATH=${QSETUP_DOTFILEDIR}#" .bash_user

#setup for vim
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/undo
#download Vundle and every other plugin
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c 'PluginInstall' -c 'qa!'
