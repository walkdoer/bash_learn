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


if [ -n "$string1" ]
then
    echo "String \"string1\" is not null"
else
    echo "String \"string\" is null"
fi


if [ "$string1" ] # 也可以使用 if [ $string1 ]
then
    echo "String \"string1\" is not null"
else
    echo "String \"string\" is null"
fi


string1="a = b"

if [ $string1 ] 
then
    echo "String \"string1\" is not null"
else
    echo "String \"string\" is null"
fi

# 上例输出 String string1 is null; 机智！
