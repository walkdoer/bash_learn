BASH学习
======================

文档记录的是bash学习过程中记录下的笔记，以天为块进行记录，按照时间先后顺序排序，

- 操作符详细见 `Operator.md`

###*2014-03-19*

声明变量的=号不能有空格  
if 逻辑语句[]内部必须有空格
```shell
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
```Shell
#!/bin/rm
# 自删除脚本.
# 当你运行这个脚本时, 基本上什么都不会发生. . . 当然这个文件消失不见了. 
WHATEVER=65
echo "This line will never print (betcha!)."
exit $WHATEVER # 不要紧, 脚本是不会在这退出的.
```
在每个脚本的开头都使用 sha-bang ( #!), 这意味着告诉你的系统这个文件的执行需要指定一 个解释器. #! 实际上是一个2字节的 [1] 魔法数字, 这是指定一个文件类型的特殊标记,在sha-bang之后接着是一个路径名. 这个路径名就是解释脚本中命令的解释程序所在的路径, 可能是一个shell, 也可能是一个程序语言, 也可能是一个工具包中的命令程序. 这个解释程序从头开始解释并 且执行脚本中的命令(从sha-bang行下边的一行开始), 忽略注释

调用脚本的方式
```Shell
sh scriptname
./scriptname
```
注意：使用sh scriptname来调用脚本的时候将会关闭一些Bash特定的扩展, 脚本可能因此 而调用失败

###*2014-03-20*

时间格式化
```Shell
date +"%m-%d-%y"  03-20-14
date +"%D"        03/20/14
date +"%T"        10:12:23
date +"%D %T"     03/20/14 10:12:23
```
保存时间到变量中
```Shell
NOW=$(date +"%m-%d-%Y")

#完整的例子
#!/bin/bash
NOW=$(date +"%m-%d-%Y")
FILE="backup.$NOW.tar.gz"
echo "Backing up data to /nas42/backup.$NOW.tar.gz file, please wait..."
#rest of code
```
####参考
- http://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display/

###*2014-03-23*

####参数

- $1 表示第一个参数，依次類推，$2表示第二個參數
- $# 表示最後一個參數的座標
- ${!#} 表示最後一個參數
- $@ 所有的參數，$*也可以，兩者有區別 [參考](http://www.ibm.com/developerworks/cn/linux/l-bash-parameters.html)

```shell

./example.sh param1, param2, param3
# $1 : param1
# $2 : param2
# $3 : param3

```

####什麼是内建命令?
內建命令指的就是包含在Bash工具包中的命令, 从字面意思上看就是built in. 这主要是考虑到执行效 率的问题 -- 内建命令将比外部命令执行的更快, 一部分原因是因为外部命令通常都需要fork出一个单 独的进程来执行 -- 另一部分原因是特定的内建命令需要直接访问shell的内核部分

#### 弱引用和強引用的區別？
被一对双引号(" ")括起来的变量替换是不会被阻止的. 所以双引号被称为部分引用, 有时候又 被称为"弱引用". 但是如果使用单引号的话(' '), 那么变量替换就会被禁止了, 变量名只会被 解释成字面的意思, 不会发生变量替换. 所以单引号被称为全引用, 有时候也被称为"强引用".

``` shell
MSG = 'abc'
echo '強引用：$MSG' # 打印出： 強引用：$MSG
echo "弱引用：$MSG" # 打印出： 弱引用：abc
echo "\$MSG" #\可以阻止对变量的应用
```

#### 参考
1. [Linux 技巧: Bash 参数和参数扩展](http://www.ibm.com/developerworks/cn/linux/l-bash-parameters.html)

### *2014-04-07*
exit 被用来结束一个脚本, 就像在C语言中一样. 它也返回一个值, 并且这个值会传递给脚本的父进 程, 父进程会使用这个值做下一步的处理.  每个命令都会返回一个 退出状态码 (有时候也被称为 返回状态 ). 成功的命令返回0, 而不成功的命 令返回非零值, 非零值通常都被解释成一个错误码. 行为良好的UNIX命令, 程序, 和工具都会返回0作 为退出码来表示成功, 虽然偶尔也会有例外

`$?`保存了最后所执行的命令的退出状态码.例如

```
#...Lots of Command
COMMAND_LAST
exit $? #退出码由最后一条命令决定
```

#### 条件测试
if/then结构用来判断命令列表的退出状态码是否为0(因为在UNIX惯例, 0表示"成功"), 如果成 功的话, 那么就执行接下来的一个或多个命令
##### ` [ ` 和 ` [[ `的区别?
` [ ` 这是一个内建命令,效率更高，与测试(test)命令等价 这个命令把它的参数作为比较表达式或者作为文件测试, 并且根据比较的结 果来返回一个退出状态码(0 表示真, 1表示假).
` [[ ` 表示扩展测试，注意:[[是一个关键字, 并不是一个命令

```
# 条件测试
if cmp a b &> /dev/null # 禁止输出.
then echo "Files a and b are identical."
else echo "Files a and b differ."
fi
# [ 条件测试

如果if和then在条件判断的同一行上的话, 必须使用分号来结束if表达式. if和then都 是关键字. 关键字(或者命令)如果作为表达式的开头, 并且如果想在同一行上再写一个新 的表达式的话, 那么必须使用分号来结束上一句表达式.
```
if [ -x "$filename" ]; then
```
##### if-grep用法
```
 if grep -q Bash file
 then echo "File contains at least one occurrence of Bash."
 fi 11
 word=Linux
 letter_sequence=inu
 if echo "$word" | grep -q "$letter_sequence"
 # "-q" 选项是用来禁止输出的.
 then
 echo "$letter_sequence found in $word"
 else
 echo "$letter_sequence not found in $word"
 fi
```
