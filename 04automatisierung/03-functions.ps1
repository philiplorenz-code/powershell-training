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


function Write-Log {
  [CmdletBinding()]
  param(
      [Parameter()]
      [ValidateNotNullOrEmpty()]
      [string]$Message,

      [Parameter()]
      [ValidateNotNullOrEmpty()]
      [ValidateSet('Information','Warning','Error')]
      [string]$Severity = 'Information'
  )

  [pscustomobject]@{
      Time = (Get-Date -f g)
      Message = $Message
      Severity = $Severity
  } | Export-Csv -Path "$env:Temp\LogFile.csv" -Append -NoTypeInformation
}