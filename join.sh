#!/bin/bash

# joinとは：
# ファイルを合わせる
# 参考：https://eng-entrance.com/linux-command-join

if [ ! -e outputs/join1.txt ]; then
    touch outputs/join1.txt
    echo timer watch ring necklace > outputs/join1.txt
fi
if [ ! -e outputs/join2.txt ]; then
    touch outputs/join2.txt
    echo 120 230 345 2870 > outputs/join2.txt
fi

join -a 1 -a 2 outputs/join1.txt outputs/join2.txt
