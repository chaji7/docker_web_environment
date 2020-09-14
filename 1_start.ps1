$list = Get-ChildItem -Path ..\volumes -Directory -Name
foreach($project in $list){
  Out-File -Append -Encoding "UTF8" -FilePath  "C:\Windows\System32\drivers\etc\hosts" -InputObject "127.0.0.1`t$project.example.php53"
  Out-File -Append -Encoding "UTF8" -FilePath  "C:\Windows\System32\drivers\etc\hosts" -InputObject "127.0.0.1`t$project.example.php56"
  Out-File -Append -Encoding "UTF8" -FilePath  "C:\Windows\System32\drivers\etc\hosts" -InputObject "127.0.0.1`t$project.example.php72"
  Out-File -Append -Encoding "UTF8" -FilePath  "C:\Windows\System32\drivers\etc\hosts" -InputObject "127.0.0.1`t$project.example.php74"
}