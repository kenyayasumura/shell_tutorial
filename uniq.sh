#!/bin/bash

# uniqとは：
# 重複している行を取り除くコマンド。
# 事前にsortする必要あり。

if [ ! -e outputs/uniq1 ]; then
    printf "hoge\nfuga\nfoo\nboo\nbar\nbaz\nfoobar\nfoo" > outputs/uniq1
fi

# 重複した回数（-c）と重複した行(-d)を表示
cat outputs/uniq1 | sort | uniq -cd

# 重複した行をすべて表示(-D)※重複件数分
cat outputs/uniq1 | sort | uniq -D

# 重複していない行を表示(-u)
cat outputs/uniq1 | sort | uniq -u
