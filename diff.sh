#!/bin/bash

# ファイルやディレクトリを比較し、異なる箇所を出力するコマンド。
# 出力内容を差分と呼び、patchコマンドで差分をもとにファイルを更新したり、もとに戻せる。

if [ ! -e ./outputs/diff1.txt ]; then
    touch ./outputs/tr1.txt
    echo 'Ask what your country can do for you; ask what you can do for your country' | tee outputs/diff1.txt outputs/diff2.txt
    echo 'added text' >> outputs/diff2.txt
fi

# 差分を表示
diff outputs/diff1 outputs/diff2

# 差分の有無を表示
diff -q outputs/diff1 outputs/diff2

# ディレクトリ内を検索するときはfindでディレクトリのリストを作り、
# それぞれのディレクトリに入ってから作業する。（そうしないとフルパスが入ってしまう。）
# diff -r だけだと、全ファイル見に行ってしまうのでファイル数によっては時間かかる。
# 例：
# find . > /home/dir/new
# cd /var/log.hogehoge/
# find . > /home/dir/old
# cd /var/log.hogehoge/
# diff /home/dir/new /home/dir/old
# =>ワンライナー
# diff <(cd /var/log/;find) <(cd /var/log.hogehoge;find)
