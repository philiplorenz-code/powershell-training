# Vorteile:
# Übersichtlichkeit -> Reduzieren der Code-Menge in Haupt-File
# Wiederverwendbarkeit -> Funktion muss nur ein mal geschrieben werden und kann überall verwendet werden
# Wartbarkeit -> Code muss nur ein einer Stelle gepflegt werden
# Schnellere Entwicklungszeit (auch wenn dies anfangs nicht so wirkt)
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-7.3

Function Get-PSVersion {
  <#
  .SYNOPSIS

  Gets PS Version

  .DESCRIPTION

  Gets PS Version


  #>
  $PSVersionTable.PSVersion
}


function Get-ServiceStatus {
  param(
      [string]$ServiceName
  )

  $service = Get-Service -Name $ServiceName
  $status = $service.Status

  return "$ServiceName ist aktuell im Status $status."
}

# Hier rufen wir die Funktion auf
$status = Get-ServiceStatus -ServiceName "wuauserv"



# Scopes
function Get-LocalVariable {
  $localVariable = "Ich bin eine lokale Variable."
  Write-Output $localVariable
}

function Get-GlobalVariable {
  Write-Output $global:globalVariable
}

$global:globalVariable = "Ich bin eine globale Variable."

# Hier rufen wir die Funktion Get-LocalVariable auf
Get-LocalVariable

# Hier versuchen wir, die lokale Variable auszugeben
Write-Output $localVariable

# Hier rufen wir die Funktion Get-GlobalVariable auf
Get-GlobalVariable

# Hier geben wir die globale Variable aus
Write-Output $global:globalVariable

