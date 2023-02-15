# Modul-Pfade
$env:PSModulePath

# https://www.powershellgallery.com

Install-Module -Name PSWindowsUpdate -Force
Get-Package -Name PSWindowsUpdate





Install-Module -Name ImportExcel

Get-Command -Module ImportExcel

# https://www.powershellgallery.com/packages/ImportExcel/7.8.3


# Hier importieren wir das PowerShell-Modul ImportExcel
Import-Module ImportExcel

# Hier importieren wir eine Excel-Datei in ein PowerShell-Objekt
$excelData = Import-Excel -Path "C:\Test\Daten.xlsx"

# Hier geben wir die Daten aus dem Excel-Blatt "Tabelle1" aus
$excelData | Where-Object { $_.Worksheet -eq "Tabelle1" } | Select-Object *

# Hier fügen wir eine neue Zeile in das Excel-Blatt "Tabelle1" hinzu
$newRow = New-Object psobject
$newRow | Add-Member -MemberType NoteProperty -Name "Spalte1" -Value "Wert1"
$newRow | Add-Member -MemberType NoteProperty -Name "Spalte2" -Value "Wert2"
$excelData | Where-Object { $_.Worksheet -eq "Tabelle1" } | Add-ExcelRow -Object $newRow -AutoSize

# Hier speichern wir die Änderungen in der Excel-Datei
$excelData | Export-Excel -Path "C:\Test\Daten.xlsx"
