#!/bin/bash

# gzipとは：
# zipファイルにする
seq 100000 > outputs/zip
gzip outputs/zip

# zcatとは：
# 圧縮された状態でcatが使える
zcat outputs/zip.gz

# zgrepとは：
# 圧縮された状態でgrepが使える、zcat | grep と同等
# 5555を検索
zgrep 5555 outputs/zip.gz

# zunzipとは：
# zipファイルを展開する
zunzip outputs/zip.gz
