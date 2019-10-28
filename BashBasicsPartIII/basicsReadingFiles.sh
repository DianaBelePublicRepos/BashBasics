#! /bin/bash

#The read command can read files one line on each call.

#Get the content using the cat command
#Then send it to the read command using while loop

count=1
#Get the contents of the file then pass it to the read command
#by iterating over the lines using while

cat sampleEmployees.txt | while read line; do
    echo "#$count: $line"
    count=$(($count+1))
done
echo "Finished"
