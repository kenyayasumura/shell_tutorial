#!/bin/bash

# 条件オプション

# 未入力をチェック
echo 文字を入力してください。
read hoge

if [ -z "$hoge" ];then
  echo 入力されていません。
  exit
fi

if [ -n "$hoge" ];then
  echo 入力されました。
  exit
fi

# !を使うと反転できる
if [ ! -z "$hoge" ];then
  echo -nと同じ結果です。
fi

# ファイル有無をしらべる
echo ファイルパスを入力してください。
read file

if [ -e $file ];then
  echo "$file"は存在します。
fi

# ディレクトリかどうか
if [ -d $file ];then
  echo "$file"はディレクトリです。
fi

# 読み取り可能か
if [ -r $file ];then
  echo "$file"は読み取り可能です。
else 
  echo "$file"は読み取りできません。
fi

# 書き込み可能か
if [ -r $file ];then
  echo "$file"は書き込み可能です。
else
  echo "$file"は書き込みできません。
fi

# 実行可能か
if [ -x $file ];then
  echo "$file"は実行可能です。
else
  echo "$file"は実行できません。
fi

# ファイルサイズが０以上か
if [ -s $file ];then
  echo "$file"のサイズは０以上です。
else
  echo "$file"のサイズは０です。
fi

# 普通のファイルか
if [ -f $file ];then
  echo "$file"は普通のファイルです。
fi
