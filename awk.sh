#!/bin/bash

# akw（gawk）とは：
# 空白などで区切られたテキストを処理するコマンド。
# 演算や正規表現も利用できる。

if [ ! -e ./outputs/akw.txt ]; then
    touch ./outputs/akw.txt
fi
printf "this\nis\nakw\ncommand's\ndemo" > outputs/akw.txt

# パターン
# akw '/正規表現/{ command } fileName'
# akw '/BEGIN/{ command } fileName'
# akw '/END/{ command } fileName'
# akw '評価式 { command } fileName'

# catと同じ結果
printf "\n awk '{print \$0}' outputs/akw.txt \n"
awk '{ print $0 }' outputs/akw.txt
printf "\n---------------------------\n\n"

# 値を操作
printf "\n whatever=aiueo\n awk '{ print \$0 \$whatever }' outputs/akw.txt \n"
whatever=aiueo
awk "{ print $0 $whatever }" outputs/akw.txt
printf "\n---------------------------\n\n"

# BEGINとENDを利用
printf "\n awk BEGIN { print '--BEGIN--' } { print \$0} END { print '--END--' } outputs/akw.txt\n"
awk 'BEGIN { print "--BEGIN--" } { print $0} END { print "--END--" }' outputs/akw.txt
printf "\n---------------------------\n\n"
