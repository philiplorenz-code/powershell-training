$export = @()
foreach ($folder in (Get-ChildItem ../)){
  $folder
  if (!($folder -like "*README*")){
    $export += Get-Content /$folder/_overview.md
  }
}
$export | Set-Content ../README.md