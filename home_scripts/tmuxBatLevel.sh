#!/bin/bash

bat_level() {
  which upower >/dev/null 2>&1
  if test $? -eq 0; then
    local battery=( $(upower -e | grep battery | head -n1) )
    local percentage=$(upower -i $battery | awk '/percentage:/ {print $2}')
    local ac=$(upower -i $battery | awk '/state:/ {if($2 == "charging") print "+"}')
    echo "${percentage}${ac}"
  else
    echo "Bat:???"
  fi
}
bat_level
