
############################
## hostsファイルの設定
############################

#!/bin/sh
#案件ディレクトリごとにhostsファイルに直接
#記述していく

# 区切り文字を改行コードに指定
IFS=$'\n'

# ファイルを配列に読み込む
file=(`ls ../volumes/`)

# 行ごとに繰り返し処理を実行
ln=0
for line in "${file[@]}"; do
    sudo sh -c "echo '127.0.0.1 ${line}.example.php53' >> /etc/hosts"
    sudo sh -c "echo '127.0.0.1 ${line}.example.php56' >> /etc/hosts"
    sudo sh -c "echo '127.0.0.1 ${line}.example.php72' >> /etc/hosts"
    sudo sh -c "echo '127.0.0.1 ${line}.example.php74' >> /etc/hosts"
done

############################
## Docker環境の起動
############################

#　Docker環境の起動
docker-compose up -d
