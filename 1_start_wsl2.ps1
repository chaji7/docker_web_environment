$list = Get-ChildItem -Path ..\volumes -Directory -Name
$wsl_ip = bash.exe -c "hostname -I | cut -f1 -d' '"
foreach($project in $list){
  Out-File -Append -Encoding "UTF8" -FilePath  "C:\Windows\System32\drivers\etc\hosts" -InputObject "$wsl_ip`t$project.example.php53"
  Out-File -Append -Encoding "UTF8" -FilePath  "C:\Windows\System32\drivers\etc\hosts" -InputObject "$wsl_ip`t$project.example.php56"
  Out-File -Append -Encoding "UTF8" -FilePath  "C:\Windows\System32\drivers\etc\hosts" -InputObject "$wsl_ip`t$project.example.php72"
  Out-File -Append -Encoding "UTF8" -FilePath  "C:\Windows\System32\drivers\etc\hosts" -InputObject "$wsl_ip`t$project.example.php74"
}