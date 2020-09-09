#!/bin/bash

# xargsとは：
# 標準入力やファイルからリストを読み込み、コマンドラインを作成して実行するコマンド。

# a~gを1文字ずつ表示
echo {a..g} | xargs -n 1

# a~gを2文字ずつ表示し、4行目以上
echo {a..g} | xargs -n 2 | awk 'NR>=4'
