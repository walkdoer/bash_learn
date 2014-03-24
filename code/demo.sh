#!/bin/bash
# 如果没有文件
script_name=`basename $0`
echo "腳本名稱:$0"
echo "腳本的文件名:$script_name"
filename="$1"

echo '測試$filename'
echo "測試$filename"
echo "一共有$#個參數"  # $#最後一個參數座標
echo "參數列表：$@"
echo "最後一個參數：${!#}"

if [ -x "$filename" ]; then
    echo "File $filename exist"; cp $filename $filename.bak
else
    echo "File $filename not found"; touch $filename
fi;echo "File test complete."
