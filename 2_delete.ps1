# hostsファイル取得、文字列として1行ずつの配列に入れる
$file = "C:\Windows\System32\drivers\etc\hosts"
$data = (Get-Content $file) -as [string[]]

# 配列ループしながら、末尾がphpxxの行を空白行に置換してhostsファイルを上書きしていく
$i=1
$test = @()
foreach($l in $data){
    if($l -match "php[1-9]{2}$"){
        $lnum = $(Select-String -pattern $l –path $file |  foreach { $_.ToString().split(":")[2] } )-1
        If ($lnum -ne -1){
            $data[$lnum]=$null
            $data | Out-File -Encoding UTF8 $file
        }
    }
    $i++
}

# 空白行の削除
Get-Content ${file} | Where-object { $_.trim() -ne "" }
