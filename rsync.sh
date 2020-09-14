#!/bin/bash

# rsyncとは：
# ディレクトリをコピーするコマンド

if [ ! -e outputs/rsync* ]; then
    mkdir outputs/rsync1 outputs/rsync2
    touch outputs/rsync1/dummy
fi

# rsync1をrsync2の下にコピーする。
# 権限などのファイルの属性を残す（-a）、 ログにコピーファイルを出力(-v)
# 注意：２つ以上深いディレクトリは作ってくれないので事前に用意する必要あり。
rsync -av outputs/rsync1 outputs/rsync2/
ls outputs/rsync2/*

# rsyncで変化のあったファイルやディレクトリは同期してくれるので、２回目以降は速度が上がる。
# シンボリックファイルのパス等は遷移前とまったく同じになる
