#! /bin/bash

#The shell gives you some read to use variables to process input parameters:
#$0 is the script’s name.
#$1 is the 1st parameter.
#$2 is the 2nd parameter.
#Until the 9th parameter which is $9.

echo "The parameters are: "
echo $0 #Script Name
echo $1 #1st parameter
echo $2 #2nd parameter
echo $3 #3rd parameter

echo "Second set of commands: "
total=$(( $1 +$2 ))
echo First passed parameter is $1.
echo Second passed parameter is $2.
echo Total is $total.
