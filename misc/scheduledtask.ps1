$TaskName = "DailyPowershellScript"
$TaskDescription = "Führt das PowerShell-Skript 02-help.ps1 täglich um 11:00 Uhr aus."
$ScriptPath = "Y:\powershell-training\03cmdlets\02-help.ps1"
$TriggerTime = "11:00:00"
$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -WindowStyle Hidden -File $ScriptPath"
$Trigger = New-ScheduledTaskTrigger -Daily -At $TriggerTime
$Principal = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Administrators" -RunLevel Highest
$Settings = New-ScheduledTaskSettingsSet

try {
    Register-ScheduledTask -TaskName $TaskName -Action $Action -Trigger $Trigger -Principal $Principal -Settings $Settings -Description $TaskDescription
    Write-Host "Der geplante Task wurde erfolgreich erstellt." -ForegroundColor Green
} catch {
    Write-Host "Fehler beim Erstellen des geplanten Tasks: $($_.Exception.Message)" -ForegroundColor Red
}
