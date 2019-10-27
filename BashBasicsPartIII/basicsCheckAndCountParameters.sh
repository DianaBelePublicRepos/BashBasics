#! /bin/bash

#If you don’t pass parameters and your code expecting it, your script will exit with an error.

if [ -n "$1" ]; then #If first parameter passed then print Hi
    echo Hi $1.
else
    echo "No parameters found."
fi

#To get how many parameters passed, you can use this variable ($#).
echo "There were $# parameters passed." 
