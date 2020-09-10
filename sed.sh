#!/bin/bash

# sedとは：
# stream editor の略で、指定したファイルをコマンドに従って処理し、標準出力へ出力する。
# 引数にファイル名を記入しなかった場合は、標準入力からのデータを処理する。
# 通常、パイプとリダイレクトを併用する。
# 区切り文字は;や@でもいい。(/を文字として利用したい、かつエスケープめんどくさいとき)
# 例：echo "abc/def" | sed 's;/;_;' or sed 's@/@_@'

# 参考：https://www.youtube.com/watch?v=32waL1Z9XK0
# This helps me a lot to get this command. Thank you, Kris :)

if [ -e ./outputs/sed1.txt ]; then
    touch ./outputs/sed1.txt
fi
echo "He said that that that that that girl said was wrong" > ./outputs/sed1.txt

# 初期値
cat outputs/sed1.txt

# 小文字のtを大文字のTに変更し、新しいファイルとして保存
# 指定のやり方：'s/変更前/変更後/g'

sed 's/that/THAT/g' outputs/sed1.txt > outputs/new.txt
cat outputs/new.txt

# 同じファイルに上書き(-i) ※注意
# メモ：自分の環境下で動作せず。Linuxによって、-i オプション使えない事が模様。
# その場合は、新しくファイルを作って元のファイルをrmする。

sed -i 's/this/THAT/g' outputs/sed1.txt
cat outputs/sed1.txt

# 何行目から何行目という指定方法
# ｓの前に　開始行,修了行　と記入する
# ちなみに１文字だけ入れれば特定の行のみ、$を入力すれば最終行となる。

echo {a..e} | xargs -n 1 | sed '2,4s/./???/'

# 正規表現を使った場合

echo {a..e} | xargs -n 1 | sed '/b/,/d/s/./???/'

# その他の指定方法参考：
# https://www.atmarkit.co.jp/ait/articles/1610/17/news015.html

# 行を指定して抽出する
# pについて：sed -n '指定範囲p' で指定した範囲をprintする

echo {a..e} | xargs -n 1 | sed -n '4p'
echo {a..e} | xargs -n 1 | sed -n '2,4p'

# バックアップを作成する(-i.拡張子)
# echo 卵 | tee egg1 egg2 egg3
# sed -i.txt 's/卵/玉子/g' egg{1,2,3}
# cat egg{1,2,3}
