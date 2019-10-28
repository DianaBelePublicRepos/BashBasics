#! /bin/bash

#The --- shift --- command moves every parameter variable to the left

#variable $3 ==> variable $2.

#variable $2 ==> variable $1.

#variable $1 ==> dropped.

#variable $0 ==> (the script name) as it is.

total=1
while [ -n "$1" ]; do # while loop starts
    echo "#$total = $1"
    total=$(($total + 1))
    shift
done
