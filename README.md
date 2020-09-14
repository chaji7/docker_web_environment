Docker_multi_domain


#[事前準備]

##Windows

※Windowsでdocker-composeと使うには現状Windows 10 Proじゃないとダメ(2020/04/23)

・Docker for Windowsをインストール

・Docker Composeをインストール

##Mac

・Docker for Macをインストール

・docker-composeをインストール

#[設定]

・カレントディレクトリ以下にdockerディレクトリを作成する

・dockerディレクトリ内にmulti_domainディレクトリを設置する

・dockerディレクトリ内にvolumesディレクトリを作成する
　 このmulti_domainディレクトリと同じ階層にvolumesディレクトリを作成し、
　 その下に各案件ディレクトリが並ぶようにする

    Windows_Ex.
        C:\Users\ユーザー名\docker\multi_domain
        C:\Users\ユーザー名\docker\volumes
        C:\Users\ユーザー名\docker\volumes\anken1\www
        C:\Users\ユーザー名\docker\volumes\anken2\www

    Mac_Ex.
        ~/docker/multi_domain
        ~/docker/volumes
        ~/docker/volumes/anken1/www
        ~/docker/volumes/anken2/www


#[実行]

・ターミナルでmulti_domainディレクトリまで移動する

  cd ~/docker/multi_domain/

・hostsに各案件ディレクトリを追加する

    －hostsファイルの場所
        Windows:C:\Windows\System32/drivers/etc/hosts
        Mac:/etc/hosts
    －追加する記述
        127.0.0.1 xxx.example53
        127.0.0.1 xxx.example56
        127.0.0.1 xxx.example72

・以下のコマンドを実行する

　docker-compose up -d

・全コンテナが「done」となったことを確認する

・動作確認

　－php5.3環境：php53
　    xxx.example.php53
     
　－php5.6環境：php56
　    xxx.example.php56
     
　－php7.2環境：php72
　    xxx.example.php72
     
　－DB：mysql57
 
　－phpmyadmin1(mysql5.7用)
      localhost:9000
      
　－mailhog
      localhost:8025
      
　－DB：mysql80
 
　－phpmyadmin2(mysql8.0用)
　   localhost:9001
    
　－DB：postgresql
 
　－pgadmin4(postgresql用)

#[hosts自動設定スクリプト]

まだ調整中。

・Windows

　－起動
 
      1_admin_start.batを右クリックで管理者として実行する
      
      　　→管理者権限で1_start.ps1を実行するようにしていて、PowerShellでhostsに案件名を自動で出力するようにしている。
        
　－停止
 
      1_admin_end.batを右クリックで管理者として実行する
      
      　　→管理者権限で2_elete.ps1を実行するようにしていて、PowerShellでhostsに案件名を自動で削除するようにしている。
        
・Mac

　－起動
 
      ターミナル起動
      
      cd ~/docker/multi_domain/
      
      sudo start.sh
      
      　→シェルスクリプトで案件名をhostsに記述し、docker-compose up -dも一緒に実行する
       
　－停止
 
      ターミナル起動
      
      cd ~/docker/multi_domain/
      
      sudo stop.sh
      
      　→シェルスクリプトで案件名をhostsから削除し、docker-compose stopも一緒に実行する
