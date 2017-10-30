#!/bin/bash

DUMMY=${QSETUP_DOTFILE_PATH}/dummy.tmp
if test ! -e $DUMMY ;then
  curr=1
else
  curr=$(cat $DUMMY)
  #increment by one and save
  ((curr=curr+1))
fi
echo $curr > $DUMMY
echo "$curr|"
