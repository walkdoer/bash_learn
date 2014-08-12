#!/bin/bash

#十进制
let "dec = 32"
#八进制
let "oct = 032"
#16进制
let "hex = 0x32"
#2进制
let "bin = 2#111100111001101"

echo "dec = $dec"  # 32
echo "oct = $oct"  # 26
echo "hex = $hex"  # 50
echo "bin = $bin"  # 31181

echo $((10#123)) $((16#123))
