#!/bin/bash

# tarとは:
# 「tar」は、複数のファイルを1つにまとめた“アーカイブファイル”を作成／展開するコマンド。

# １つのファイルに圧縮して保存する
# これは、zcvfで覚えてしまう。
# zはgzip、cは圧縮、vは出力、fがファイル
currentDir=`pwd | tr '/' '\n' | tail -1`
sudo tar zcvf ./outputs/tar.gz "$currentDir"
ls -lh outputs/tar.gz

# bzip2方式を使ってみる
# こっちの方が早くて軽い
sudo tar jcvf ./outputs/tar2.gz "$currentDir"
ls -lh outputs/tar2.gz
