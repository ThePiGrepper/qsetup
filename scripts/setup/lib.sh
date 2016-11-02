#!/bin/bash
#some functions

#function to get distro
#return val:
#1:arch
#n:others(not implemented)
#-1:error
getDistro(){
  #test arch
  cat /etc/*-release | grep -q 'ID=arch'
  if test $? -eq 0; then
    echo "arch"
    return 1
  fi
  #add other distro tests here
  return -1
}

isInstalled(){
  which $1 > /dev/null 2>&1
  if test $? -ne 0; then echo 0; else echo 1; fi
}
