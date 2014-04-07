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


file=/etc/passwd
if [[ -e $file ]]
then
    echo "Password file exists."
fi
# 返回退出状态码
(( 0 ))
echo "(( 0 ))的退出状态码: $?" # 1
(( 1 ))
echo "(( 1 ))的退出状态码: $?" # 0
# 计算
(( a = 23 ))  # = 两边允许有空格
(( a++ ))
(( a-- ))
(( t = a<45?7:11)) # C语言风格的3元操作符
(( 5 > 4 ))
echo "(( 5 > 4 ))的退出状态码: $?" # 0
(( 5 > 9 ))
echo "(( 5 > 9 ))的退出状态码: $?" # 0

(( 1 / 0 )) 2>/dev/null # 如果删除 2>/dev/null 会提示错误:division by 0 (error token is " ")
echo "(( 1 / 0 ))的退出状态吗: $?" #1
