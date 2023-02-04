# Wichtige Auto Variables
$HOME
$PSVersionTable
$null; $true; $false;
$PROFILE

# Werte in Variablen speichern Allgemein
$einevariable = 1
$ergebnis = 5 + 5
$ergebnis + 4

$ergebnis = $ergebnis + 1
$ergebnis++

(5 + 5) - 4

# Werte in Variablen Speichern Fachliches Beispiel
Get-Process

$procs = Get-Process
$procs
Write-Output $procs

$procs.Count

(Get-Process).count
