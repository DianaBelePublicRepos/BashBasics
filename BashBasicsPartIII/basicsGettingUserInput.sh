#! /bin/bash

#Using the read command

echo -n "What's your name? "
#The -n option is used to disable the newline, so you can type your text in the same line.
read name
echo "Hi $name"

#Multiple inputs

read -p "What's your full name? " first last
echo "Your entry for full name $last, $first"

#If you don’t specify variables for the read command,
#all incoming inputs are saved in a REPLY variable.

read -p "What's your name? "
echo Hello $REPLY,.

#You can use the -t option to specify a timeout for input in seconds.

if read -t 5 -p "What's your name?" name; then
   echo "Hi $name, how are you?"
else
   echo "
   You took too much time!!!"
fi
