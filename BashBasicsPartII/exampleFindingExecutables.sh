#! /bin/bash

#To get all executable files on your system,
#you can iterate over the directories in the PATH variable.

IFS=:
for dir in $PATH; do
  echo "$dir:"
  for myfile in $dir/*; do
    if [ -x $myfile ]; then
      echo "$myfile"
    fi
  done
done
