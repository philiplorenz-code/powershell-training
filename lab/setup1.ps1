$ErrorActionPreference = "Stop"

# Create user "powershelltraining1"
 $username1 = "powershelltraining1"
 $password1 = ConvertTo-SecureString "" -AsPlainText -Force
 $user1 = New-LocalUser -Name $username1 -Password $password1
 Add-LocalGroupMember -Group "Administrators" -Member $username1
 
 # Create user "powershelltraining2"
 $username2 = "powershelltraining2"
 $password2 = ConvertTo-SecureString "" -AsPlainText -Force
 $user2 = New-LocalUser -Name $username2 -Password $password2
 Add-LocalGroupMember -Group "Administrators" -Member $username2
 
 # Enable PS-Remoting
 Enable-PSRemoting -Force
 
 # Enable RDP
 Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
 
 # Install Chocolatey
 Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
 
 # Install TeamViewer using Chocolatey
 choco install teamviewer -y
 

  

# Stelle sicher, dass der Remotedesktop-Dienst gestartet ist
Start-Service -Name "TermService"

# Ändere die Einstellungen für die maximale Anzahl gleichzeitiger RDP-Sessions
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "MaxInstanceCount" -Value 2

# Überprüfen Sie die Änderung
Get-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "MaxInstanceCount"

# Neustart des Remotedesktop-Dienstes, um die Änderungen zu übernehmen
Restart-Service -Name "TermService"

Rename-Computer "training02"

 # Output hostname and internal IP
Write-Output "Hostname: $env:computername"
Write-Output "Internal IP: $(Get-NetIPAddress | Where-Object { $_.IPAddress -like '10.*' } | Select-Object -ExpandProperty IPAddress)"


Restart-Computer