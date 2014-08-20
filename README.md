BASH学习
======================

文档记录的是bash学习过程中记录下的笔记，以天为块进行记录，按照时间先后顺序排序，

- 操作符详细见 `Operator.md`

*2014-08-20*
================

```
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
echo -e "\a" #Beep

```


从下面这段脚本学到的知识点

$SECONDS : 当前脚本运行的时间
echo -e 可是输出 `\a`  之类带斜杠的字符,不加e参数，则直接输出 \a  [参考](http://ss64.com/bash/echo.html)


*2014-08-15*
================

### 内在变量
$$ 脚本进程ID
$! 最后一个进程ID
$# 位置参数个数
${#*} 命令行参数个数
$FUNCNAME 当前函数的名字
$GROUPS
$HOME
$HOSTNAME
$HOSTTYPE
$IFS $IFS是一个非常有用的常量，查看code中的实例


查看 `./code/innerVar.sh`






*2014-08-12*
=================

#### 数字常量

如果数字以0开头的话那么就是8进制数. 如果数字以0x开头的话那么就是16进制数. 如果数字中间嵌入 了#的话, 那么就被认为是BASE#NUMBER形式的标记法

```bash
#十进制
let "dec = 32"
#八进制
let "oct = 032"
#16进制
let "hex = 0x32"
#2进制
let "bin = 2#111100111001101"
```







*2014-08-11*
=================

#### 检查字符串是否为null

`-z`: 字符串为null
`-n`: 字符串不为null

```bash
#第一种方法
if [ -n "$string" ]
then
    echo "String \"string1\" is not null"
else
    echo "String \"string\" is null"
fi

#更简单的方式
if [ "$string1" ] # 也可以使用 if [ $string1 ]
then
    echo "String \"string1\" is not null"
else
    echo "String \"string\" is null"
fi

```


*2014-08-06*
=================================

#### 其他操作符

`<, >, >=, <=`只能在双括号中使用

```bash
(( "$a" > "$b"))
```

##### 整数比较字符串比较
```bash
if [ "$a" -ne "$b" ]
then
    echo "$a is not equal to $b"
    echo "(数字比较)"
fi

if [ "$a" != "$b" ]
then
    echo "$a is not equal to $b."
    echo "(字符串比较)"
    # "4"!="5"
    # ASCII 52 != ASCII 53
fi
```

*注意`>` 和 `<` 使用在[ ]结构中的时候需要被转义*

```bash
if [[ "$a" < "$b" ]]
if [ "$a" \< "$b" ]
```


#### -a,-o 与 &&,||

`-a`表示与，`-o`表示或，但是用于单中括号中
$$和||用于双括号中

```bash
[[ condition1 && condition2 ]]
["$exp1" -a "$exp2"]
```


*2014-04-07*
=================================
exit 被用来结束一个脚本, 就像在C语言中一样. 它也返回一个值, 并且这个值会传递给脚本的父进 程, 父进程会使用这个值做下一步的处理.  每个命令都会返回一个 退出状态码 (有时候也被称为 返回状态 ). 成功的命令返回0, 而不成功的命令返回非零值, 非零值通常都被解释成一个错误码. 行为良好的UNIX命令, 程序, 和工具都会返回0作 为退出码来表示成功, 虽然偶尔也会有例外

`$?`保存了最后所执行的命令的退出状态码.例如

```
#...Lots of Command
COMMAND_LAST
exit $? #退出码由最后一条命令决定
```

#### 条件测试
if/then结构用来判断命令列表的退出状态码是否为0(因为在UNIX惯例, 0表示"成功"), 如果成 功的话, 那么就执行接下来的一个或多个命令
##### `test` , ` [ ` 和 ` [[ `的区别?
if test condition-true结构与if [ condition-true ]完全相同.
```
➜  type [
[ is a shell builtin
➜   type test
test is a shell builtin
```
` [ ` 这是一个内建命令,效率更高，与测试(test)命令等价 这个命令把它的参数作为比较表达式或者作为文件测试, 并且根据比较的结果来返回一个退出状态码(0 表示真, 1表示假).
` [[ ` 表示扩展测试，注意:[[是一个关键字, 并不是一个命令, `[[ ]]`结构比`[ ]`结构更加通用. 这是一个扩展的test命令, 是从ksh88中引进的.在[[和]]之间所有的字符都不会发生文件名扩展或者单词分割, 但是会发生参数扩展和命令替换
```
file=/etc/passwd
if [[ -e $file ]]
then
    echo "Password file exists."
fi
```
使用`[[ ... ]]`条件判断结构, 而不是`[ ... ]`, 能够防止脚本中的许多逻辑错误. 比如, &&, ||, <, 和> 操作符能够正常存在于`[[ ]]`条件判断结构中, 但是如果出现在`[ ]`结构中的话, 会报错.

##### if COMMAND
在if后面也不一定非得是test命令或者是用于条件判断的中括号结构( `[ ]` 或 `[[ ]]` ),`if COMMAND`结构将会返回COMMAND的退出状态码

```
if cmp a b &> /dev/null # 禁止输出.
then echo "Files a and b are identical."
else echo "Files a and b differ."
fi
```

如果if和then在条件判断的同一行上的话, 必须使用分号来结束if表达式. if和then都 是关键字. 关键字(或者命令)如果作为表达式的开头, 并且如果想在同一行上再写一个新 的表达式的话, 那么必须使用分号来结束上一句表达式.

```
if [ -x "$filename" ]; then
```

##### if-grep用法

```
if grep -q Bash file
then echo "File contains at least one occurrence of Bash."
fi
```
##### elif else if的缩写

```
if [ condition ]
then
    command1
    command2
    command3
elif [ condition2 ]
    command4
    command5
else
    default-command
fi
```
##### `(( ))` 结构
计算一个算术表达式的值. 如果表达式的结果为0, 那么返回的退出状态码为1, 或者 是"假". 而一个非零值的表达式所返回的退出状态码将为0,  ((...))结构允许*算术扩展*和*赋值*. 举个简单的例子, a=$(( 5 + 3 )), 将把变量"a"设为"5 + 3", 或者8. 然而, 双圆括号结构也被认为是在Bash中使用C语言风格变量操作的一种处理机制.

```
# 返回退出状态码
(( 0 ))
echo "(( 0 ))的退出状态码: $?" # 1
(( 1 ))
echo "(( 1 ))的退出状态码: $?" # 0
(( 5 > 4 ))
echo "(( 5 > 4 ))的退出状态码: $?" # 0
(( 5 > 9 ))
echo "(( 5 > 9 ))的退出状态码: $?" # 1
# 计算
(( a = 23 ))  # = 两边允许有空格
(( a++ ))
(( a-- ))
(( t = a<45?7:11)) # C语言风格的3元操作符
```

#### 文件测试操作符
* -e 文件存在
* -f 表示这个文件是一个一般文件(并不是目录或者设备文件)
* -s 文件大小不为0
* -d 这是一个目录
* -b 这是一个块设备
* -c 这是一个字符设备
* -p 这是一个管道
* -h 这是一个符号链接（软链接）
* -S 这是一个socket
* -r 是否可读
* -w 是否可写
* -x 是否可执行
* f1 -nt f2 文件f1比f2新
* f1 -ot f2 文件f1比f2旧
* f1 -ef -f2 文件f1和f2是相同文件的硬链接

例子 code/chkfilelink.sh
```bash
# 一个纯粹的shell 脚本用来找出那些断掉的符号链接文件并且输出它们所指向的文件

[ $# -eq 0 ] && directorys=`pwd` || directorys=$@

linkchk () {
    for element in $1/*; do
    #'-h'用来测试符号链接, '-d'用来测试目录.
    [ -h "$element" -a ! -e "$element" ] && echo \"$element\"
    [ -d "$element" ] && linkchk $element
    done
}

for directory in $directorys; do
    if [ -d $directory ]
    then linkchk $directory
    else
        echo "$directory is not a directory"
        echo "Usage: $0 dir1 dir2 ..."
    fi
done

exit 0
```

#### 检查字符串是否为null
```bash
if [ -n $str ]
then
    echo "String str is not null"
else
    echo "String str is null"
fi
# 输出 String str is not null


if [ -n "$str" ]
then
    echo "String str is not null"
else
    echo "String str is null"
fi
# 输出 String str is null

if [ $str ] #最好使用 if [ "$str" ]
then
    echo "String str is not null"
else
    echo "String str is null"
fi
# 输出 String str is null
`
```


*2014-03-23*
=================================
####参数

- $1 表示第一个参数，依次類推，$2表示第二個參數
- $# 表示最後一個參數的座標
- ${!#} 表示最後一個參數
- $@ 所有的參數，$*也可以，兩者有區別 [參考](http://www.ibm.com/developerworks/cn/linux/l-bash-parameters.html)

```bash
./example.sh param1, param2, param3
# $1 : param1
# $2 : param2
# $3 : param3

```

####什麼是内建命令?
內建命令指的就是包含在Bash工具包中的命令, 从字面意思上看就是built in. 这主要是考虑到执行效率的问题,内建命令将比外部命令执行的更快, 一部分原因是因为外部命令通常都需要fork出一个单独的进程来执行,另一部分原因是特定的内建命令需要直接访问shell的内核部分

#### 弱引用和強引用的區別？
被一对双引号(" ")括起来的变量替换是不会被阻止的. 所以双引号被称为部分引用, 有时候又 被称为"弱引用". 但是如果使用单引号的话(' '), 那么变量替换就会被禁止了, 变量名只会被解释成字面的意思, 不会发生变量替换. 所以单引号被称为全引用, 有时候也被称为"强引用".

```bash
MSG = 'abc'
echo '強引用：$MSG' # 打印出： 強引用：$MSG
echo "弱引用：$MSG" # 打印出： 弱引用：abc
echo "\$MSG" #\可以阻止对变量的应用
```

#### 参考
1. [Linux 技巧: Bash 参数和参数扩展](http://www.ibm.com/developerworks/cn/linux/l-bash-parameters.html)



*2014-03-20*
=================================

时间格式化

```bash
date +"%m-%d-%y"  03-20-14
date +"%D"        03/20/14
date +"%T"        10:12:23
date +"%D %T"     03/20/14 10:12:23
```

保存时间到变量中

```bash
NOW=$(date +"%m-%d-%Y")

```

```bash
#完整的例子
#!/bin/bash
NOW=$(date +"%m-%d-%Y")
FILE="backup.$NOW.tar.gz"
echo "Backing up data to /nas42/backup.$NOW.tar.gz file, please wait..."
#rest of code
```

####参考
- http://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display/


*2014-03-19*
=================================

*声明变量的=号不能有空格,if 逻辑语句[]内部必须有空格*

```bash
# =号两边有空格会导致错误
LOG_DIR = /var/log
#应该改为
LOG_DIR=/var/log

#下面[]里没有空格会出错
if [`pwd` != $LOG_DIR]
#应该改为
if [ `pwd` != $LOG_DIR ]
```

自删除脚本

```bash
#!/bin/rm
# 自删除脚本.
# 当你运行这个脚本时, 基本上什么都不会发生. . . 当然这个文件消失不见了. 
WHATEVER=65
echo "This line will never print (betcha!)."
exit $WHATEVER # 不要紧, 脚本是不会在这退出的.
```


在每个脚本的开头都使用 sha-bang ( #!), 这意味着告诉你的系统这个文件的执行需要指定一 个解释器. #! 实际上是一个2字节的 [1] 魔法数字, 这是指定一个文件类型的特殊标记,在sha-bang之后接着是一个路径名. 这个路径名就是解释脚本中命令的解释程序所在的路径, 可能是一个shell, 也可能是一个程序语言, 也可能是一个工具包中的命令程序. 这个解释程序从头开始解释并 且执行脚本中的命令(从sha-bang行下边的一行开始), 忽略注释

调用脚本的方式
```bash
sh scriptname
./scriptname
```
注意：使用sh scriptname来调用脚本的时候将会关闭一些Bash特定的扩展, 脚本可能因此 而调用失败
