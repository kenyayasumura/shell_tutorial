#!/bin/bash

# grep とは：
# ファイルの中で「文字列（パターン）」が含まれている行を表示するコマンド。
# 検索対象には、複数のファイルやディレクトリを指定できる。
# また、ファイルを指定しなかった場合は、標準入力から読み込む。

# 参考：https://www.youtube.com/watch?v=VGgTmxXp7xQ
# This helps me a lot to get this command. Thank you, Corey :)

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
        echo "$insertedTextText" > $fileName
    fi

    echo 'ando takaki sakamoto yasumura ANDO TAKAKI SAKAMOTO YASUMURA' >> outputs/grep1.txt
    echo 'yasumura tarou satou gotou mitani nakamura hasegawa okuno' >> outputs/grep2.txt
    echo 'tanaka yamada yamamoto yoshida shimozawa nakagawa takaki' >> outputs/grep3.txt
    echo '012-3456-7890 234-567-890 456-789-012' >> outputs/phone.txt
done

#ヒットしたものすべて表示
grep 'yasumura' outputs/grep1.txt

#完全一致(-w)だけ表示
grep -w 'yasumura' outputs/grep1.txt

#一致した箇所だけを表示
grep -o 'yasumura' outputs/grep1.txt

#完全一致でかつ、大文字小文字を区別せず(-i)表示
grep -wi 'YaSuMuRa' outputs/grep1.txt


#完全一致でかつ、大文字小文字を区別せず、行数(-n)も表示
grep -win 'YASUMURA' outputs/grep1.txt


#検索結果から５行前(-B num)まで表示
grep -win -B 5 'yasumura' outputs/grep1.txt


#検索結果から５行後(-A num)まで表示
grep -win -A 5 'yasumura' outputs/grep1.txt


#検索結果から３行前後(-C num)まで表示
grep -win -C 3 'yasumura' outputs/grep1.txt


#現在のディレクトリ配下すべて検索
grep -win 'yasumura' ./*


#サブディレクトリも含めすべて検索(-r)
grep -winr 'yasumura' .


#検索対象が見つかったファイル名のみ表示(-l)
grep -wirl 'yasumura' .


#検索結果の数も表示(-c)
grep -wirc 'yasumura' .


#複数のコマンドをつなげる(|)
history | grep 'ls' | grep 'a'


#正規表現を使う (.)すべての文字１文字、（d)すべての数字、{num}文字数
#grep '...-...-...' outputs/phone.txt
#環境によっては -P コマンドが不要(Mac)
grep -wirlP '\d{3}-\d{3}-\d{3}' .

#特定の文字を除いた文を検索する(-v)
#不要な行を-vで削除していくことで、絞り込みもできる。
grep 'satou' outputs/grep2.txt | grep -v 'okuno'
cat /etc/services | grep http | grep -v http- | grep -v https | grep -v ^#
