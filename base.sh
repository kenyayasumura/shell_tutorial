#!/bin/bash

echo ファイル名を入力してください。
read file_name

touch ${file_name}.sh

echo "#!/bin/bash" > ${file_name}.sh

chmod u+x ${file_name}.sh

echo 完了

