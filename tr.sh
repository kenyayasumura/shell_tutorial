#!/bin/bash

# trとは：
# 指定した文字列を削除したり、別の文字列に置き換えたりできる。

if [ ! -e ./outputs/tr1.txt ]; then
    touch ./outputs/tr1.txt
    echo 'Ask what your country can do for you; ask what you can do for your country' > outputs/tr1.txt
fi

# 半角スペースを改行に置き換え、.;を削除し（-d）、大文字を小文字に置き換える。
cat outputs/tr1.txt | tr ' ' '\n' | tr -d '.;' | tr 'A-Z' 'a-z' | sort
