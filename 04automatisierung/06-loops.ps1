# Schleifen erlauben es dir bestimmte Code-Zeilen beliebig oft auszuführen 
# -> die Anzahl der Durchläufe ist dabei immer an eine Bedingung geknüpft

# For-Schleife
$array = "Test1", "Test2", "Test3", "Test4"
for ($i = 0; $i -lt $array.Count; $i++) {
    $elementnr = $i + 1
    $output = "Element Nr. $elementnr" + " " + $array[$i]
    Write-Output $output
}



# For:
$LogContent = Get-Content -Path "C:\logs\log1.log"
for($i = 0; $i -lt $LogContent.Count; $i++){
    Write-Output ("Neue Zeile " + $LogContent[$i])
}

# Foreach: 
$LogContent = Get-Content -Path "C:\logs\log1.log"
foreach($element in $LogContent){
    Write-Output $element
} # -> Achtung: wir haben hier keine Zählervariable mehr!

# Alternativ ForEach:
$LogContent | ForEach-Object -Process {Write-Output $_}



# While Schleife
Restart-Computer -ComputerName adserver01 -Force 
Start-Sleep -Seconds 10
do {
    Start-Sleep -Seconds 2
    Write-Output "Host Rebooting.."
} until (Test-Connection -ComputerName adserver01 -Count 1 -Quiet)

until (Test-Connection -ComputerName adserver01 -Count 1 -Quiet) {
    Start-Sleep -Seconds 2
    Write-Output "Host Rebooting.."
} 

# Until Schleife
Restart-Computer -ComputerName adserver01 -Force 
Start-Sleep -Seconds 10
do {
    Start-Sleep -Seconds 2
    Write-Output "Host Rebooting.."
} while (!(Test-Connection -ComputerName adserver01 -Count 1 -Quiet))

while (Test-Connection -ComputerName adserver01 -Count 1 -Quiet) {
    Start-Sleep -Seconds 2
    Write-Output "Host Rebooting.."
} 