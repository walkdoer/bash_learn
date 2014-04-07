#!/bin/bash
echo '检查文件链接'
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
