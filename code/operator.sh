#!/bin/bash

a=4;
b=5;

if [ "$a" -ne "$b" ]
then
    echo "$a is not equal to $b"
    echo "算术比较"
else
    echo "same"
fi

if [ "$a" != "$b" ]
then
    echo "$a is not equal to $b"
    echo "字符串比较"
else
    echo "same"
fi

echo

exit 0
