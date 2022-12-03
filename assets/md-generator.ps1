$export = @()
foreach ($folder in (Get-ChildItem ../)){
  $export += Get-Content ../$folder/_overview.md
}
$export | Set-Content ../README.md