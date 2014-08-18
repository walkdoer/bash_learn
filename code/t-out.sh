#!/bin/bash


TIMELIMIT=4

read -t $TIMELIMIT variable < $1

echo

if [ -z "$variable"]
then
    echo "Time out variable still unset"
else
    echo "time"
fi

exit 0
