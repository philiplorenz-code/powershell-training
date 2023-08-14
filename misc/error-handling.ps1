$ErrorActionPreference = "Stop" # Stopt die Ausführung bei Fehlern

try {
    Get-Item "nonexistentfile.txt" -ErrorAction Stop
}
catch {
    Write-Host "Ein Fehler ist aufgetreten: $_"
}
finally {
    Write-Host "Das wurde nach Try und Catch ausgeführt"
}


# Throw - eigene Fehler werfen:
if (-not (Test-Path "somefile.txt")) {
    throw "Die Datei somefile.txt existiert nicht!"
}


# War vorheriger Befehl erfolgreich?
Get-Item "nonexistentfile.txt"
if (-not $?) {
    Write-Host "Der vorherige Befehl ist fehlgeschlagen!"
}

# Liste der Fehler
$Error

# Eigene Fehler-Variable
Get-Item "nonexistentfile.txt" -ErrorAction SilentlyContinue -ErrorVariable myError

if ($myError) {
    Write-Host "Es gab einen Fehler: $myError"
}
