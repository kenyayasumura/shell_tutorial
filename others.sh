#!/bin/bash

# df/du/ps
# 参考：https://qiita.com/rana_kualu/items/7b62898d373901466f5c

# dfとは：
# ディスク及びシステム容量がどれだけ使用されているか一覧を表示する
# -hオプションをつけると見やすく整形してくれる

df -f

# duとは：
# 指定ディレクトリとサブディレクトリの使用量を表示
# --max-depth=num で指定したディレクトリ階層までを表示してくれる

du -h --max-depth=1

# psとは：
# ユーザーが実行中のプロセス（ジョブ）を表示する

ps

# ダミーファイル作成
# <<で標準入力からデータを挿入、以下の場合finと入力すると完了し、dummydataというファイルが作られる
# cat << fin > dummydata

echo "<()"
diff <(cd outputs;cat diff1.txt) <(cd outputs;cat diff2.txt)

# <()>とは：
# プロセス置換といい、bashの機能。本来ファイルが入る場所ですが、代わりにコマンドを入れたいときに使う。

echo "NF FR"
# NFはフィールド数
# NRは行数
