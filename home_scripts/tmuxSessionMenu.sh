#!/bin/bash
#tmuxSessionMenu.sh
#Tmux Session Selector

if test $1 == "mcu"; then
  echo "mcu.tmux"
else
  echo "unknown"
fi
exit
