#!/bin/bash

TIME_LIMIT=10
INTERVA=1

echo "Hit Control-C to exit before $TIME_LIMIT seconds."

while [ "$SECONDS" -le "$TIME_LIMIT" ]
do
    if [ "$SECONDS" -eq 1 ]
    then
        units=second
    else
        units=seconds
    fi

    echo "This script has been running $SECONDS $units."

    sleep $INTERVA
done
echo "\a" #Beep

exit 0
