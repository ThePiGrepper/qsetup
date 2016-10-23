#!/bin/bash
# Openbox conf HAL
#
# Touchpad enable/disable
if [[ "$1" == 'touchpad_toggle' ]] ; then
  synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0') \
  && exit 0 || exit 1
else 
  echo "error: unknown argument.abort"
  exit 1
fi
