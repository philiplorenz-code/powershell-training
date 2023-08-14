Enable-PSRemoting -Force -SkipNetworkProfileCheck
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "10.3.7.104" -Force

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