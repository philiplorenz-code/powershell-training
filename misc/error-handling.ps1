# Zielcomputer-Name
$RemoteComputer = "RemoteComputerName"

try {
    # Versucht, eine Verbindung zum Zielcomputer herzustellen
    $DiskInfo = Get-WmiObject -Class Win32_LogicalDisk -ComputerName $RemoteComputer -ErrorAction Stop

    # Ausgabe der Festplatteninformationen
    foreach ($Disk in $DiskInfo) {
        $FreeSpaceGB = [Math]::Round($Disk.FreeSpace / 1GB, 2)
        $SizeGB = [Math]::Round($Disk.Size / 1GB, 2)
        Write-Host "Laufwerk $($Disk.DeviceID): Freier Speicherplatz $FreeSpaceGB GB von $SizeGB GB"
    }
} catch [System.Runtime.InteropServices.COMException] {
    # Behandlung von Verbindungsproblemen
    Write-Host "Es konnte keine Verbindung zum Computer '$RemoteComputer' hergestellt werden. Bitte überprüfe die Verbindung und den Computernamen." -ForegroundColor Red
} catch {
    # Behandlung anderer Fehler
    Write-Host "Ein unerwarteter Fehler ist aufgetreten: $($_.Exception.Message)" -ForegroundColor Red
} finally {
    # Abschließende Aktionen, z. B. Protokollierung oder Bereinigung
    Write-Host "Fertig mit der Verarbeitung von '$RemoteComputer'."
}


# Exception-Type herausfinden:
$error[0].exception.gettype().fullname
# Liste von Exception-Types:
# https://powershellexplained.com/2017-04-07-all-dotnet-exception-list/#systemruntimeinteropservicescomexception
