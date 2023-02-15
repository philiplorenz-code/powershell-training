#1 
$services = Get-Service
foreach ($service in $services) {
  Write-Output "Name: $($service.Name), Status: $($service.Status)"
}

#2 
$files = Get-ChildItem
foreach ($file in $files) {
  Write-Output "Name: $($file.Name)"
}

#3 
$content = Get-Content -Path <Pfad zur Textdatei>
foreach ($line in $content) {
  Write-Output "Inhalt: $line"
}

#4
function Get-FolderInformation {
  param (
    [string]$Path
  )

  $files = Get-ChildItem -Path $Path
  $fileCount = $files.Count
  $folderSize = (Get-ChildItem $Path -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB

  Write-Output "Anzahl der Dateien: $fileCount"
  Write-Output "Größe des Ordners (in MB): $folderSize"
}

#5
param (
  [string]$SourcePath,
  [string]$DestinationPath
)

$cutoffDate = (Get-Date).AddDays(-30)

Get-ChildItem -Path $SourcePath | Where-Object { $_.LastWriteTime -lt $cutoffDate } | Move-Item -Destination $DestinationPath


#6 
$telefonbuch = @{
  "Anna Bauer" = "0123456789";
  "Bertram Schmidt" = "9876543210";
  "Clara Meyer" = "1234567890";
}

$telefonnummer = $telefonbuch["Anna Bauer"]
Write-Output "Die Telefonnummer von Anna Bauer ist $telefonnummer"

$telefonbuch["David Miller"] = "111111111"
$telefonbuch


# 7
function Get-TelefonbuchEintrag {
  param($telefonbuch, $telefonnummer)
  $gefunden = $false
  foreach ($name in $telefonbuch.Keys) {
    if ($telefonbuch[$name] -eq $telefonnummer) {
      Write-Output "Die Telefonnummer $telefonnummer gehört zu $name"
      $gefunden = $true
      break
    }
  }
  if (!$gefunden) {
    Write-Output "Die Telefonnummer $telefonnummer ist nicht im Telefonbuch enthalten."
  }
}

$telefonbuch = @{
  "Anna Bauer" = "0123456789";
  "Bertram Schmidt" = "9876543210";
  "Clara Meyer" = "1234567890";
}

Get-TelefonbuchEintrag -telefonbuch $telefonbuch -telefonnummer "0123456789"


#8 
$dateien = Get-ChildItem -File
if ($dateien.Length -gt 3) {
  Write-Warning "Es sind mehr als 3 Dateien im aktuellen Verzeichnis vorhanden."
}
