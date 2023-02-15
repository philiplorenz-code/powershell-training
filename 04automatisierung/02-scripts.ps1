param(
    [string]$Username
)

# Hier holen wir Informationen zum angegebenen Benutzer
$user = Get-WmiObject -Class Win32_UserProfile -Filter "LocalPath='C:\\Users\\$Username'"

# Hier berechnen wir die Größe des Benutzerprofils
$profileSize = (Get-ChildItem "C:\Users\$Username" -Recurse | Measure-Object -Property Length -Sum).Sum

# Hier geben wir die Informationen zum Benutzerprofil aus
Write-Output "Benutzer: $Username"
Write-Output "Profilpfad: $($user.LocalPath)"
Write-Output "Profilgröße (in Bytes): $profileSize"
