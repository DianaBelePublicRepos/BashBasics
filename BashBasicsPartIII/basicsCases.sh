#! /bin/bash

while [ -n "$1" ]; do #while loop starts
    case "$1" in
      -a) echo "-a option passed";; #Message for -a option
      -b) echo "-b option passed";; #Message for -b option
      -c) echo "-c option passed";; #Message for -c option
      *) echo "Option $1 not recognized";; #In case you typed a different option other than a,b,c
    esac
    shift
done
