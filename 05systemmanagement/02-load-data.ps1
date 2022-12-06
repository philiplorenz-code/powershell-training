# Txt
$content = Get-Content .\log1.log
$content = $content + 1
Set-Content -Value $content -Path .\log1.log

# Csv
Get-Process | Export-Csv .\proc.csv -NoTypeInformation
$import = Import-Csv C:\Users\philip\Code\powershell-training\05systemmanagement\assets\test.csv

# CSV = Comma Seperated Value -> Werte durch Kommata getrennt! (Achtung: Excel nimmt hierzu ein Semikolon ; -> Zeile markieren -> Daten -> Text in Spalten -> Getrennt -> Komma)

#Beispiel CSV: 
#name,vorname,geburtsort
#Mustermann,Max,Mannheim
#Lorenz,Philip,Wuerzburg


"name,vorname,geburtsort" | Out-File -FilePath ".\testcsv.csv" -Append
"Mustermann,Max,Mannheim" | Out-File -FilePath ".\testcsv.csv" -Append
"Lorenz,Philip,Wuerzburg" | Out-File -FilePath ".\testcsv.csv" -Append

# Tipp: Edit CSV in VSCode -> vscode-edit-csv


# json
# https://dummyjson.com/
$webData = Invoke-WebRequest -Uri "https://dummyjson.com/products"
($webData.Content | ConvertFrom-Json).products