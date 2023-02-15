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
Get-Service | Where-Object { $_.DisplayName -like "*Event*" }

# Sort-Object
Get-Service | Where-Object { $_.DisplayName -like "*Event*" } | Sort-Object Name -Descending


# Objekte erstellen und verarbeiten (PSCustomObject) 
$computer = [PSCustomObject]@{
  Computername   = $env:COMPUTERNAME
  Betriebssystem = (Get-CimInstance -ClassName Win32_OperatingSystem).Caption
  Speicher       = (Get-CimInstance -ClassName Win32_OperatingSystem).TotalVisibleMemorySize
}

# Hier geben wir das gesamte Objekt aus
$computer

# Hier geben wir nur den Wert der Eigenschaft "Computername" aus
$computer.Computername

# Hier fügen wir eine neue Eigenschaft hinzu, die die Anzahl der installierten Anwendungen angibt
#$computer | Add-Member -MemberType NoteProperty -Name "Anzahl installierter Anwendungen" -Value (Get-CimInstance -ClassName Win32_Product | Measure-Object | Select-Object -ExpandProperty Count)
$params = @{
  "MemberType" = "NoteProperty"
  "Name"       = "InstalledApplicationsCount"
  "Value"      = (Get-CimInstance -ClassName Win32_Product | Measure-Object | Select-Object -ExpandProperty Count)
}
$computer | Add-Member @params

# Hier geben wir das gesamte Objekt wieder aus, um zu sehen, dass die neue Eigenschaft hinzugefügt wurde
$computer
$computer | Format-List
