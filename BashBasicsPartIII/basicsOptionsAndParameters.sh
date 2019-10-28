#! /bin/bash

#Sometimes you need to use options and parameters in the same script.
#Here's how.

# usage "./myscript -a -b -c -- 5 10 15"

while [ -n "$1" ]; do # while loop starts

    case "$1" in

    -a) echo "-a option passed" ;; # Message for -a option

    -b) echo "-b option passed" ;; # Message for -b option

    -c) echo "-c option passed" ;; # Message for -c option

    --)
        shift #The double dash which separates options from parameters
        break
        ;; #Exit the loop using the break command
     *) echo "Option $1 is not recognized";;
     esac
     shift
done
total=1
for param in $@; do
  echo "#$total: $param"
  total=$(($total +1))

done
