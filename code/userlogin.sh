#!/bin/bash

echo "今天的日期：`date +'%D %T'`"
echo "今天是本年度的第几天`date +%j`"
echo "UNIX 元年到现在为止的秒数:`date +%s`"

prefix=userlog
suffix=$(date +%s)
filename=$prefix.$suffix
echo "今天的日期：`date +'%D %T'`" > $filename
who >> $filename
echo "系统更新时间：`uptime`" >> $filename
echo "系统登录日志已保存到$filename"
exit 0;
