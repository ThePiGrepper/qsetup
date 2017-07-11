#!/bin/bash

cmus-remote -Q 2>/dev/null| grep 'status playing' >/dev/null
if test $? -eq 0; then
  out=$(cmus-remote -Q | grep title | cut -d' ' -f3- | cut -c 1-27)
  echo "\"$out\"|"
fi
