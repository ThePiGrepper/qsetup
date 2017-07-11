#!/bin/bash

bat_level() {
  which upower >/dev/null 2>&1
  if test $? -eq 0; then
    local battery=( $(upower -e | grep battery | head -n1) )
    local energy=$(upower -i $battery | awk -v nrg="$energy" '/energy:/ {print nrg+$2}')
    local energy_full=$(upower -i $battery | awk -v nrgfull="$energy_full" '/energy-full:/ {print nrgfull+$2}')
    echo $energy $energy_full | awk '{printf("Bat:%d%%", ($1/$2)*100)}'
  else
    echo "Bat:???"
  fi
}
bat_level
