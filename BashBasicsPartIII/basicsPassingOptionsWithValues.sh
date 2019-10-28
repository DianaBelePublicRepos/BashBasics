#! /bin/bash

#Sometimes you need options with additional parameter values like this:
#./myscript -a value1 -b -c value2

while [ -n "$1" ]; do # while loop starts

    case "$1" in

    -a) echo "-a option passed" ;;

    -b)
        param="$2"
        echo "-b option passed, with value $param"
        shift
        ;;
    -c) echo "-c option passed" ;;
    --)
        shift # The double dash makes them parameters

        break
        ;;
    *) echo "Option $1 not recognized" ;;
     esac
     shift
done
total=1
for param in "$@"; do
      echo "#$total: $param"
      total=$(($total + 1))
done
