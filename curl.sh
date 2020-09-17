#!/bin/bash

# curlとは：
# URLをパラメータにしてそのコンテンツを標準出力させる
# 参考：https://hydrocul.github.io/wiki/commands/curl.html

# 大阪府のホームページのHTMLを抜き取る
curl http://www.pref.osaka.lg.jp/default.html > outputs/osaka.html

# BASIC認証のあるサイトは
# --user ダメな時は --anyauth 試す。(Digest認証、NTLM認証に対応できる)
# curl --user user:password url

# 進捗表示をしないようにする(-s)
