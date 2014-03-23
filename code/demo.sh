#!/bin/bash
# 如果没有文件
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
