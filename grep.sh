#!/bin/bash

# grep とは：
# ファイルの中で「文字列（パターン）」が含まれている行を表示するコマンド。
# 検索対象には、複数のファイルやディレクトリを指定できる。
# また、ファイルを指定しなかった場合は、標準入力から読み込む。

# 参考：https://www.youtube.com/watch?v=VGgTmxXp7xQ

for fileName in ./outputs/grep1.txt ./outputs/grep2.txt ./outputs/grep3.txt ./outputs/phone.txt
do
    if [ ! -e $fileName ]; then
        touch $fileName
        if [ $fileName = "./outputs/phone.txt" ]; then
            echo "$fileName：適当に電話番号を入力してください"
        else
            echo "$fileName：適当に名前を入力してください"
        fi
        read -r insertedTextText
        echo "$insertedTextText" >> $fileName
    else
        echo 'ando takaki sakamoto yasumura ANDO TAKAKI SAKAMOTO YASUMURA' >> outputs/grep1.txt
        echo 'yasumura tarou satou gotou mitani nakamura hasegawa okuno' >> outputs/grep2.txt
        echo 'tanaka yamada yamamoto yoshida shimozawa nakagawa takaki' >> outputs/grep3.txt
        echo '012-3456-7890 234-567-890 456-789-012' >> outputs/phone.txt
    fi
done

#ヒットしたものすべて表示
printf "\n grep 'yasumura' outputs/grep1.txt \n"
grep 'yasumura' outputs/grep1.txt
printf "\n\n---------------------------\n\n"

#完全一致(-w)だけ表示
printf "\n grep -w 'yasumura' outputs/grep1.txt \n"
grep -w 'yasumura' outputs/grep1.txt
printf "\n\n---------------------------\n\n"

#完全一致でかつ、大文字小文字を区別せず(-i)表示
printf "\n grep -wi 'yasumura' outputs/grep1.txt \n"
grep -wi 'YaSuMuRa' outputs/grep1.txt
printf "\n\n---------------------------\n\n"

#完全一致でかつ、大文字小文字を区別せず、行数(-n)も表示
printf "\n grep -win 'yasumura' outputs/grep1.txt \n"
grep -win 'YASUMURA' outputs/grep1.txt
printf "\n\n---------------------------\n\n"

#検索結果から５行前(-B num)まで表示
printf "\n grep -win -B 5 'yasumura' outputs/grep1.txt \n"
grep -win -B 5 'yasumura' outputs/grep1.txt
printf "\n\n---------------------------\n\n"

#検索結果から５行後(-A num)まで表示
printf "\n grep -win -A 5 'yasumura' outputs/grep1.txt \n"
grep -win -A 5 'yasumura' outputs/grep1.txt
printf "\n\n---------------------------\n\n"

#検索結果から３行前後(-C num)まで表示
printf "\n grep -win -C 3 'yasumura' outputs/grep1.txt \n"
grep -win -C 3 'yasumura' outputs/grep1.txt
printf "\n\n---------------------------\n\n"

#現在のディレクトリ配下すべて検索
printf "\n grep -wi 'yasumura' ./* \n"
grep -win 'yasumura' ./*
printf "\n\n---------------------------\n\n"

#サブディレクトリも含めすべて検索(-r)
printf "\n grep -winr 'yasumura' . \n"
grep -winr 'yasumura' .
printf "\n\n---------------------------\n\n"

#検索対象が見つかったファイル名のみ表示(-l)
printf "\n grep -wirl 'yasumura' . \n"
grep -wirl 'yasumura' .
printf "\n\n---------------------------\n\n"

#検索結果の数も表示(-c)
printf "\n grep -wirc 'yasumura' . \n"
grep -wirc 'yasumura' .
printf "\n\n---------------------------\n\n"

#複数のコマンドをつなげる(|)
printf "\n history | grep 'ls' | grep 'a' \n"
history | grep 'ls' | grep 'a'
printf "\n\n---------------------------\n\n"

#正規表現を使う (.)すべての文字１文字、（d)すべての数字、{num}文字数
#grep '...-...-...' outputs/phone.txt
#環境によっては -P コマンドが不要(Mac)
printf "\n grep -wirlP '\d{3}-\d{3}-\d{3}' . \n"
grep -wirlP '\d{3}-\d{3}-\d{3}' .
