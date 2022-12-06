# Aktuelles Verzeichnis (auf dem die PowerShell aktuell positioniert ist) anzeigen
Get-Location
pwd

# Verzeichnis wechseln
Set-Location -Path "C:\Users\Administrator\PowerShell\Kapitel5"
cd
cd..
cd/
cd D:

# Alle Elemente (Ordner und Dateien) eines Verzeichnisses ausgeben (Wenn Path-Parameter nicht angegeben ist, wird automatisch das aktuelle Verzeichnis verwendet)
Get-ChildItem
gci
ls
dir

Get-ChildItem -Path "C:\Users\Administrator\PowerShell\Kapitel4"

# Ordner erstellen
New-Item -ItemType Directory -Name Test -Path .
mkdir ./Test

# Datei erstellen
New-Item -ItemType File -Name "test.txt" -Value "Bla"

# Datei auslesen
Get-Content "test.txt"

# Datei kopieren
Copy-Item -Path ".\test.txt" -Destination ".\Destination"
cp .\test.txt .\Destination\newtest.txt

# Datei verschieben
Move-Item -Path ".\test.txt" -Destination ".\Destination"
mv .\test.txt .\Destination\newtest.txt

# Datei löschen
Remove-Item "test.txt"


# PSDrives
# Gibt die verfügbaren PSDrives aus
Get-PSDrive

# Wechselt in ein PS-Drive
Set-Location Cert:

# Erstellt ein neues PSDrive
New-PSDrive -Name Desktop -PSProvider FileSystem -Root "C:\Users\Administrator\Desktop"

# UseCase: Netzlaufwerk als PSDrive hinterlegen -> Bei Wechsel des Freigebe/DFS-Pfades, 
# muss lediglich das PSDrive angepasst werden, nicht das Script