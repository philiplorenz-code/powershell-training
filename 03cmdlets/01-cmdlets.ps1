<#
  Aufbau:
  Verb-Nomen -Parameterliste

  Verben:
  Get
  Set
  Add
  Remove
  Select

  Substantiv:
  Process
  Member
  Volume
  Disk
#>

# Prozesse auslesen
Get-Process

# Items (Files&Ordner) eines Verzeichnisses auslesen
Get-ChildItem

# Services auslesen
Get-Service

# Text in der Konsole ausgeben
Write-Output "Das hier ein ein Text"

# Warnung auf der Konsole ausgeben
Write-Warning "Das hier ein ein Text"

# Fehler auf der Konsole ausgeben
Write-Error "Das hier ein ein Text"

# Verbindung zu einem bestimmten Host testen ("ping")
Test-Connection -ComputerName 8.8.8.8 

# Prüfen, ob ein Pfad auf dem FileSystem existiert
Test-Path -Path "C:\Users\Administrator\PowerShell\Folder2"

# Inhalt einer Datei auslesen
Get-Content -Path ".\assets\test.txt"

# ExecutionPolicy setzen
Set-ExecutionPolicy -Unrestricted