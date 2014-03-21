BASH学习
======================

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
