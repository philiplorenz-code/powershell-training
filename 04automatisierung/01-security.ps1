## EXECUTION POLICY

<#
Execution Policy
- AllSigned
- ByPass
- Default:
-Restricted for Windows clients
-RemoteSigned for Windows servers
- RemoteSigned
- Restricted
- Unrestricted
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.3
#>

Get-ExecutionPolicy
Set-ExecutionPolicy Unrestricted



# SIGNIERTE SKRIPTS

# Hier ändern wir die Execution Policy auf RemoteSigned, um signierte Skripte auszuführen
Set-ExecutionPolicy Restricted -Scope CurrentUser

# Hier erstellen wir ein unsigniertes Skript
Set-Content -Path ".\UnsignedScript.ps1" -Value "Write-Output 'Dies ist ein unsigniertes Skript'"

# Hier versuchen wir, das unsignierte Skript auszuführen
.\UnsignedScript.ps1

# Hier erstellen wir ein Zertifikat für die Signierung von Skripten
$cert = New-SelfSignedCertificate -Subject CodeSigningCert -NotAfter (Get-Date).AddMonths(24) -Type CodeSigningCert

# Hier signieren wir unser Skript mit dem Zertifikat
Set-Content -Path ".\SignedScript.ps1" -Value "Write-Output 'Dies ist ein signiertes Skript'"
Set-AuthenticodeSignature -FilePath ".\SignedScript.ps1" -Certificate $cert

# Hier versuchen wir, das signierte Skript auszuführen
.\SignedScript.ps1
