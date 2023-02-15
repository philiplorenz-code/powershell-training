# Filter mit Where:
Get-ChildItem C:\Users\philip\Code\stueckliste | Get-Member
Get-ChildItem C:\Users\philip\Code\stueckliste | Where-Object {$_.LastAccessTime -gt (Get-Date).AddMinutes((-10))}

# Achtung - lieber mit CMDlet-Parameter filtern, falls möglich:
Get-ChildItem C:\Users\philip\Code\powershell-training\04automatisierung | Where-Object {$_.Name -like "01-securi*"}
Get-ChildItem C:\Users\philip\Code\powershell-training\04automatisierung -Name "01-securi*"



# Wechsel auf Partition C
Set-Location C:\logs
# Fragt alle Elemente des aktuellen Verzeichnisses rekursiv (Unterordner werden ebenfalls abgefragt) ab und speichert diese in einer Variable 
$AllFiles = Get-ChildItem -Recurse
$AllFiles   | Where-Object {$_.Extension -eq ".log"} `
            | Select-Object FullName,IsReadOnly,CreationTime,LastWriteTime,LastAccessTime `
            | Out-GridView
            
            # Selektiert die Ausgabe nach einen gewissen Attribut (und einem ausgewählten Wert)
            # Legt die anzuzeigenden Attribute fest (* steht dabei für alle Attribute)
            # Möglichkeit sich das Ergebnis in einem grafischen Interface anzeigen zu lassen


# Hier erstellen wir eine Liste mit Prozessen
$processes = Get-Process

# Hier filtern wir die Prozesse nach Namen
$filteredProcesses = $processes | Where-Object { $_.Name -eq "notepad" }
Write-Output "Prozesse mit Namen 'notepad':"
Write-Output $filteredProcesses

# Hier filtern wir die Prozesse nach Arbeitsspeicher-Nutzung
$filteredProcesses = $processes | Where-Object { $_.WorkingSet -gt 100MB }
Write-Output "Prozesse mit mehr als 100 MB Arbeitsspeicher-Nutzung:"
Write-Output $filteredProcesses

# Hier filtern wir die Prozesse nach CPU-Nutzung
$filteredProcesses = $processes | Where-Object { $_.TotalProcessorTime.TotalSeconds -gt 10 }
Write-Output "Prozesse mit mehr als 10 Sekunden CPU-Nutzung:"
Write-Output $filteredProcesses
