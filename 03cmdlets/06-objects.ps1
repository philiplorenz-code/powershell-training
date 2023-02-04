# PowerShell-Objekte
Get-Service -Name Dhcp | Get-Member
#System.ServiceProcess.ServiceController


# Methoden und Properties/Eigenschaften
$dhcp = Get-Service -Name Dhcp
$dhcp.Status
$dhcp.ServiceType

# Alle/Spezifische Properties anzeigen
Get-Service -Name Dhcp | Select-Object *
Get-Service -Name Dhcp | Select-Object Name, Status
Get-Service | Select-Object Name, Status

# CMDlets erhalten, welche das Objekt weiterverarbeiten können
Get-Command -ParameterType ServiceController

$service = Get-Service -Name wuauserv
$service.stop()
Get-Service -Name wuauserv
Get-Service -Name wuauserv | Start-Service -PassThru
Get-Service -Name wuauserv | Stop-Service -PassThru

# Where-Objekt
Get-Service | Where-Object {$_.DisplayName -like "*Event*"}

# Sort-Object
Get-Service | Where-Object {$_.DisplayName -like "*Event*"} | Sort-Object Name -Descending