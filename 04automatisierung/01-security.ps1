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


# Hier ändern wir die Execution Policy auf RemoteSigned, um signierte Skripte auszuführen
Set-ExecutionPolicy Restricted -Scope CurrentUser
