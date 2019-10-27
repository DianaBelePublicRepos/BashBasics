#! /bin/bash

#The $* variable holds all the parameters as one value.
#The $@ variable holds all the parameters as separate values, so you can iterate over them.

echo "The first variable \$* method: $*"
echo "-----------"
echo "The second variable \$@ method $@"


#The same result, the difference is in the following example

total=1
for var in "$*"; do
    echo "\$* =====> #$total = $var"
    total=$(($total + 1))
done
total=1
for var in "$@"; do
    echo "\$@ ======> #$total = $var"
    total=$(($total + 1))
done
