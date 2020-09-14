#!/bin/bash

# IFSとは：
# 環境変数で区切り文字がセットされている。
# 区切り文字を変更したい時は、IFSのデフォルトを変更する。
# デフォルト→ 半角スペース

echo "Enter filename from which you want to read"
read fileName

if [[ -f "$fileName" ]]; then
  while IFS= read -r line
  do
	echo "$line"
  done < $fileName
else
	echo "$fileName doesn't exist"
fi

