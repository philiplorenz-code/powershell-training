Enable-PSRemoting -Force -SkipNetworkProfileCheck
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "10.3.7.104" -Force

# TODO: selbst auf allen machen
<#
  10.3.7.101 <-> 10.3.7.102
  10.3.7.103 <-> 10.3.7.104
  10.3.7.105 <-> 10.3.7.106
  10.3.7.107 <-> 10.3.7.108
  10.3.7.109 <-> 10.3.7.110
#>

# Remote-fähige CMDlets finden:
Get-Command -ParameterName ComputerName

# Interaktive PS-Session
$Cred = Get-Credential
Enter-PSSession -ComputerName dc01 -Credential $Cred
Exit-PSSession

# 1:N Befehle
Invoke-Command -ComputerName dc01, sql02, web01 {Get-Service -Name W32time} -Credential $Cred

# Session Erstellen
$Session = New-PSSession -ComputerName dc01, sql02, web01 -Credential $Cred
Invoke-Command -Session $Session {Get-Service -Name W32time}
Get-PSSession | Remove-PSSession