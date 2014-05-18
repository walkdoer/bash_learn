#!/bin/bash

# 将 test.xxx!mid 之类的文件名重命名为 test.xxx
for i in *mid; do mv "$i" "${i/\!mid/}"; done;

#todo
# 将该脚本扩展为可以传参数的执行的脚本
