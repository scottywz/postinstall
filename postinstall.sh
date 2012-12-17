#!/bin/bash
# Vim modeline {{{1
# vim: set foldmethod=marker shiftwidth=1:

# Change into script directory {{{1
cd "$(dirname "$0")"

# Run parts
for part in parts/*; do
 base="`basename "$part"`"
 if [ -z "$1" ]; then
  if [ -x "$part" ]; then
   $part
  else
   echo "`basename "$0"`: warning: skipping part '$base' because it's not executable"
  fi
 else
  for arg in "$@"; do
   name="`sed -r "s/^[0-9]+-//" <<< "$base"`"
   if [ "$arg" = "$name" ]; then
    if [ -x "$part" ]; then
     $part
    else
     echo "`basename "$0"`: warning: skipping part '$base' because it's not executable"
    fi
   fi
  done
 fi
done
