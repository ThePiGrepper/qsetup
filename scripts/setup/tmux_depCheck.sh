#!/bin/bash

#check tmux setup dependencies
if test $(isInstalled xclip) -eq 0 ; then echo "install xclip.abort"; exit 1; fi
echo ok
