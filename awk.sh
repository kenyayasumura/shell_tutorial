#!/bin/bash

# akw（gawk）とは：
# 空白などで区切られたテキストを処理するコマンド。
# 演算や正規表現も利用できる。
# sedとの住み分けは、特定の文字だけを変更→awk&sub、条件に合うやつならなんでも→sed

if [ ! -e ./outputs/awk1.txt ]; then
    touch ./outputs/awk1.txt
fi
if [ ! -e ./outputs/awk2.txt ]; then
    touch ./outputs/awk2.txt
fi
printf "this\nis\nakw\ncommand's\ndemo" > outputs/awk1.txt
printf "1 2 3 4 5\n 6 7 8 9 10" > outputs/awk2.txt

# パターン
# akw '/正規表現/{ command } fileName'
# akw '/BEGIN/{ command } fileName'
# akw '/END/{ command } fileName'
# akw '評価式 { command } fileName'

# 組み込み変数
# NF、フィールド数（その行に何文字あるか）
# NR、行数

# catと同じ結果

awk '{ print $0 }' outputs/awk1.txt

# 値を操作

whatever=aiueo
awk "{ print $0 $whatever }" outputs/awk1.txt


# BEGINとENDを利用

awk 'BEGIN { print "--BEGIN--" } { print $0} END { print "--END--" }' outputs/awk1.txt

# ファイルから入力し、5列目が5

cat outputs/awk2.txt | awk '$5==5'


# ファイル容量が10バイト以上
# -rwxr-xr-x 1 yasumura.kenya 1049089 1495  9月  9 09:44 awk.sh
# $1         $2 $3            $4      $5    $6   $7$8    $9

ls -l | awk '$5>=10'

# awkとよく使う関数

# printf : 文字列をフォーマットして出力する関数
seq 1 3 | awk '{ printf("%d円\n", $1) }'

# sprintf : 標準出力に返さず、整形された文字列を返す
# printfだけでやると全部を関数の引数にする必要があり面倒 $1 $3
# echo 上田 0 不合格 | awk {printf("%s %010d点 %s\n", $1,$2,$3)}
echo 上田 0 不合格 | awk '{ printf $1, sprintf("%010d点", $2),$3}'

# sub, gsub, gensub
# subは一行一回だけ置換
echo オバチャンオバチャン | awk '{sub(/オバ/,"オッ",$0);print}'

# subは１行何回も置換
echo オバチャンオバチャン | awk '{gsub(/オバ/,"オッ",$0);print}'

# gensubは一行一回だけ置換、文字列を返す
echo オバチャンオバチャン | awk '{$0 = gensub(/オバ/,"オッ",$0);print}'
