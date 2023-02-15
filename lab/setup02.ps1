# RDP und PS-Remoting erlauben für die Client-Computer
$computers = @("training02","training03","training04","training05","training06","training07","training08","training09","training10")

foreach ($computer in $computers) {
  # RDP erlauben
  New-NetFirewallRule -DisplayName "Allow RDP from $computer" -Direction Inbound -Protocol TCP -LocalPort 3389 -RemoteAddress 10.3.7.10[2-10] -Action Allow

  # PS-Remoting erlauben
  Enable-PSRemoting -Force
  Set-Item WSMan:\localhost\Client\TrustedHosts -Value $computer
}

# RDP-Einstellungen aktualisieren
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-Name "fDenyTSConnections" -Value 0

# Firewall-Regel für PS-Remoting erstellen
New-NetFirewallRule -DisplayName "Allow PSRemoting" -Direction Inbound -Protocol TCP -LocalPort 5985 -Action Allow

# Überprüfung, ob die Änderungen erfolgreich durchgeführt wurden
Get-NetFirewallRule | Where-Object { $_.DisplayName -like "Allow RDP from*" -or $_.DisplayName -eq "Allow PSRemoting" }






$computers = @("training02", "training03", "training04", "training05", "training06", "training07", "training08", "training09", "training10")
$ips = @("10.3.7.102", "10.3.7.103", "10.3.7.104", "10.3.7.105", "10.3.7.106", "10.3.7.107", "10.3.7.108", "10.3.7.109", "10.3.7.110")

for ($i = 0; $i -lt $computers.Length; $i++) {
  $computer = $computers[$i]
  $ip = $ips[$i]

  $computer
  # Enable PS-Remoting
  Enable-PSRemoting -Force -Confirm:$false
  Set-Item WSMan:\localhost\Client\TrustedHosts -Value $computer -Force -Confirm:$false
  # Allow RDP
  Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0 -Confirm:$false

  # Add firewall rule to allow RDP
  New-NetFirewallRule -DisplayName "Allow RDP" -Direction Inbound -Protocol TCP -LocalPort 3389 -RemoteAddress $ip -Action Allow -Confirm:$false
}

# Output the hostname and internal IP of the system
Write-Host "Hostname: $env:computername"
Write-Host "Internal IP: $(Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE | Select-Object -ExpandProperty IPAddress | Select-Object -First 1)" 

