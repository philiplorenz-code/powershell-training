# Filter mit Where:
Get-ChildItem C:\Users\philip\Code\stueckliste | Get-Member
Get-ChildItem C:\Users\philip\Code\stueckliste | Where-Object {$_.LastAccessTime -gt (Get-Date).AddMinutes((-10))}

# Achtung - lieber mit CMDlet-Parameter filtern, falls möglich:
Get-ChildItem C:\Users\philip\Code\powershell-training\04automatisierung | Where-Object {$_.Name -like "01-securi*"}
Get-ChildItem C:\Users\philip\Code\powershell-training\04automatisierung -Name "01-securi*"



# Wechsel auf Partition C
Set-Location C:\logs
# Fragt alle Elemente des aktuellen Verzeichnisses rekursiv (Unterordner werden ebenfalls abgefragt) ab und speichert diese in einer Variable 
$AllFiles = Get-ChildItem -Recurse
$AllFiles   | Where-Object {$_.Extension -eq ".log"} `
            | Select-Object FullName,IsReadOnly,CreationTime,LastWriteTime,LastAccessTime `
            | Out-GridView
            
            # Selektiert die Ausgabe nach einen gewissen Attribut (und einem ausgewählten Wert)
            # Legt die anzuzeigenden Attribute fest (* steht dabei für alle Attribute)
            # Möglichkeit sich das Ergebnis in einem grafischen Interface anzeigen zu lassen