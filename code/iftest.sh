#!/bin/bash

if [ 0 ]
then
    echo "0 is true"
else
    echo "0 is false"
fi

#0 is true

if [ 1 ]
then
    echo "1 is true"
else
    echo "1 is false"
fi
#1 is true

if [ -1 ]
then
    echo "-1 is true"
else
    echo "-1 is false"
fi
#-1 is true



if [  ]
then
    echo "Null is true"
else
    echo "Null is false"
fi
# Null is false

if [ xyz ]
then
    echo "Random string is true"
else
    echo "Random string is false"
fi
# Random string is true

if [ $var ]
then
    echo "没有初始化的变量 is true"
else
    echo "没有初始化的变量 is false"
fi
# 没有初始化的变量 is false

if [ -n "$var" ] # $var 如果不加 " ", 结果就是相反的
then
    echo "没有初始化的变量 is true"
else
    echo "没有初始化的变量 is false"
fi

