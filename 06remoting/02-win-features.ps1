# Modul zur Installaition von Features
Import-Module ServerManager

# Web-Server Feature installieren (inkl. Unter-Features)
Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature

# Windows-Feature auf einer Reihe von Computern installieren
foreach ($server in $servers){
    Install-WindowsFeature -Name Web-Server -ComputerName  -IncludeAllSubFeature
}

# Beispiel: Installation des SMB1-Protokolls
Install-WindowsFeature FS-SMB1

# Überprüfen, ob das SMB1-Protokoll installiert ist
if (Get-WindowsFeature | Where-Object { $_.Name -eq 'FS-SMB1' } | Select-Object -ExpandProperty Installed) {
  Write-Host "SMB1-Protokoll ist bereits installiert."
} else {
  Write-Host "SMB1-Protokoll wurde installiert."
}
