#!/bin/bash


LOG_DIR=/var/log
ROOT_UID=0  #$UID为0，用户才具有Root权限
LINES=50 #默认保存行数
E_XCD=66 #不能修改目录
E_NOTROOT=67 #不是root用户

if [ "$UID" -ne "$ROOT_UID" ]
then
    echo "Must be root to run this script."
    exit $E_NOTROOT
fi

if [ -n "$1" ]
then
    lines=$1
else
    lines=$LINES
fi


cd $LOG_DIR
if [ `pwd` != "$LOG_DIR" ]
then
    echo "Can't change to $LOG_DIR"
    exit $E_XCD
fi

tail -$lines message > mesg.temp #保存logfile
mv mesg.temp message
#cat /dev/null > message
#cat /dev/null > wtmp

echo "Logs cleaned up."

exit 0 #返回0退出表示成功
