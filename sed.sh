#!/bin/bash

# sedとは：
# stream editor の略で、指定したファイルをコマンドに従って処理し、標準出力へ出力する。
# 引数にファイル名を記入しなかった場合は、標準入力からのデータを処理する。
# 通常、パイプとリダイレクトを併用する。

# 参考：https://www.youtube.com/watch?v=32waL1Z9XK0
# This helps me a lot to get this command. Thank you, Kris :)

if [ -e ./outputs/sed1.txt ]; then
    touch ./outputs/sed1.txt
fi
echo "He said that that that that that girl said was wrong" > ./outputs/sed1.txt

# 初期値
printf "------初期値-------\n\n"
cat outputs/sed1.txt
printf "\n---------------------------\n\n"

# 小文字のtを大文字のTに変更し、新しいファイルとして保存
# 指定のやり方：'s/変更前/変更後/g'
printf "sed 's/that/THAT/g' outputs/sed1.txt > outputs/new.txt\n"
sed 's/that/THAT/g' outputs/sed1.txt > outputs/new.txt
cat outputs/new.txt
printf "\n---------------------------\n\n"

# 同じファイルに上書き(-i) ※注意
# メモ：自分の環境下で動作せず。Linuxによって、-i オプション使えない事が模様。
# その場合は、新しくファイルを作って元のファイルをrmする。
printf "sed -i 's/that/THAT/g' outputs/sed1.txt\n"
sed -i 's/this/THAT/g' outputs/sed1.txt
cat outputs/sed1.txt
printf "\n---------------------------\n\n"

# その他の指定方法参考：
# https://www.atmarkit.co.jp/ait/articles/1610/17/news015.html
